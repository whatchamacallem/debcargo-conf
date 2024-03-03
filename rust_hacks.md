# Scope of this document

This document aims to document some nice "hacks" and tricks to employ when packaging crates.

## Getting an overview of missing crates

A nice tool to generate a graphical overview of a rust projects' dependency tree is `cargo debstatus`. Install it like that:
`apt install cargo-debstatus` (trixie and sid). Then download either a release or clone the git project and `cd` into there. Run `cargo debstatus` to get a nice graph about dependencies and reverse dependencies.

## Patching crates
If a crate needs a) a newer dependency or b) an older dependency than the one in the archive you need to patch the crate. This is relatively common. You can also use this to patch out features in Cargo.toml or make changes to the source code. 

Since the source is pulled from crates.io and not from github/lab, patching requires downloading the source from there. There are two ways to achieve this:

1) Install `cargo-download`: `cargo install cargo-download`  
1.1) Download the source: `cargo download foocrate version > foocrate.tar.gz`  
1.2) Extract the crate: `tar -xf foocrate.tar.gz`  
1.3) `cd foocrate-version && git init && git add . && git commit -m "d"`  
1.4) Edit e.g. Cargo.toml to relax the dependencies: Instead of version 0.4 of a crate bump it to 0.5 ( if that is the corresponding debian version) or down to 0.3 (if that is the debian version)  
1.5) Generate a patch with your changes: `git diff -p >> relax-deps.diff`  
1.6) `cp relax-deps.diff debcargo-conf/src/foocrate/debian`  
1.7) `cd debcargo-conf/src/foocrate/debian && mkdir patches`  
1.8) `mv relax-deps.diff patches/ && cd patches && echo relax-deps.diff >> series`  
1.9) `cd ../../../../`  
1.10) run `./update.sh foocrate` again. The patch should get applied and allow you to build against an older/newer dependency / with features disabled.  
1.11) Document your patches in d/changelog  
2) `wget http://crates.io/api/v1/crates/foocrate/version/download -O foocrate-version.tar.gz`  
Then follow 1.1)

Alternatively you can do it directly in the build directory with
[quilt](https://wiki.debian.org/UsingQuilt):

1. In the root directory of `debcargo-conf`, `mkdir -p src/foo/debian/patches
   && ./update.sh foo && ln -srf src/foo/debian/patches build/foo/debian/`
   (linking it there so it's "sync"ed)
2. `cd build/foo`
3. `quilt series` to check existing patches, `quilt push -a` to test apply all
   of them, and `quilt pop -a` to unapply them, `quilt push patch-name` to
   apply the series until exactly that patch
4. `quilt new patch-name.patch` to create a new patch, `quilt edit
   path/to/file` to edit a file with changes saved in current patch, `quilt
   header -e --dep3` to add a DEP-3 patch header
5. `quilt refresh` to update current patch and prevent fuzz (we don't allow
   fuzzes when building)

You may want to also `rm -r build/foo/.pc` if quilt complains about something
you don't recognize.

Note that `update.sh` deletes and re-creates `build/foo`, so an open terminal
in it needs to go up and down once, into the new directory.

capitol did a nice writeup which can be read here:
https://blog.hackeriet.no/packaging-rust-part-II/

## built-using-dh-cargo

If you get an error like this:
```
You must patch build.rs of CRATE to output 'println!(\"dh-cargo:deb-built-using=$lib=\$s={}\", env::var(\"CARGO_MANIFEST_DIR\").unwrap());' 
where: $s is 1 if the license(s) of the included static libs require source distribution alongside binaries, otherwise 0"
```
when building a FFI rust library you need to patch build.rs like stated above. $s is 0 for BSD-like licenses such as MIT and 1 for copyleft licenses like GPL.

## Skipping doctests

In case doctests get run during the build process and you want to disable them add the following lines in Cargo.toml (as patch):

```diff

+[lib]
+doctest = false

```

They often fails so you can safely disable them that way. Example: xdg-home, rust-apt

## Skipping / ignoring tests 

Sometimes you get broken tests that can't be excluded or patched away. For instance if a test would require direct access to the RAM which isn't possible 
with `sbuild`, then it's reasonable to skip those with a patch. For instance if test::foo::hello-world fails, you add the following line as patch in tests/foo.rs:

```diff
#[test]
+#[ignore = "broken in debian, needs RAM access"] 
fn hello-world()
...

```

This allows the other tests to run. Create and include it the usual way.

## Special d/rules overrides

In case you need special overrides for d/rules not provided by debcargo:

1) `touch src/foocrate/debian/rules && ./update.sh foocrate`. This will
generate a `rules.debcargo.hint` alongside it, which you can use as template,
similar to the case of d/copyright
2) `cd src/foocrate/debian && cp rules.debcargo.hint rules`
3) use your favorite editor to edit the rules file to your needs. 

```make
# runs all tests on a single thread
override_dh_auto_test:
	dh_auto_test -- test -- --test-threads 1
```

## Packaging binary crates

File an ITP for them as this is team policy. Add the following content (as minimum) in debcargo.toml:

```toml
summary = "short program summary"
description = """
long, exhaustive description of the program. this equals the extended-description line in debian/control 
for "regular" packages.
"""    
# the section for the application
[source]
section = rust
```
Examples to take inspiration from include lsd, bat, alacritty, ...

If a package ships a binary but you only want to use it as library add this stanza in debcargo.toml:
```toml
[packages.lib]
bin = false
```

## Packaging a lot of crates

Use the `dev/chain_build.py` script. It has a self-explanatory help message,
but basically you run `dev/chain_build.py lowest_dep_1 lowest_dep2 lower_dep_1
lower_dep_2 target_crate`, solve build failures, press enter to continue,
solve, continue, repeat, until the target crate is successfully built.

## debcargo.toml tweaks

### Excluding files
In case you need to exclude certain files from `debcargo.toml`, there is an easy way to do that.
Just add `excludes = ["foo/bar.rs", "bar/non-dfsg-file.c"]` in debcargo.toml. This has the following usecases:

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

Do this only if *some* features fail. If all feature tests fail, read the test logs and look at the upstream test system. Make sure that some tests 
pass or that the tests aren't meant to be run. Some upstream projects run all test in a specific container or use specific setup. Also some crates are only tested 
with their default features enabled by upstream. If that's the case mark all tests as broken:

```
# tests need a postgres container to run
[packages.lib]
test_is_broken = true

```
Examples: tokio-postgres, ...

Sometime you need to combine some tricks to run at least some tests: Exclude a faulty test, patch dependencies away and mark tests as broken.

### More resources
For a full documentation of all keywords available in `debcargo.toml` refer to debcargo.toml.example in the debcargo repo.


## Arch-specific failures

It can rarely happen that tests (read: autopkgtest) fail on specific arches because how bytes are addressed on that arch. The best course of action is to 
investigate first if it indeed is an arch-specific failure. If that's the case you need to write a patch that skips those faulty tests (on that arch) so the 
package can enter testing. Because arch names are different in rust, here is a handy table comparing them:


| Debian arch name | rust arch name (target_arch) |
|----------------------|---------------------------|
| Arches autopkgtest runs on (needed for testing migration) | |
| amd64            | x86-64         |
| i386             | x86 |
| arm64            | aarch64        |
| armel            | arm        |
| armhf            | arm |
| ppc64el | powerpc64 |
| s390x | powerpc64? s390x? |
| riscv64 | riscv64 |
| **Other official arches¹** | |
| mips64el | mips64 |
| **Unoffical ports with rustc/cargo (not really relevant)** | |
|  powerpc 	| powerpc? |
| loongarch64 | loongarch64? |
| ppc64 	| powerpc? |
| sparc64 | sparc64? |
| x32 | ? |

Arches without rustc/cargo:  
- sh4²
- alpha  
- arc  
- hppa 
- hurd-i386  
- ia64  
- m68k  

Only the first seven are really relevant, I included the rest for completeness's sake. 
If you encounter a test failure e.g. on `armel`, add this macro before the `#[test]` macro:  
 ` #[cfg(not(target_arch = "arm"))] `.  
  Then generate a patch with the changes and include it in the usual way. Also notify upstream that this arch is broken and send them your patch.  

 To skip a test on e.g. all big-endian arches you can use something like `#[cfg(not(target_endian = "big"))]`.



  Footnotes:  [1] https://wiki.debian.org/SupportedArchitectures
            [2] sh4 has only one test failure for cargo
 
 
