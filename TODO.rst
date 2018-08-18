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

    build_const
    block-buffer
    adler32
    keccak
    atoi
    dtoa-short
    smallvec
    stable_deref_trait
    procedural-masquerade
    precomputed-hash
    want
    erased-serde
    md5

Delayed/problematic::

    bitflags-0.9.1 -- dependency of
        pulldown-cmark  https://github.com/google/pulldown-cmark/pull/139
    nom-3.2.1
        cexpr           https://github.com/jethrogb/rust-cexpr/pull/7
    winapi-0.2.8 -- dependency of mio, iovec, etc
        iovec           https://github.com/carllerche/iovec/issues/16
        see also https://salsa.debian.org/rust-team/debcargo/issues/14
    digest -- dependency of sha2
        generic-array-0.9   https://github.com/RustCrypto/traits/issues/23
    tokio-io
        depends on bytes
            iovec           https://github.com/carllerche/iovec/issues/16
    no-panic -- optional dependency of ryu
        fails to compile on stable (attribute proc macros are currently unstable (see issue #38356))
    safemem-0.2.1 -- dependency of base64 <- hyper
    crossbeam-utils-0.3.2 -- ???
    lazycell-0.6.0 -- dependency of mio, cargo-0.27
    gcc-0.3.54 -- ???

infinity0: I've omitted the above for now since they are older versions, let's
try to get the reverse-dependent crates using the latest versions of them.

Avoided, for now::

    miniz-sys-0.1.10
        flate2 was patched to not use miniz, hopefully this works.
        if not we can package miniz as a static C lib then miniz-sys


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
    cookie-factory 0.2 -- pending
    pcap 0.7 -- pending
    threadpool 1 -- pending
    enum_primitive -- pending
    dns-parser 0.8 -- pending
    phf 0.7 -- pending
    phf_generator 0.7 -- pending (with this patch, https://github.com/sfackler/rust-phf/issues/126)
    rusticata-macros 1 -- pending
    block-buffer 0.3 -- RFS
    phf_codegen 0.7 -- blocked by phf_generator
    sha2 0.7 -- blocked by block-buffer, digest
    tls-parser 0.6 -- blocked by cookie-factory, enum_primitive, phf, phf_codegen, rusticata-macros


dependencies of badtouch
------------------------

Status as of 2018-08-14::

    ├── base64 v0.9.2
    │   └── safemem v0.2.0
    ├── bcrypt v0.2.0
    │   ├── base64 v0.9.2 (*)
    │   ├── blowfish v0.3.0
    │   │   ├── block-cipher-trait v0.5.3
    │   │   │   └── generic-array v0.9.0
    │   │   │       └── typenum v1.10.0
    │   │   └── opaque-debug v0.1.1
    │   └── rand v0.4.2
    ├── bufstream v0.1.3
    ├── colored v1.6.1
    ├── digest v0.7.5
    │   └── generic-array v0.9.0 (*)
    ├── error-chain v0.12.0
    │   └── backtrace v0.3.9
    │       ├── backtrace-sys v0.1.23
    ├── getch v0.2.0
    │   └── termios v0.2.2
    ├── hlua-badtouch v0.4.2
    │   └── lua52-sys v0.1.1
    │       [build-dependencies]
    │       ├── gcc v0.3.54
    │       └── pkg-config v0.3.13
    ├── hmac v0.6.2
    │   ├── crypto-mac v0.6.2
    │   │   ├── constant_time_eq v0.1.3
    │   │   └── generic-array v0.9.0 (*)
    │   └── digest v0.7.5 (*)
    ├── kuchiki v0.7.0
    │   ├── cssparser v0.23.10
    │   │   ├── cssparser-macros v0.3.4
    │   │   │   ├── phf_codegen v0.7.22
    │   │   │   │   ├── phf_generator v0.7.22
    │   │   │   │   │   └── rand v0.4.2 (*)
    │   │   │   ├── procedural-masquerade v0.1.6
    │   │   ├── dtoa-short v0.3.2
    │   │   ├── phf v0.7.22
    │   │   ├── procedural-masquerade v0.1.6 (*)
    │   │   └── smallvec v0.6.4
    │   │   [build-dependencies]
    │   │   ├── proc-macro2 v0.3.8
    │   │   │   └── unicode-xid v0.1.0 (*)
    │   │   ├── quote v0.5.2
    │   │   │   └── proc-macro2 v0.3.8 (*)
    │   │   └── syn v0.13.11
    │   │       ├── proc-macro2 v0.3.8 (*)
    │   │       ├── quote v0.5.2 (*)
    │   │       └── unicode-xid v0.1.0 (*)
    │   ├── html5ever v0.22.3
    │   │   ├── mac v0.1.1
    │   │   └── markup5ever v0.7.2
    │   │       ├── phf v0.7.22 (*)
    │   │       ├── string_cache v0.7.3
    │   │       │   ├── new_debug_unreachable v1.0.1
    │   │       │   ├── precomputed-hash v0.1.1
    │   │       │   └── string_cache_shared v0.3.0
    │   │       │   [build-dependencies]
    │   │       │   └── string_cache_codegen v0.4.1
    │   │       │       ├── phf_generator v0.7.22 (*)
    │   │       │       ├── proc-macro2 v0.3.8 (*)
    │   │       │       ├── quote v0.5.2 (*)
    │   │       │       └── string_cache_shared v0.3.0 (*)
    │   │       └── tendril v0.4.0
    │   │           ├── futf v0.1.4
    │   │           │   ├── mac v0.1.1 (*)
    │   │           │   └── new_debug_unreachable v1.0.1 (*)
    │   │           ├── mac v0.1.1 (*)
    │   │           └── utf-8 v0.7.4
    │   │       [build-dependencies]
    │   │       ├── phf_codegen v0.7.22 (*)
    │   │       └── string_cache_codegen v0.4.1 (*)
    │   │   [build-dependencies]
    │   │   ├── proc-macro2 v0.3.8 (*)
    │   │   ├── quote v0.5.2 (*)
    │   │   └── syn v0.13.11 (*)
    │   └── selectors v0.19.0
    │       ├── bitflags v1.0.3 (*)
    │       ├── cssparser v0.23.10 (*)
    │       ├── log v0.3.9
    │       ├── phf v0.7.22 (*)
    │       ├── precomputed-hash v0.1.1 (*)
    │       ├── servo_arc v0.1.1
    │       │   └── stable_deref_trait v1.1.1
    │       └── smallvec v0.6.4 (*)
    │       [build-dependencies]
    │       └── phf_codegen v0.7.22 (*)
    ├── ldap3 v0.6.0
    │   ├── bytes v0.4.9
    │   │   └── iovec v0.1.2
    │   │       └── winapi v0.2.8
    │   ├── lazy_static v0.2.11
    │   ├── lber v0.1.6
    │   │   ├── bytes v0.4.9 (*)
    │   │   └── nom v2.2.1
    │   ├── log v0.3.9 (*)
    │   ├── native-tls v0.1.5
    │   │   ├── lazy_static v0.2.11 (*)
    │   │   ├── openssl v0.9.24
    │   │   │   ├── bitflags v0.9.1
    │   │   │   ├── foreign-types v0.3.2
    │   │   │   │   └── foreign-types-shared v0.1.1
    │   │   ├── security-framework v0.1.16
    │   │   │   ├── core-foundation v0.2.3
    │   │   │   │   ├── core-foundation-sys v0.2.3
    │   │   │   ├── core-foundation-sys v0.2.3 (*)
    │   │   │   └── security-framework-sys v0.1.16
    │   │   │       ├── core-foundation-sys v0.2.3 (*)
    │   │   ├── security-framework-sys v0.1.16 (*)
    │   │   └── tempdir v0.3.7
    │   │       ├── rand v0.4.2 (*)
    │   ├── nom v2.2.1 (*)
    │   ├── tokio-core v0.1.17
    │   │   ├── bytes v0.4.9 (*)
    │   │   ├── iovec v0.1.2 (*)
    │   │   ├── mio v0.6.15
    │   │   │   ├── iovec v0.1.2 (*)
    │   │   │   ├── kernel32-sys v0.2.2
    │   │   │   │   └── winapi v0.2.8 (*)
    │   │   │   │   [build-dependencies]
    │   │   │   │   └── winapi-build v0.1.1
    │   │   │   ├── lazycell v0.6.0
    │   │   │   ├── miow v0.2.1
    │   │   │   │   ├── kernel32-sys v0.2.2 (*)
    │   │   │   │   ├── winapi v0.2.8 (*)
    │   │   │   │   └── ws2_32-sys v0.2.1
    │   │   │   │       └── winapi v0.2.8 (*)
    │   │   │   │       [build-dependencies]
    │   │   │   │       └── winapi-build v0.1.1 (*)
    │   │   │   └── winapi v0.2.8 (*)
    │   │   ├── tokio v0.1.7
    │   │   │   ├── mio v0.6.15 (*)
    │   │   │   ├── tokio-executor v0.1.3
    │   │   │   ├── tokio-fs v0.1.3
    │   │   │   │   ├── tokio-io v0.1.7
    │   │   │   │   │   ├── bytes v0.4.9 (*)
    │   │   │   │   └── tokio-threadpool v0.1.5
    │   │   │   │       ├── crossbeam-deque v0.3.1
    │   │   │   │       │   ├── crossbeam-epoch v0.4.3
    │   │   │   │       │   │   ├── crossbeam-utils v0.3.2
    │   │   │   │       │   │   ├── memoffset v0.2.1
    │   │   │   │       │   │   └── scopeguard v0.3.3
    │   │   │   │       │   └── crossbeam-utils v0.3.2 (*)
    │   │   │   │       ├── rand v0.4.2 (*)
    │   │   │   │       └── tokio-executor v0.1.3 (*)
    │   │   │   ├── tokio-io v0.1.7 (*)
    │   │   │   ├── tokio-reactor v0.1.3
    │   │   │   │   ├── mio v0.6.15 (*)
    │   │   │   │   ├── tokio-executor v0.1.3 (*)
    │   │   │   │   └── tokio-io v0.1.7 (*)
    │   │   │   ├── tokio-tcp v0.1.1
    │   │   │   │   ├── bytes v0.4.9 (*)
    │   │   │   │   ├── iovec v0.1.2 (*)
    │   │   │   │   ├── mio v0.6.15 (*)
    │   │   │   │   ├── tokio-io v0.1.7 (*)
    │   │   │   │   └── tokio-reactor v0.1.3 (*)
    │   │   │   ├── tokio-threadpool v0.1.5 (*)
    │   │   │   ├── tokio-timer v0.2.5
    │   │   │   │   └── tokio-executor v0.1.3 (*)
    │   │   │   └── tokio-udp v0.1.1
    │   │   │       ├── bytes v0.4.9 (*)
    │   │   │       ├── mio v0.6.15 (*)
    │   │   │       ├── tokio-codec v0.1.0
    │   │   │       │   ├── bytes v0.4.9 (*)
    │   │   │       │   └── tokio-io v0.1.7 (*)
    │   │   │       ├── tokio-io v0.1.7 (*)
    │   │   │       └── tokio-reactor v0.1.3 (*)
    │   │   ├── tokio-executor v0.1.3 (*)
    │   │   ├── tokio-io v0.1.7 (*)
    │   │   ├── tokio-reactor v0.1.3 (*)
    │   │   └── tokio-timer v0.2.5 (*)
    │   ├── tokio-io v0.1.7 (*)
    │   ├── tokio-proto v0.1.1
    │   │   ├── log v0.3.9 (*)
    │   │   ├── rand v0.3.22
    │   │   │   └── rand v0.4.2 (*)
    │   │   ├── slab v0.3.0
    │   │   ├── smallvec v0.2.1
    │   │   ├── take v0.1.0
    │   │   ├── tokio-core v0.1.17 (*)
    │   │   ├── tokio-io v0.1.7 (*)
    │   │   └── tokio-service v0.1.0
    │   ├── tokio-service v0.1.0 (*)
    │   ├── tokio-tls v0.1.4
    │   │   ├── native-tls v0.1.5 (*)
    │   │   ├── tokio-core v0.1.17 (*)
    │   │   └── tokio-io v0.1.7 (*)
    │   ├── tokio-uds v0.1.7
    │   │   ├── bytes v0.4.9 (*)
    │   │   ├── iovec v0.1.2 (*)
    │   │   ├── log v0.3.9 (*)
    │   │   ├── mio v0.6.15 (*)
    │   │   ├── mio-uds v0.6.6
    │   │   │   ├── iovec v0.1.2 (*)
    │   │   │   └── mio v0.6.15 (*)
    │   │   ├── tokio-core v0.1.17 (*)
    │   │   └── tokio-io v0.1.7 (*)
    │   ├── tokio-uds-proto v0.1.1
    │   │   ├── tokio-core v0.1.17 (*)
    │   │   ├── tokio-proto v0.1.1 (*)
    │   │   ├── tokio-service v0.1.0 (*)
    │   │   └── tokio-uds v0.1.7 (*)
    ├── md-5 v0.7.0
    │   ├── block-buffer v0.3.3
    │   └── digest v0.7.5 (*)
    ├── mysql v14.0.0
    │   ├── bit-vec v0.5.0
    │   ├── bufstream v0.1.3 (*)
    │   ├── flate2 v1.0.2
    │   │   └── miniz-sys v0.1.10
    │   ├── mysql_common v0.8.0
    │   │   ├── atoi v0.2.3
    │   │   ├── base64 v0.9.2 (*)
    │   │   ├── bit-vec v0.5.0 (*)
    │   │   ├── bitflags v1.0.3 (*)
    │   │   ├── num-bigint v0.2.0
    │   │   │   ├── num-integer v0.1.39 (*)
    │   │   ├── sha2 v0.7.1
    │   │   │   ├── block-buffer v0.3.3 (*)
    │   │   │   ├── digest v0.7.5 (*)
    │   │   ├── smallvec v0.6.4 (*)
    │   │   ├── twox-hash v1.1.1
    │   │   └── uuid v0.6.5
    │   │       └── rand v0.4.2 (*)
    │   ├── named_pipe v0.3.0
    │   │   ├── kernel32-sys v0.2.2 (*)
    │   │   └── winapi v0.2.8 (*)
    │   ├── smallvec v0.6.4 (*)
    │   ├── twox-hash v1.1.1 (*)
    ├── pbr v1.0.1
    │   ├── kernel32-sys v0.2.2 (*)
    │   └── winapi v0.2.8 (*)
    ├── reqwest v0.8.7
    │   ├── bytes v0.4.9 (*)
    │   ├── encoding_rs v0.7.2
    │   ├── hyper v0.11.27
    │   │   ├── base64 v0.9.2 (*)
    │   │   ├── bytes v0.4.9 (*)
    │   │   ├── futures-cpupool v0.1.8
    │   │   ├── iovec v0.1.2 (*)
    │   │   ├── language-tags v0.2.2
    │   │   ├── mime v0.3.9
    │   │   ├── relay v0.1.1
    │   │   ├── tokio-core v0.1.17 (*)
    │   │   ├── tokio-io v0.1.7 (*)
    │   │   ├── tokio-service v0.1.0 (*)
    │   │   └── want v0.0.4
    │   │       └── try-lock v0.1.0
    │   ├── hyper-tls v0.1.4
    │   │   ├── hyper v0.11.27 (*)
    │   │   ├── native-tls v0.1.5 (*)
    │   │   ├── tokio-core v0.1.17 (*)
    │   │   ├── tokio-io v0.1.7 (*)
    │   │   ├── tokio-service v0.1.0 (*)
    │   │   └── tokio-tls v0.1.4 (*)
    │   ├── libflate v0.1.16
    │   │   ├── adler32 v1.0.3
    │   │   └── crc v1.8.1
    │   │       [build-dependencies]
    │   │       └── build_const v0.2.1
    │   ├── mime_guess v2.0.0-alpha.6
    │   │   ├── mime v0.3.9 (*)
    │   │   ├── phf v0.7.22 (*)
    │   │   └── unicase v1.4.2 (*)
    │   │   [build-dependencies]
    │   │   ├── phf_codegen v0.7.22 (*)
    │   │   └── unicase v1.4.2 (*)
    │   ├── native-tls v0.1.5 (*)
    │   ├── serde_urlencoded v0.5.3
    │   ├── tokio-core v0.1.17 (*)
    │   ├── tokio-io v0.1.7 (*)
    │   ├── tokio-tls v0.1.4 (*)
    │   └── uuid v0.6.5 (*)
    ├── sha-1 v0.7.0
    │   ├── block-buffer v0.3.3 (*)
    │   ├── digest v0.7.5 (*)
    ├── sha2 v0.7.1 (*)
    ├── sha3 v0.7.3
    │   ├── block-buffer v0.3.3 (*)
    │   ├── digest v0.7.5 (*)
    │   └── keccak v0.1.0
    ├── structopt v0.2.10
    ├── termios v0.3.0
    ├── threadpool v1.7.1
    └── twox-hash v1.1.1 (*)
