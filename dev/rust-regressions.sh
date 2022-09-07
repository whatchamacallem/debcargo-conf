#!/bin/bash
# Analyze debian CI test failures for rust packages against some known failures.
#
# Usage:
# $ dev/rust-regressions.sh               # analyse logs mentioned in rust-regressions.list
# $ dev/rust-regressions.sh [<test logs>] # analyse logs downloaded manually
#

set -e
#set -x
shopt -s lastpipe

declare -A results

classify() {
	local c=0
	local url="$1"
	local name="$(zgrep -E -o 'autopkgtest \[[0-9:]+\]: testing package [^[:space:]]+' "$url" | cut '-d ' -f5)"
	if zgrep -E -q '^error\[E0554\]' "$url" && \
	 ! zgrep -q "^cargo-auto-test: re-running test with RUSTC_BOOTSTRAP due to E0554" "$url"; then
		results["falsepositive_unstable"]+="$name"$'\n'
		c=$((c+1))
	fi
	if zgrep -q "^crate directory not found" "$url"; then
		results["falsepositive_autopkgtest_version_bug"]+="$name"$'\n'
		c=$((c+1))
	fi
	if zgrep -q "^error: no matching package named" "$url"; then
		results["falsepositive_debcargo_945560"]+="$name"$'\n'
		c=$((c+1))
	fi
	if zgrep -q "^error.* No such file or directory (os error 2)$" "$url"; then
		results["maybetestbroken_filemissing"]+="$name"$'\n'
		c=$((c+1))
	fi
	if zgrep -q "^Broken autopkgtest-satdep" "$url"; then
		results["missing_dependency"]+="$name"$'\n'
		c=$((c+1))
	fi
	if [ "$c" = 0 ]; then
		results["UNKNOWN"]+="$url"$'\n'
		results["UNKNOWN"]+="$(zgrep ^error "$url" | head -n3 || true)"$'\n'
		results["UNKNOWN"]+="$(zgrep -w FAIL "$url" | sort -u || true)"$'\n'
		results["UNKNOWN"]+=$'\n'
	fi
}

declare -A action explain

action["UNKNOWN"]="Analyze the relevant test log and deal with it. Ask in #debian-rust for help if you get stuck."
explain["UNKNOWN"]="We weren't able to automatically guess the reason behind the test failure"

action["falsepositive_unstable"]="Re-run the test via the ci.debian.net web interface. No package upload is necessary."
explain["falsepositive_unstable"]="dh-cargo since version 23 will automatically detect this error and re-run the test with RUSTC_BOOTSTRAP=1"

action["falsepositive_autopkgtest_version_bug"]="Either wait for the bug to be fixed, or help to fix the bug. Don't change the rust packaging."
explain["falsepositive_autopkgtest_version_bug"]="Autopkgtest has a bug, see https://alioth-lists.debian.net/pipermail/pkg-rust-maintainers/2020-January/009512.html"

action["falsepositive_debcargo_945560"]="regenerate your crate packaging using debcargo 2.4.2 or later"
explain["falsepositive_debcargo_945560"]="cargo requires more dependencies than necessary, and debcargo did not work around this until 2.4.2"

action["maybetestbroken_filemissing"]="Mark the relevant tests as test_is_broken=true in debcargo.toml, re-upload the package, and file a bug upstream for them to fix it."
explain["maybetestbroken_filemissing"]="Carge does not enforce that tests pass per-crate, so sometimes crate authors run tests on a per-workspace basis and have crate tests depend on files in the parent workspace, which are not part of the crate when uploaded to crates.io."

action["missing_dependency"]="Package the missing dev-dependencies."
explain["missing_dependency"]="autopkgtest cannot install all dependencies.  Check the dev-dependencies section in the Cargo.toml or the Testsuite-Triggers field in the dsc file to see a list of additional autopkgtest dependencies, or inspect the full log to find the missing packages."

if [ -z "$*" ]; then
	if ! [ -f rust-regressions.list ]; then
		echo >&2 "rust-regressions.list does not exist, run \`dev/rust-excuses.mk refresh all\` to update it"
	elif [ $(($(date +%s) - $(stat -c %Y rust-regressions.list))) -gt 7200 ]; then
		echo >&2 "rust-regressions.list is a bit old, run \`dev/rust-excuses.mk refresh all\` to update it"
	fi
	if [ -z "$DEB_RUST_SKIP_CI_DL" ]; then
		echo >&2 "Downloading CI test logs. If you did this recently and want to skip, re-run me with DEB_RUST_SKIP_CI_DL=1"
		if ! wget -nv --mirror $(< rust-regressions.list); then
			if [ -z "$DEB_RUST_NOFAIL_CI_DL" ]; then
				echo >&2 "abort: Download failed or partially-failed. If you want me to continue, re-run me with DEB_RUST_NOFAIL_CI_DL=1"
				exit 1
			fi
		fi
	fi
	cat rust-regressions.list | while read url; do
		classify "${url#https://}"
	done
else
	for i in "$@"; do classify "$i"; done
fi

for p in "${!results[@]}"; do
	echo "$p"
done | LC_COLLATE=C.UTF-8 sort | while read p; do
	echo "$p"
	echo "$p" | sed -e 's/./=/g'
	echo
	case "$p" in
	UNKNOWN)
		printf "%s" "${results[$p]}"
		;;
	*)
		printf "%s" "${results[$p]}" | sort -u | tr '\n' ','
		echo
		;;
	esac
	echo
	echo "You should: ${action[$p]}"
	echo "Explanation: ${explain[$p]}"
	echo
done
