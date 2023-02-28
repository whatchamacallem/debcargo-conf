#!/usr/bin/env python3

USAGE = 'Usage: dev/chain_build.py <CRATE>[=<REALVER>] <CRATE2>[=<REALVER>] ...'

f'''
Build a chain of packages, each having all previous packages as "extra
dependency deb" as in build.sh. It fails when one in the chain fails to
build, and picks up where it stopped next time by checking which packages
have been recently built.

This script expects to run at the root of the debcargo-conf repository.

{USAGE}

Env vars:
- DISTRIBUTION
- CHROOT
- SBUILD_OPTS
- EXTRA_DEBS
Those env vars are passed to build.sh, read it for their descriptions.
'''

import re
from sys import argv
from subprocess import run
from time import time as now_ts
from os import getcwd, chdir, walk, stat, environ
from os.path import exists, isdir, join


def _todash(crate: str) -> str:
	return crate.replace('_', '-')


def _print(*args):
	print('\n### chain_build ###\n', *args, '\n')


DCH_VER_RE = re.compile(r'\((.*?)\)')
def _get_dch_version(crate: str) -> str:
	# normally we check if there is a match, but a valid d/changelog should
	# always have one
	return DCH_VER_RE.search(open(join('src', _todash(crate), 'debian', 'changelog')).readline()).group(1)


def find_built(specs: list[tuple[str, str | None]]) -> list[tuple[str, str]]:
	# get all debs first, so we needn't walk again and again
	debs = []
	for dirpath, _, files in walk('build', topdown=True):
		if dirpath != 'build':
			# we have topdown=True, so it's safe to cut off
			break
		for file in files:
			if file.endswith('.deb'):
				# we build in `build/` anyway
				debs.append(file)

	now = now_ts()
	built = []
	for crate, ver in specs:
		for deb in debs:
			if ver is None:
				try:
					ver = _get_dch_version(crate)
				except:
					continue
			# if the deb exists and it's younger than one day (86400 secs), we
			# consider it "fresh"
			if f'{_todash(crate)}-dev_{ver}' in deb and stat(join('build', deb)).st_mtime + 86400 >= now:
				built.append((crate, deb))
	return built


COLL_LINE = 'collapse_features = true'
def collapse_features(crate: str):
	f = open(join('src', _todash(crate), 'debian', 'debcargo.toml'), 'r+')
	toml = f.read()
	if COLL_LINE not in toml:
		# below is to avoid inserting at end ending up in [some.directive]
		lines = toml.split('\n')
		for i, line in enumerate(lines):
			if line.startswith('['): #] to work around auto indent in my nvim
				lines.insert(i, COLL_LINE)
				lines.insert(i + 1, '')
				f.seek(0)
				f.write('\n'.join(lines))
				f.close()
				return


def build_one(crate: str, ver: str | None, prev_debs: list[str]):
	env = environ.copy()
	if ver is not None:
		env['REALVER'] = ver
	# to skip pager and carry on
	env['GIT_PAGER'] = 'true'
	# \n is for when update.sh stops for confirmation
	run(('./update.sh', crate), env=env, input=b'\n')
	env['EXTRA_DEBS'] = ','.join(prev_debs)
	collapse_features(crate)
	chdir('build')
	run(('./build.sh', crate), env=env)
	chdir('..')


def parse_specs(specs: tuple[str]) -> list[tuple[str, str | None]]:
	parsed = []
	for spec in specs:
		if '=' in spec:
			parsed.append(spec.split('='))
		else:
			parsed.append((spec, None))
	return parsed


def chain_build(specs):
	specs = parse_specs(specs)
	built = find_built(specs)
	try:
		built, debs = map(list, zip(*built))
		print('Found recently built debs:')
		for i in range(len(built)):
			print(built[i], debs[i])
	except:
		built, debs = [], []
		print('No recently built packages')

	input('Starting chain build, press any key to continue, Ctrl+C to abort')

	for crate, ver in specs:
		if crate in built:
			continue
		_print('Start building', crate, 'version', ver, 'with previous debs', debs)
		build_one(crate, ver, debs)
		built.append(crate)
		# use wildcard here to save some cost `walk`ing again
		if ver is None:
			ver = '-'
		debs.append(f'*{crate}*{ver}*.deb')


if __name__ == '__main__':
	cwd = getcwd()
	if not (isdir(join(cwd, 'build')) and exists(join(cwd, 'build.sh'))):
		print('Please run this script at root of debcargo-conf')
		exit(1)

	if len(argv) < 2:
		print(USAGE)
		exit(1)

	if ' ' in argv[1]:
		argv[1:] = list(filter(lambda a: a != '', argv[1].split(' ')))
	chain_build(argv[1:])

