===============
Immediate goals
===============

See end of this document for "eventual goals".


Remove old libraries
====================

Should file a RM request to ftpmasters for these old crates:

(no old crates, yay!)


Ready for upload (Request For Sponsor)
======================================

If you do not have upload rights, simply ``touch src/$crate/debian/RFS`` in
your crate's directory, commit and push it, and a DD or DM will get around to
it at some point.

To list all packages under RFS, run ``dev/list-rfs.sh``.

If your update breaks semver compatibility, please first check the reverse
dependencies by running::

    $ aptitude search '~Dlibrust-$cratename'

and try to verify that they won't be broken by your update, by building them.
If they are broken, then:

1. Document the problem in ``debian/BLOCK``.
2. File an issue upstream to report that they should update to the new library
3. Write a patch if you can get that working, and document it.


Unblocking testing migrations
=============================

Run ``dev/rust-excuses.mk refresh all`` to see these in a nice graph.

Run ``dev/rust-regressions.sh`` to analyse autopkgtest regressions.

From the excuses graph, find the lowest crates i.e. those with no arrows going
outwards to other crates. Then run ``dev/list-rdeps.sh @ $lowest_crotes`` to
see which of its rdeps are broken, and need to be fixed.


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
[ ] syn-0.11.11
[ ] synom
[ ] unicode-xid-0.0.4


bench
-----
* criterion
  * criteron-plot

rustup
------

* rustup (not available as a crate)
 * git-testament
   * git-testament-derive
 * markdown
   * pipeline
 * retry
 * xz2

==============
Eventual goals
==============

Binary crates worth packaging (please add if you know more):

- bench - simple benchmarking
- bingrep - Grep through binaries from various OSs and architectures.
- brewstillery - Brewer's, vinter's and distiller's calculator (GTK).
- cargo-download - Download sources of a crate
- cargo-edit - Cargo editing subcommands (add, rm, upgrade)
- hg - Rust implement of hg
- jql - JSON Query Language CLI tool.
- recode_rs -  CLI tool converting between the character encodings.
- rural - User-friendly command-line HTTP tool
- rustfmt-nightly - rust coding style
- rustup - installing and managing multiple rust toolchains
- tmux-hints - Find matches (e.g. urls) and navigate them by keyboard
- xsv - Command line program for manipulating CSV files

To see lists of interesting binary crates, you can run something like::

  $ apt-get install koji-client
  $ koji -p fedora search package 'rust-*' | cut -b6- | dev/filter-binary-crates.sh

Current output (on 2020-01-17), minus stuff already in Debian, is:

  afterburn
  alloc-no-stdlib
  alloc-stdlib
  askalono-cli
  brotli
  brotli-decompressor
  cargo-c
  comrak
  coreos-installer
  ffsend
  heatseeker
  jql
  lsd
  multipart
  open
  permutate
  pretty-git-prompt
  qrcode
  skim
  starship
  varlink-cli
  varlink_generator

Sccache is also helpful for reducing the build-time of things like firefox and thunderbird

- sccache https://github.com/mozilla/sccache

There are also more binaries here:

https://github.com/rust-unofficial/awesome-rust
