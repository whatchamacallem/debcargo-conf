===============
Immediate goals
===============

See end of this document for "eventual goals".


Remove old libraries
====================

Should file a RM request to ftpmasters for these old crates:

- syntex-* were uploaded by mistake, only rustfmt 0.10 (obsolete version) depends on them
- crossbeam-utils-0.2, no longer needed
- bitflags-0.9, was required only by pulldown-cmark pre 0.2.0
- owning-ref-0.3, was required only by lock-api pre 0.1.5


Ready for upload (Request For Sponsor)
======================================

If you do not have upload rights, simply `touch src/$crate/debian/RFS` in your
crate's directory, commit and push it, and a DD or DM will get around to it at
some point.

To list all packages under RFS, run `dev/list-rfs.sh`.

If your update breaks semver compatibility, please first check the reverse
dependencies by running::

    $ aptitude search '~Dlibrust-$cratename'

and try to verify that they won't be broken by your update, by building them.
If they are broken, then:

1. Document the problem in `debian/BLOCK`.
2. File an issue upstream to report that they should update to the new library
3. Write a patch if you can get that working, and document it.


Unblocking testing migrations
=============================

Run ``dev/rust-excuses.mk refresh all`` to see these in a nice graph.


New packages
============

Use ``dev/list-remaining-deps.sh`` to help you figure out what's missing.

rustfmt-nightly
---------------

* rustc-ap-syntax
  * rustc-ap-rustc_data_structures (prepared)
    * rustc-ap-graphviz (needs nightly)
    * rustc-ap-rustc-cratesio-shim (needs nightly)
  * rustc-ap-rustc-errors (depends on the rest of the list here)
  * rustc-ap-rustc-target
  * rustc-ap-serialize (to be uploaded, dep issue?!)
  * rustc-ap-syntax-pos
  * rustc-ap-serialize (fails because of usage of nightly feature)

bingrep
-------

* hexplay
* metagoblin
* prettytable-rs
* scroll

tokei
-----

needs handlebars
which needs pest
which needs ucd-trie

librsvg
-------

see https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=907629

[ ] alga
[ ] c_vec
[ ] criterion
[ ] criterion-plot
[ ] criterion-stats
[ ] downcast-rs
[ ] handlebars
[ ] itertools-num
[ ] matrixmultiply
[ ] nalgebra
[ ] num-traits-0.1.43
[ ] pest_derive
[ ] quote-0.3.15
[ ] rand-0.4.2
[ ] rawpointer
[ ] simplelog
[ ] syn-0.11.11
[ ] synom
[ ] unicode-xid-0.0.4


bench
-----
* criterion
  * cast (NEW)
  * criteron-plot
    * cast (NEW)
  * rand-xoshiro (NEW)
  * tinytemplate (NEW)

rustup
------

* rustup (not available as a crate)
 * git-testament
   * git-testament-derive
 * markdown
   * pipeline
 * rand
   * rand_core
   * rand_hc
 * retry
 * scopeguard
 * wait-timeout
 * xz2
   * lzma-sys

==============
Eventual goals
==============

Binary crates worth packaging (please add if you know more):

- xsv - Command line program for manipulating CSV files
- cargo-download - Download sources of a crate
- cargo-edit - Cargo editing subcommands (add, rm, upgrade)
- tmux-hints - Find matches (e.g. urls) and navigate them by keyboard
- rural - User-friendly command-line HTTP tool
- brewstillery - Brewer's, vinter's and distiller's calculator (GTK).
- jql - JSON Query Language CLI tool.
- recode_rs -  CLI tool converting between the character encodings.
- rustfmt-nightly - rust coding style
- bingrep - Grep through binaries from various OSs and architectures.
- hg - Rust implement of hg
- bat - A cat clone with syntax highlighting, Git integration, and more.
- bench - simple benchmarking
- sequoia-sqv - streamlined OpenPGP signature validation tool
- rustup - installing and managing multiple rust toolchains

To see lists of interesting binary crates, you can run something like::

  $ apt-get install koji-client
  $ koji -p fedora search package 'rust-*' | cut -b6- | dev/filter-binary-crates.sh

Current output (on 2018-07-08) is:

- aho-corasick
- docopt
- cpp_demangle
- permutate
- cbindgen
- rustdoc-stripper
- difference
- pretty-git-prompt
- peg
- varlink
- varlink-cli

Sccache is also helpful for reducing the build-time of things like firefox and thunderbird

- sccache https://github.com/mozilla/sccache

There are also more binaries here:

https://github.com/rust-unofficial/awesome-rust
