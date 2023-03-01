#!/usr/bin/env python3

USAGE = 'Usage: dev/chain_build.py <CRATE>[=<REALVER>] <CRATE2>[=<REALVER>] ...'

f'''
Build a chain of packages, each having all previous packages as "extra
dependency deb" as in build.sh. It fails when one in the chain fails to
build, and picks up where it stopped next time by checking which packages
have been recently built.

This script needs python-apt to work.

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
from sys import argv, stdout
from subprocess import run
from time import time as now_ts
from os import getcwd, chdir, stat, environ
from os.path import exists, isdir, join
try:
	from apt.cache import Cache as AptCache
except:
	print('This scripts depends on python-apt to work, apt install python3-apt and rerun')
	exit(1)


aptc = AptCache()


def _todash(crate: str) -> str:
	return crate.replace('_', '-')


def _print(*args):
	if stdout.isatty():
		print('\n\x1b[34;100m[chain_build]\x1b[;m', *args, '\n')
	else:
		print('[chain_build]', *args, '\n')


# this is actually faster than os.walk
def _find(pattern: str):
	 return run(f'ls {pattern}', shell=True, capture_output=True, check=True, text=True).stdout.strip().split('\n')


DCH_VER_RE = re.compile(r'\((.*?)\)')
def _get_dch_version(crate: str) -> str:
	# normally we check if there is a match, but a valid d/changelog should
	# always have one
	return DCH_VER_RE.search(open(join('src', _todash(crate), 'debian', 'changelog')).readline()).group(1)


def find_built(specs: list[tuple[str, str | None]]) -> list[tuple[str, str, str]]:
	# get all debs first, so we needn't walk again and again
	chdir('build')
	debs = _find('*.deb')
	chdir('..')
	now = now_ts()
	built = []
	_print('Conducting search in apt cache and build/ directory for already built debs')
	for crate, ver in specs:
		_crate = _todash(crate)
		if ver is None:
			try:
				ver = _get_dch_version(crate)
			except:
				# version isn't specified, and d/changelog doesn't exist,
				# means it's yet to be `./update.sh`d, move on
				continue
		pkg = aptc.get('librust-{_crate}-dev')
		if pkg is not None and pkg.candidate.version.startswith(ver):
			built.append((crate, pkg.candidate.version, 'apt'))
			continue
		for deb in debs:
			# if the deb exists and it's younger than one day (86400 secs), we
			# consider it "fresh"
			if f'{_crate}-dev_{ver}' in deb and stat(join('build', deb)).st_mtime + 86400 >= now:
				built.append((crate, deb, 'build'))
	return built


COLL_LINE = 'collapse_features = true'
def collapse_features(crate: str):
	f = open(join('src', _todash(crate), 'debian', 'debcargo.toml'), 'r+')
	toml = f.read()
	if COLL_LINE not in toml:
		_print('writing collapse_features for', crate)
		lines = toml.split('\n')
		for i, line in enumerate(lines):
			# avoid inserting at end ending up in [some.directive]
			if line.startswith('['): #] to work around auto indent in my nvim
				lines.insert(i, COLL_LINE)
				lines.insert(i + 1, '')
				f.seek(0)
				f.write('\n'.join(lines))
				f.close()
				return True
		f.write('\n')
		f.write(COLL_LINE)
		f.close()
		return True


def build_one(crate: str, ver: str | None, prev_debs: list[str]):
	env = environ.copy()
	if ver is not None:
		env['REALVER'] = ver
	# prevent git from stopping us with a pager
	env['GIT_PAGER'] = 'cat'
	# \n is for when update.sh stops for confirmation
	run(('./update.sh', crate), env=env, input=b'\n', check=True)
	# if not set before, rerun ./update.sh to enable it
	if collapse_features(crate):
		run(('./update.sh', crate), env=env, input=b'\n', check=True)
	env['EXTRA_DEBS'] = ','.join(prev_debs)
	chdir('build')
	run(('./build.sh', crate), env=env, check=True)
	chdir('..')


def parse_specs(specs: tuple[str]) -> list[tuple[str, str | None]]:
	parsed = []
	for spec in specs:
		if '=' in spec:
			crate, ver = spec.split('=')
			# filter out 1.2.3+surplus-version-part
			parsed.append((crate, ver.split('+')[0]))
		else:
			parsed.append((spec, None))
	return parsed


def chain_build(specs):
	specs = parse_specs(specs)
	built = find_built(specs)
	if built:
		_print('Existing debs:')
		for crate, deb, kind in built:
			if kind == 'build':
				print(crate, deb)
			elif kind == 'apt':
				print(carte, deb, 'in apt repository')
		built, debs, _ = map(set, zip(*built))
		_print('To be built:')
		for crate, ver in specs:
			if crate not in built:
				if ver is None:
					ver = _get_dch_version(crate)
				print(crate, ver)
	else:
		built, debs = set(), set()
		_print('No recently built packages')

	_print('Starting chain build, press any key to continue, Ctrl+C to abort')
	input()

	for crate, ver in specs:
		if crate in built:
			continue
		_print('Start building', crate, 'version', ver, 'with previous debs', debs)
		try:
			build_one(crate, ver, debs)
		except Exception as e:
			print(e)
			_print(f'Failed to build crate {crate}. Please fix it and rerun the same command to resume the build chain.')
			exit(1)
		built.add(crate)
		if ver is None:
			# used in a glob, so
			ver = '-'
		debs.add(_find(f'build/*{_todash(crate)}-dev*{ver}*.deb')[0][6:])


if __name__ == '__main__':
	cwd = getcwd()
	if not (isdir(join(cwd, 'build')) and exists(join(cwd, 'build.sh'))):
		_print('Please run this script at root of debcargo-conf')
		exit(1)

	if len(argv) < 2:
		print(USAGE)
		exit(1)

	i = 1
	while i < len(argv):
		if ' ' in argv[i]:
			argv[i:] = list(filter(lambda a: a != '', argv[1].split(' '))) + argv[i + 1:]
		i += 1
	chain_build(argv[1:])

