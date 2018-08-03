=================
Crates to package
=================

Eventual goals
==============

To see lists of interesting binary crates, you can run something like::

  $ apt-get install koji-client
  $ koji -p fedora search package 'rust-*' | cut -b6- | dev/filter-binary-crates.sh

Current output (on 2018-07-08) is:

- aho-corasick
- docopt
- pulldown-cmark
- ripgrep
- fd-find
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


Ready for upload (Request For Sponsor)
--------------------------------------

These packages are prepared in the master branch and can be uploaded because
all required dependencies are available in main::

    url-serde

Delayed/problematic::

    bitflags-0.9.1 -- dependency of pulldown-cmark
    winapi-0.2.8 -- dependency of mio, iovec, etc
    safemem-0.2.1 -- dependency of base64 <- hyper
    miniz-sys-0.1.10 -- dependency of flate2 <- cargo <- debcargo
    crossbeam-utils-0.3.2 -- ???
    lazycell-0.6.0 -- dependency of mio, cargo-0.27
    gcc-0.3.54 -- ???

infinity0: I've omitted the above for now since they are older versions, let's
try to get the reverse-dependent crates using the latest versions of them.)

infinity0: I've also omitted miniz-sys for now because it bundles an old
version of miniz, and this should be discussed a bit further because it's not
within normal Debian practise. See upstream issues:

- https://github.com/alexcrichton/flate2-rs/issues/160
- https://github.com/alexcrichton/flate2-rs/issues/143


dependencies of debcargo
------------------------

Roughly in dependency order, i.e. earlier packages have less dependencies.
Some versions might be out-of-date::

    - serde_derive v1.0.70
    semver v0.9.0 -- soft-blocked on https://github.com/steveklabnik/semver/pull/174
      if it takes too long then we'll have to just upload semver-parser 0.7
    - libssh2-sys v0.2.7
    - curl-sys v0.4.5
    - libgit2-sys v0.7.7
    + git2 v0.7.5
    miniz-sys v0.1.10 -- perhaps first package libminiz as a separate deb package
    flate2 v1.0.2
    - synstructure v0.9.0
    + failure_derive v0.1.2
    backtrace-sys v0.1.23 -- perhaps first package libbacktrace as a separate deb package
    backtrace v0.3.9
    failure v0.1.2
    curl v0.4.14 -- depends on old winapi 0.2, try to update it, see https://github.com/alexcrichton/curl-rust/pull/204
    git2-curl v0.8.1
    - crypto-hash v0.3.1
    crates-io v0.17.0
    cargo v0.29.0 -- need to patch cargo 0.29 to use lazycell 1 instead of 0.6, I've tested it and it "just works"

dependencies of ripgrep
-----------------------

All done, waiting for upstream new release (to bump dependency versions)

https://github.com/BurntSushi/ripgrep/issues/1000

dependencies of mdbook/exa
--------------------------

This list is out-of-date, use debcargo.git/tests/sh/cargo-tree-deb-rec to regenerate::

    ansi_term-0.8.0 -- needed by exa
    bitflags-0.9.1 -- exa, mdbook
    byteorder-0.4.2 -- exa
    language-tags-0.2.2 -- mdbook
    lazy_static-0.2.11 -- exa
    mac-0.1.1 -- mdbook
    maplit-1.0.1 -- mdbook
    modifier-0.1.0 -- exa
    nom-1.2.4 -- exa
    open-1.2.1 -- mdbook
    pest-1.0.6 -- mdbook
    precomputed-hash-0.1.1 -- mdbook
    regex-syntax-0.3.9 -- exa
    - scoped_threadpool-0.1.9 -- exa
    sequence_trie-0.3.5 -- mdbook
    serde-0.9.15 -- xi-core-lib
    strum-0.9.0 -- mdbook
    - term-grid-0.1.7 - exa
    traitobject-0.1.0 -- mdbook
    typeable-0.1.2 -- mdbook
    utf8-ranges-0.1.3 -- exa
