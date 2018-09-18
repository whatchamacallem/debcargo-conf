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

+ rustfmt https://github.com/rust-lang-nursery/rustfmt

Immediate goals
===============

The lists below are calculated using some combinations of running::

  tests/sh/cargo-tree-deb-rec <binary-crate>

from the ``debcargo.git`` repository.


Ready for upload (Request For Sponsor)
--------------------------------------

These packages (RFS) are prepared in the master branch and can be uploaded 
because all required dependencies are available in main::

    block-buffer (blocked by block-padding)

Delayed/problematic::

    bitflags-0.9.1 -- dependency of
        pulldown-cmark  https://github.com/google/pulldown-cmark/pull/139
    winapi-0.2.8 -- dependency of mio, iovec, etc
        iovec           https://github.com/carllerche/iovec/issues/16
        see also https://salsa.debian.org/rust-team/debcargo/issues/14
    digest -- dependency of sha2
        generic-array-0.9   https://github.com/RustCrypto/traits/issues/23
    no-panic -- optional dependency of ryu
        fails to compile on stable (attribute proc macros are currently unstable (see issue #38356))
    mio -- dependency of tokio
        outdated windows deps   https://github.com/carllerche/mio/issues/870
    crossbeam-utils-0.3.2 -- ???
    lazycell-0.6.0 -- dependency of mio, cargo-0.27
        ^ fixed in mio master
    gcc-0.3.54 -- ???
    owning_ref -- dependency of lock_api <- parkinglot <- crossbeam-channel <- ignore <- ripgrep
        https://github.com/Amanieu/parking_lot/issues/93
    winutil -- dependency of hostname <- resolv-conf <- trust-dns-resolver
        doesn't build on linux

    parking_lot (blocked by lock_api)
    indicatif (blocked by parking_lot)
    statistical (blocked by num & co)
    hyperfine (blocked by indicatif & statistical)

infinity0: I've omitted the above for now since they are older versions, let's
try to get the reverse-dependent crates using the latest versions of them.

Avoided, for now::

    miniz-sys-0.1.10
        flate2 was patched to not use miniz, hopefully this works.
        if not we can package miniz as a static C lib then miniz-sys

Unblocking testing migrations
-----------------------------

Packages that are unblocked by uploads in NEW::

    cc (cmake, nix, ctrlc, os-pipe, sha2-asm, most *-sys crates)
        rayon
            rayon-core
                crossbeam-deque (NEW)
    nodrop (arrayvec, crossbeam-epoch)
        nodrop-union (NEW)
    rand (jobserver, tempfile)
        stdweb
            discard (NEW)
            stdweb-derive (NEW)
            stdweb-internal-macros
                base-x (NEW)
            stdweb-internal-runtime (RFS)
    language-tags
        heapsize (NEW)

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

dependencies of debcargo
------------------------

Roughly in dependency order, i.e. earlier packages have less dependencies.
Some versions might be out-of-date::

    semver v0.9.0 -- soft-blocked on https://github.com/steveklabnik/semver/pull/174
      if it takes too long then we'll have to just upload semver-parser 0.7
    - flate2 v1.0.2
    - backtrace-sys v0.1.23 -- perhaps first package libbacktrace as a separate deb package
    backtrace v0.3.9
    failure v0.1.2
    + curl v0.4.14 -- depends on old winapi 0.2, try to update it, see https://github.com/alexcrichton/curl-rust/pull/204
      or just backport the patch since it wouldn't affect anything anyways
      see also https://salsa.debian.org/rust-team/debcargo/issues/14
    git2-curl v0.8.1
    crates-io v0.17.0
    cargo v0.29.0 -- need to patch cargo 0.29 to use lazycell 1 instead of 0.6, I've tested it and it "just works"

dependencies of mdbook/exa
--------------------------

To regenerate the below list; run something like::

    for c in <CRATES>; do \
      debcargo.git/tests/sh/cargo-tree-deb-rec $c; done \
    | sed -e 's/ v/ /g' \
    | dev/filter-semver.sh \
    | awk '!x[$0]++' \
    | dev/filter-in-debian.sh \
    | sed -nre 's/(.*) 0$/\1/gp'

Results as of 2018-08-03::

    winapi 0.2
    pad 0.1
    num-traits 0.1
    nom 1
    locale 0.2 - pending
    kernel32-sys 0.2
    iso8601 0.1 - blocked by https://github.com/badboy/iso8601/pull/19
    datetime 0.4 - blocked by iso8601
    byteorder 0.4
    zoneinfo_compiled 0.4 - blocked by datetime
    utf8-ranges 0.1
    users 0.5
    thread-id 2 - pending
    thread_local 0.2
    regex-syntax 0.3
    memchr 0.1
    aho-corasick 0.5
    regex 0.1
    log 0.3
    libgit2-sys 0.6
    lazy_static 0.2
    libssh2-sys 0.2
    curl-sys 0.4
    bitflags 0.9
    git2 0.6
    env_logger 0.3
    ansi_term 0.8
    exa 0.8
    ws2_32-sys 0.2
    slab 0.3
    miow 0.2
    lazycell 0.6
    iovec 0.1
    mio 0.6
    bytes 0.4
    ws 0.7
    traitobject 0.1
    unsafe-any 0.4
    unicode-xid 0.0
    unicase 1
    typemap 0.3
    typeable 0.1
    backtrace-sys 0.1
    backtrace 0.3
    error-chain 0.12
    toml-query 0.7
    new_debug_unreachable 1
    mac 0.1
    futf 0.1
    tendril 0.4
    synom 0.11
    proc-macro2 0.3
    quote 0.5
    syn 0.13
    quote 0.3
    syn 0.11
    strum_macros 0.9
    strum 0.9
    phf_shared 0.7
    phf_generator 0.7
    string_cache_codegen 0.4
    precomputed-hash 0.1
    string_cache 0.7
    sequence_trie 0.3
    safemem 0.2
    plugin 0.2
    phf_codegen 0.7
    phf 0.7
    modifier 0.1
    mime 0.2
    mime_guess 1
    base64 0.6
    hyper 0.10
    iron 0.6
    mount 0.4
    staticfile 0.5
    slab 0.1
    pulldown-cmark 0.1
    pest 1
    pest_derive 1
    open 1
    bitflags 0.4
    nix 0.5
    miow 0.1
    bytes 0.3
    mio 0.5
    inotify 0.3
    fsevent-sys 0.1
    bitflags 0.7
    fsevent 0.2
    filetime 0.1
    notify 4
    markup5ever 0.7
    maplit 1
    html5ever 0.22
    handlebars 0.32
    rust-stemmers 1
    elasticlunr-rs 2
    ammonia 1
    mdbook 0.2

dependencies of sniffglue
-------------------------

Status as of 2018-08-10::

    digest 0.7 -- blocked by generic-array 0.9, https://github.com/RustCrypto/traits/issues/23
    dns-parser 0.8 -- pending
    phf 0.7 -- pending
    phf_generator 0.7 -- pending (with this patch, https://github.com/sfackler/rust-phf/issues/126)
    block-buffer 0.3 -- RFS
    phf_codegen 0.7 -- blocked by phf_generator
    sha2 0.7 -- blocked by block-buffer, digest
    tls-parser 0.6 -- blocked by phf, phf_codegen
