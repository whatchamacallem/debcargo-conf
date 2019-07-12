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

    packed_simd
    darling_core
    gettext-rs
    env_proxy (update)
    num_cpus (update)
    pest_meta (update)
    rusty-tags (update)
    tempfile (update)
    atk
    glib (update, introduces new feature)
    gio (update, introduces new feature)
    cairo-rs (update, introduces new feature)
    pango (update, introduces new feature)
    gdk (update, introduces new feature)
    gtk (update, introduces new feature)
    bumpalo
    getrandom
    md5-asm
    rand_core 0.3.0 (so we can update rand_core to 0.5.0)
    stackvector
    static_assertions
    doc-comment
    diesel
    sha3
    nom 4.2.3 (so we can update nom to 5.0.0)
    glob (update)
    toml (update, introduces new feature)
    toml_edit (previous upload rejected due to missing entry in d/copyright)
    hostname
    ppv-lite86
    ipnetwork
    ipconfig
    caps
    data-encoding-macro-internal
    users (update)

Delayed/problematic::

    md5 (update) -- affects uuid
    gcc -- don't need this, completely obsoleted by cc.
        patch dependents to use cc instead.
    winutil -- dependency of hostname <- resolv-conf <- trust-dns-resolver
        doesn't build on linux
    nom 4.2
        unblocks pktparse
        unblocks der-parser

    trust-dns-proto
        librust-socket2-0.3+default-dev (>= 0.3.9-~~)
        librust-tokio-timer-0.2+default-dev (>= 0.2.10-~~)

    fuse (blocked by thread-scoped)
    indicatif (blocked by parking_lot)
    sandboxfs (blocked by fuse and signal-hook)
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
[ ] cast
[ ] criterion
[ ] criterion-plot
[ ] criterion-stats
[ ] cssparser
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
[ ] thread-scoped (NEW)
[ ] unicode-xid-0.0.4


ripgrep (new version)
---------------------

* ripgrep
  * bstr (in NEW)
  * grep 0.2.4
    * grep-cli 0.1.2
    * grep-pcre2
      * pcre 0.2
    * grep-printer 0.1.2
      * bstr (NEW)
      * grep-searcher 0.1.4
        * bstr (NEW)
  * ignore 0.4.7
    * globset 0.4.3
      * bstr (NEW)


bench
-----
* criterion
  * cast (NEW)
  * criteron-plot
    * cast (NEW)
  * rand-xoshiro (NEW)
  * tinytemplate (NEW)

sequoia-sqv
-----------
* sequoia-sqv
  * sequoia-openpgp (needs upstream fix to move to base64 0.10, see: https://gitlab.com/sequoia-pgp/sequoia/merge_requests/166)
    * memsec
      * getrandom
        * fuchsia-cprng (NEW)
        * libc (>= 0.2.54, needs upgrade)
    * lalrpop (needs sequoia upstream fix to move to 0.17, see: https://gitlab.com/sequoia-pgp/sequoia/merge_requests/165)
      * lalrpop-util (NEW)
      * ascii-canvas (NEW)
    * buffered-reader (NEW)
    * nettle
      * nettle-sys (NEW)

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
