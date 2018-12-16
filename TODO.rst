=================
Crates to package
=================

Eventual goals
==============

Binary crates worth packaging (please add if you know more):

- xsv - Command line program for manipulating CSV files
- process_viewer - Process viewer GUI in rust (GTK)
- cargo-edit - Cargo editing subcommands (add, rm, upgrade)
- exa - Modern replacement for ls
- tmux-hints - Find matches (e.g. urls) and navigate them by keyboard
- grcov - collects and aggregates code coverage information for multiple source files.
- rural - User-friendly command-line HTTP tool
- brewstillery - Brewer's, vinter's and distiller's calculator (GTK).
- jql - JSON Query Language CLI tool.
- recode_rs -  CLI tool converting between the character encodings.
- rusty-tags - Create ctags files for cargo project.
- rustfmt-nightly - rust coding style
- bingrep - Grep through binaries from various OSs and architectures.

To see lists of interesting binary crates, you can run something like::

  $ apt-get install koji-client
  $ koji -p fedora search package 'rust-*' | cut -b6- | dev/filter-binary-crates.sh

Current output (on 2018-07-08) is:

- aho-corasick
- docopt
- exa
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

Immediate goals
===============

The lists below are calculated using some combinations of running::

  tests/sh/cargo-tree-deb-rec <binary-crate>

from the ``debcargo.git`` repository.


Remove old libraries
--------------------

Should file a RM request to ftpmasters for these old crates:

- syntex-* were uploaded by mistake, only rustfmt 0.10 (obsolete version) depends on them
- crossbeam-utils-0.2, no longer needed


Ready for upload (Request For Sponsor)
--------------------------------------

When adding a package here, and it involves updating an existing package in a
semver-incompatible way, please check the reverse dependencies by running::

    $ aptitude search '~Dlibrust-$cratename'

and try to verify that they won't be broken by your update. If they are, then:

1. Document it below ("Delayed/problematic")
2. File an issue upstream to report that they should update to the new library
3. Write a patch if you can get that working, and document it also below.

These packages (RFS) are prepared in the master branch and can be uploaded
because all required dependencies are available in main::

    newtype-derive
    encoding-rs (update)
    serde-json (update)
    syn (update)
    libc (update)

Delayed/problematic::

    flate2 (update) -- waiting on crc32fast in NEW
    md5 (update) -- affects uuid
    tokio-executor (update), tokio-timer (update)
        latest versions needs crossbeam-utils 0.6, see below
    crossbeam-utils (update 0.5 → 0.6)
        too much other stuff depends on crossbeam-utils 0.5, so that is now in NEW
        this can be updated to 0.6 when crossbeam-utils-0.5 passes NEW
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
-----------------------------

Packages that are unblocked by uploads in NEW::

    cc (cmake, nix, ctrlc, os-pipe, sha2-asm, most *-sys crates)
        rayon (NEW)
    rand (jobserver, tempfile)
        stdweb
            stdweb-internal-macros (TODO)
    clap (ripgrep, structopt)
        yaml-rust (NEW)
        text-wrap
            hyphenation
                hyphenation_commons (NEW)

Unblocking crate updates
------------------------

Updates that require updates of other packages::

    env_logger (update to 0.5.13)


All-features transitive dependencies of ripgrep
-----------------------------------------------

These are NOT needed to build ripgrep (we only test that `cargo build` works
with default features) but *are* needed for ripgrep to enter testing. They are
all of the transitive build-dependencies of *all the features* of ripgrep.

Top-level page: https://qa.debian.org/excuses.php?package=rust-ripgrep

- hyphenation, needed by
    https://qa.debian.org/excuses.php?package=rust-textwrap
    pocket-resources
    hyphenation-commons
      - still using a ton of old libraries like serde 0.8 with a bigger tree underneath
      - https://github.com/tapeinosyne/hyphenation/issues/12
    unicode-segmentation
- yaml-rust, needed by
    https://qa.debian.org/excuses.php?package=rust-clap
    also linked-hash-map as a dependency of this

dependencies of mdbook/exa
--------------------------

tldr: exa needs zoneinfo_compiled (in NEW)
We will need to update some versions of the dep. Besides that, we should be good.

To regenerate the below list; run something like::

    for c in <CRATES>; do \
      debcargo.git/tests/sh/cargo-tree-deb-rec $c; done \
    | sed -e 's/ v/ /g' \
    | dev/filter-semver.sh \
    | awk '!x[$0]++' \
    | dev/filter-in-debian.sh \
    | sed -nre 's/(.*) 0$/\1/gp'

dependencies of rustfmt-nightly
-------------------------------

Needs:
* derive-new (in NEW)
* cargo-metadata (in NEW)
* rustc-ap-syntax
  * rustc-ap-rustc-data-structures
  * rustc-ap-rustc-errors
  * rustc-ap-rustc-target
  * rustc-ap-serialize (to be uploaded, dep issue?!)
  * rustc-ap-syntax-pos

