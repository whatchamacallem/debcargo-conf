# Scope of this document

This document aims to document some nice "hacks" and tricks to employ when packaging crates.


## Patching crates
TODO


## Skipping tests

TODO

## Packaging binary crates

TODO

## debcargo.toml tweaks

### Excluding files
In case you need to exclude certain files from `debcargo.toml`, there is an easy way to do that.
Just add `excludes = ["foo/bar.rs", ""bar/non-dfsg-file"]` in debcargo.toml. This has the following usecases:

- Exclude non-dfsg/unnecessary files form the orig tarball (Example: svg-metadata)
  This is also **required** for some sys-crates to exclude vendored copies of the C library already in debian
- Exclude broken tests that do not run (when in doubt, ask on #debian-rust) (Example: cxx )

### Passing external packages to the buildsystem

If the crate needs external packages (such as -dev libraries) you can also pass those conveniently via `debcargo.toml` :  
` depends = ["libfoo-dev"]  `. This is essentially needed for all -sys crates which provide rust bindings to C developement libraries such as GTK, for instance.

### Passing runtime test dependencies to autopkgtest

In rare cases the autopkgtest can fail on the official runners compared to the local one because it has a slightly different setup.
You can do this like that: `test_depends = ["foo"]`. That happens very rarely, see `cxx` for an example.

### Whitelisting files

Sometimes debcargo marks files as suspicious, most of the time those are tests written in C for -sys crates. Whitelist them like that:
`whitelist = [tests/foo.c"]` . (Example: lidadwaita-sys)

### Allowing alpha/beta dependencies

Some crates depend on a crate with an alpha/beta version strings. debcargo will emit an error if that is the case. To allow those deps, pass the following:
`allow_prerelease_deps = true`. Do this only if you are sure this will work !


### Collapsing features
If a crate has features, `collapse_features = true` **should** be set in `debcargo.toml`. This is strongly recommended. See issue #17 in the debcargo repo for the reasoning.


### Marking feature tests as broken 

Let's assume  you are building a package and get the following output at the end: 

```

autopkgtest [22:45:42]: test librust-foo-dev:: -----------------------]
autopkgtest [22:45:42]: test librust-foo-dev::  - - - - - - - - - - results - - - - - - - - - -
librust-foo-dev: PASS
autopkgtest [22:45:42]: @@@@@@@@@@@@@@@@@@@@ summary
rust-foo:@ FAIL non-zero exit status 101
librust-foo-dev:default PASS
librust-foo-dev: PASS
librust-foo-dev:serde: FAIL non-zero exit status 101

```
As we can see, the `serde` and `@` feature fail. Since the other features (and the package itself) passes, we need to mark those test as flaky so the package can migrate to testing.
Do it like that:
```
#serde and @ feature fail the autopkgtest
[packages.lib]
test_is_broken = false
[packages."lib+@"]
test_is_broken = true
[packages."lib+serde"]
test_is_broken = true
```
Examples: cxx, hashbrown, uom, ...

Do this only if *some* features fail. If all feature tests fail, read the test logs and look at the upstream test system. Make sure that some tests pass or that the tests aren't meant to be run. Some upstream projects run all test in a specific container or use specific setup. Also some crates are only tested with their default features enabled by upstream. If that's the case mark all test as broken:

```
# tests need a postgres container to run
[packages.lib]
test_is_broken = true

```
Examples: tokio-postgres, ...

Sometime you need to combine some tricks to run at least some tests: Exclude a faulty test, patch dependencies away and mark tests as broken.



## Arch-specific failures

It can rarely happen that tests (read: autopkgtest) fail on specific arches because how bytes are addressed on that arch. The best course of action is to investigate first if it indeed is an arch-specific failure. 
If that's the case you need to write a patch that skips those faulty tests (on that arch) so the package can enter testing. Because arch names are different in rust, here is a handy table comparing them:


| Debian arch name | rust arch name (target_arch) |
|-------------------------------------------------|
| Arches autopkgtest runs on (needed for testing migration) | |
|-----------------------------------------------------------|
| amd64            | x86-64         |
| i386             | x86 |
| arm64            | aarch64        |
| armel            | arm        |
| armhf            | arm |
| ppc64el | powerpc64 |
| s390x | powerpc64? |
|----------------------------------------------------------|
| Other official arches¹ | |
|----------------------------------------------------------|
| mipsel | mips? |
| mips64el | mips64 |
|----------------------------------------------------------|
| Unoffical ports with rustc/cargo (not really relevant) | |
|----------------------------------------------------------|
|  powerpc 	| powerpc? |
| ppc64 	| powerpc? |
| riscv64 | riscv64 |
| sparc64 | sparc64? |
| x32 | ? |

Arches without rustc/cargo:  
- sh4²
- alpha  
- arc  
- hppa 
- hurd-i386  
- ia64  
- kfreebsd-amd64  
- kfreebsd-i386  
- m68k  

Only the first seven are really relevant, I included the rest for completeness's sake. 
If you encounter a test failure e.g. on `armel`, add this macro before the `#[test]` macro:  
 ` #[cfg(not(target_arch = "arm"))] `.  
 Then generate a patch with the changes and include it in the usual way. Also notify upstream that this arch is broken and send them your patch.
 Footnotes: [1] https://wiki.debian.org/SupportedArchitectures
            [2] sh4 has only one test failure for cargo
 
 
