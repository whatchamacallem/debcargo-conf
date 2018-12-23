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

When adding a package here, and it involves updating an existing package in a
semver-incompatible way, please check the reverse dependencies by running::

    $ aptitude search '~Dlibrust-$cratename'

and try to verify that they won't be broken by your update. If they are, then:

1. Document it below ("Delayed/problematic")
2. File an issue upstream to report that they should update to the new library
3. Write a patch if you can get that working, and document it also below.

These packages (RFS) are prepared in the master branch and can be uploaded
because all required dependencies are available in main::

    pledge
    rustyline
    der-parser
    gtk-rs-lgpl-docs
    maxminddb (update)
    encoding-rs (update)
    serde-json (update)
    syn (update)
    tokio-executor (update), tokio-timer (update)
    libc (update)

Delayed/problematic::

    md5 (update) -- affects uuid
    grep
        pcre2 feature depends on grep-pcre2 -> pcre2 -> pcre2-sys
    gcc-0.3.54 -- don't need this, completely obsoleted by cc.
        patch dependents to use cc instead.
    winutil -- dependency of hostname <- resolv-conf <- trust-dns-resolver
        doesn't build on linux

    parking_lot (blocked by lock_api)
    indicatif (blocked by parking_lot)
    statistical (blocked by num & co)
    hyperfine (blocked by indicatif & statistical)


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
    * ena
    * rustc-ap-graphviz
    * rustc-ap-rustc-cratesio-shim
    * rustc-rayon
    * rustc-rayon-core
  * rustc-ap-rustc-errors
  * rustc-ap-rustc-target
  * rustc-ap-serialize (to be uploaded, dep issue?!)
  * rustc-ap-syntax-pos

bingrep
-------

* hexplay
* metagoblin
* prettytable-rs
* scroll


==============
Eventual goals
==============

Binary crates worth packaging (please add if you know more):

- xsv - Command line program for manipulating CSV files
- process_viewer - Process viewer GUI in rust (GTK)
- cargo-edit - Cargo editing subcommands (add, rm, upgrade)
- tmux-hints - Find matches (e.g. urls) and navigate them by keyboard
- grcov - collects and aggregates code coverage information for multiple source files.
- rural - User-friendly command-line HTTP tool
- brewstillery - Brewer's, vinter's and distiller's calculator (GTK).
- jql - JSON Query Language CLI tool.
- recode_rs -  CLI tool converting between the character encodings.
- rusty-tags - Create ctags files for cargo project.
- rustfmt-nightly - rust coding style
- bingrep - Grep through binaries from various OSs and architectures.
- hg - Rust implement of hg

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
