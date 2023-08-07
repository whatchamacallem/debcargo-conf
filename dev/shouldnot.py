#!/usr/bin/env python3
import re
from email import message_from_string
from sys import argv

help_text = '''Usage: dev/shouldnot.py CRATE [CRATE [CRATE ...]]

Check if given crate should *not* be packaged. Reasons include

- Already packaged elsewhere
- Deprecated or archived upstream
- The crate can explode

Entries are stored in dev/shouldnot.list, read for its format.
'''


# TODO: improve stanza splitting
RE_NON_COMMENT_LINE = re.compile(r'^[^#]')
RE_WS_ONLY = re.compile(r'\s*')
blocks = open('dev/shouldnot.list').read().split('\n\n')
entries = {}
for block in blocks:
	# skip blocks with only whitespace, likely unknown extra empty lines
	if RE_WS_ONLY.fullmatch(block):
		continue
	# skip comment only blocks
	if block[0] == '#' and not RE_NON_COMMENT_LINE.match(block):
		continue
	
	msg = message_from_string(block)
	crate = msg.get('Crate')
	version = msg.get('Version')
	reason = msg.get('Reason')

	if crate is None or reason is None:
		print('Invalid stanza:\n')
		print(block)
		print('\nPlease fix it in the list file and retry.')
		exit(2)
	
	if crate not in entries:
		entries[crate] = []
	entries[crate].append((version, reason))


def show(crate):
	if crate not in entries:
		print(f'Crate {crate} is not in shouldnot.list')
		return
	print(f'Crate {crate} has {len(entries[crate])} entries:')
	for entry in entries[crate]:
		if entry[0] is not None:
			print(f'\tVersion: {entry[0]}')
		print(f'\t{entry[1]}')
		print()

if __name__ == '__main__':
	crates = argv[1:]

	if len(crates) == 0:
		print(help_text)
		exit(0)

	for crate in crates:
		show(crate)

