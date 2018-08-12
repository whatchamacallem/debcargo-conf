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


Immediate goals
===============

The lists below are calculated using some combinations of running::

  tests/sh/cargo-tree-deb-rec <binary-crate>

from the ``debcargo.git`` repository.


Ready for upload (Request For Sponsor)
--------------------------------------

These packages are prepared in the master branch and can be uploaded because
all required dependencies are available in main::

    os-pipe-0.7.0
    siphasher
    dns-parser (update to 0.8.0)
    phf
    block-buffer
    structopt
    phf_generator

Delayed/problematic::

    bitflags-0.9.1 -- dependency of
        pulldown-cmark  https://github.com/google/pulldown-cmark/pull/139
    nom-3.2.1
        tls-parser      https://github.com/rusticata/tls-parser/issues/4
        cexpr           https://github.com/jethrogb/rust-cexpr/pull/7
    winapi-0.2.8 -- dependency of mio, iovec, etc
        iovec           https://github.com/carllerche/iovec/issues/16
        see also https://salsa.debian.org/rust-team/debcargo/issues/14
    digest -- dependency of sha2
        generic-array-0.9   https://github.com/RustCrypto/traits/issues/23
    enum_primitive -- dependency of tls-parser
        num-traits 0.1 https://github.com/andersk/enum_primitive-rs/pull/16
    safemem-0.2.1 -- dependency of base64 <- hyper
    crossbeam-utils-0.3.2 -- ???
    lazycell-0.6.0 -- dependency of mio, cargo-0.27
    gcc-0.3.54 -- ???

infinity0: I've omitted the above for now since they are older versions, let's
try to get the reverse-dependent crates using the latest versions of them.

::

    miniz-sys-0.1.10 -- dependency of flate2 <- cargo <- debcargo

infinity0: I've also omitted miniz-sys for now because it bundles an old
version of miniz, and this should be discussed a bit further because it's not
within normal Debian practise. See upstream issues:

- https://github.com/alexcrichton/flate2-rs/issues/160
- https://github.com/alexcrichton/flate2-rs/issues/143


dependencies of debcargo
------------------------

Roughly in dependency order, i.e. earlier packages have less dependencies.
Some versions might be out-of-date::

    semver v0.9.0 -- soft-blocked on https://github.com/steveklabnik/semver/pull/174
      if it takes too long then we'll have to just upload semver-parser 0.7
    + miniz-sys v0.1.10 -- perhaps first package libminiz as a separate deb package
    flate2 v1.0.2
    + backtrace-sys v0.1.23 -- perhaps first package libbacktrace as a separate deb package
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
    locale 0.2
    kernel32-sys 0.2
    iso8601 0.1
    datetime 0.4
    byteorder 0.4
    zoneinfo_compiled 0.4
    utf8-ranges 0.1
    users 0.5
    thread-id 2
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

    enum_primitive 0.1 -- available in debcargo-conf but not yet in NEW
    memchr 1 -- not needed if nom-3 is patched to memchr-2
    num-traits 0.1 -- old version required by enum_primitive, https://github.com/andersk/enum_primitive-rs/pull/16/files
    digest 0.7 -- blocked by generic-array 0.9, https://github.com/RustCrypto/traits/issues/23
    cookie-factory 0.2 -- pending
    pcap 0.7 -- pending
    threadpool 1 -- pending
    phf_generator 0.7 -- RFS (with this patch, https://github.com/sfackler/rust-phf/issues/126)
    dns-parser 0.8 -- RFS
    nom 3 -- RFS
    phf 0.7 -- RFS
    block-buffer 0.3 -- RFS
    phf_codegen 0.7 -- blocked by phf_generator
    rusticata-macros 0.3 -- blocked by nom-3
    sha2 0.7 -- blocked by block-buffer, digest
    tls-parser 0.5 -- blocked by cookie-factory, enum_primitive, nom-3, phf, phf_codegen, rusticata-macros
