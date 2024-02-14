_gpg-sq() {
    local i cur prev opts cmd
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmd=""
    opts=""

    for i in ${COMP_WORDS[@]}
    do
        case "${cmd},${i}" in
            ",$1")
                cmd="gpg__sq"
                ;;
            *)
                ;;
        esac
    done

    case "${cmd}" in
        gpg__sq)
            opts="-s -b -e -c -d -k -K -v -q -n -i -a -o -z -r -u -h --sign --clear-sign --clearsign --detach-sign --encrypt --encrypt-files --symmetric --store --decrypt --decrypt-files --verify --verify-files --list-keys --list-public-keys --list-signatures --list-sigs --check-signatures --check-sigs --fingerprint --list-secret-keys --generate-key --gen-key --quick-generate-key --quick-gen-key --quick-add-uid --quick-adduid --quick-add-key --quick-addkey --quick-revoke-uid --quick-revuid --quick-set-expire --quick-set-primary-uid --full-generate-key --full-gen-key --generate-revocation --gen-revoke --delete-keys --delete-secret-keys --quick-sign-key --quick-lsign-key --quick-revoke-sig --sign-key --lsign-key --edit-key --key-edit --change-passphrase --passwd --generate-designated-revocation --desig-revoke --export --send-keys --receive-keys --recv-keys --search-keys --refresh-keys --locate-keys --locate-external-keys --fetch-keys --show-keys --export-secret-keys --export-secret-subkeys --export-ssh-key --import --fast-import --list-config --list-gcrypt-config --gpgconf-list --gpgconf-test --list-packets --export-ownertrust --import-ownertrust --update-trustdb --check-trustdb --fix-trustdb --list-trustdb --dearmor --dearmour --enarmor --enarmour --print-md --print-mds --gen-prime --gen-random --server --tofu-policy --delete-secret-and-public-keys --rebuild-keydb-caches --list-key --list-sig --check-sig --show-key --Monitor --verbose --no-verbose --quiet --no-tty --no-greeting --debug --debug-level --debug-all --debug-iolbf --display-charset --charset --options --no-options --logger-fd --log-file --logger-file --debug-quick-random --Configuration --homedir --faked-system-time --default-key --encrypt-to --no-encrypt-to --hidden-encrypt-to --encrypt-to-default-key --default-recipient --default-recipient-self --no-default-recipient --group --ungroup --no-groups --compliance --gnupg --no-pgp2 --no-pgp6 --no-pgp7 --no-pgp8 --rfc2440 --rfc4880 --rfc4880bis --openpgp --pgp6 --pgp7 --pgp8 --default-new-key-algo --min-rsa-length --always-trust --trust-model --photo-viewer --known-notation --agent-program --dirmngr-program --exit-on-status-write-error --limit-card-insert-tries --enable-progress-filter --temp-directory --exec-path --expert --no-expert --no-secmem-warning --require-secmem --no-require-secmem --no-permission-warning --dry-run --interactive --default-sig-expire --ask-sig-expire --no-ask-sig-expire --default-cert-expire --ask-cert-expire --no-ask-cert-expire --default-cert-level --min-cert-level --ask-cert-level --no-ask-cert-level --only-sign-text-ids --enable-large-rsa --disable-large-rsa --enable-dsa2 --disable-dsa2 --personal-cipher-preferences --personal-digest-preferences --personal-compress-preferences --default-preference-list --default-keyserver-url --no-expensive-trust-checks --allow-non-selfsigned-uid --no-allow-non-selfsigned-uid --allow-freeform-uid --no-allow-freeform-uid --preserve-permissions --default-cert-check-level --tofu-default-policy --lock-once --lock-multiple --lock-never --compress-algo --compression-algo --bzip2-decompress-lowmem --completes-needed --marginals-needed --max-cert-depth --trustdb-name --auto-check-trustdb --no-auto-check-trustdb --force-ownertrust --Input --multifile --input-size-hint --utf8-strings --no-utf8-strings --set-filesize --no-literal --set-notation --sig-notation --cert-notation --set-policy-url --sig-policy-url --cert-policy-url --sig-keyserver-url --Output --armor --armour --no-armor --no-armour --output --max-output --comment --default-comment --no-comments --emit-version --no-emit-version --no-version --not-dash-escaped --escape-from-lines --no-escape-from-lines --mimemode --textmode --no-textmode --set-filename --for-your-eyes-only --no-for-your-eyes-only --show-notation --no-show-notation --show-session-key --use-embedded-filename --no-use-embedded-filename --unwrap --mangle-dos-filenames --no-mangle-dos-filenames --no-symkey-cache --skip-verify --list-only --compress-level --bzip2-compress-level --disable-signer-uid --ImportExport --auto-key-locate --no-auto-key-locate --auto-key-import --no-auto-key-import --auto-key-retrieve --no-auto-key-retrieve --include-key-block --no-include-key-block --disable-dirmngr --keyserver --keyserver-options --key-origin --import-options --import-filter --export-options --export-filter --merge-only --allow-secret-key-import --Keylist --list-options --show-photos --no-show-photos --show-policy-url --no-show-policy-url --with-colons --with-tofu-info --with-key-data --with-sig-list --with-sig-check --with-fingerprint --with-subkey-fingerprint --with-subkey-fingerprints --with-icao-spelling --with-keygrip --with-secret --with-wkd-hash --with-key-origin --fast-list-mode --fixed-list-mode --legacy-list-mode --print-pka-records --print-dane-records --keyid-format --show-keyring --recipient --hidden-recipient --recipient-file --hidden-recipient-file --remote-user --throw-keyids --no-throw-keyids --local-user --trusted-key --sender --try-secret-key --try-all-secrets --no-default-keyring --no-keyring --keyring --primary-keyring --secret-keyring --skip-hidden-recipients --no-skip-hidden-recipients --override-session-key --override-session-key-fd --Security --s2k-mode --s2k-digest-algo --s2k-cipher-algo --s2k-count --require-backsigs --require-cross-certification --no-require-backsigs --no-require-cross-certification --verify-options --enable-special-filenames --no-random-seed-file --no-sig-cache --ignore-time-conflict --ignore-valid-from --ignore-crc-error --ignore-mdc-error --disable-cipher-algo --disable-pubkey-algo --cipher-algo --digest-algo --cert-digest-algo --override-compliance-check --allow-weak-key-signatures --allow-weak-digest-algos --weak-digest --allow-multisig-verification --allow-multiple-messages --no-allow-multiple-messages --batch --no-batch --yes --no --status-fd --status-file --attribute-fd --attribute-file --command-fd --command-file --passphrase --passphrase-fd --passphrase-file --passphrase-repeat --pinentry-mode --force-sign-key --request-origin --display --ttyname --ttytype --lc-ctype --lc-messages --xauthority --no-autostart --forbid-gen-key --require-compliance --use-only-openpgp-card --rfc2440-text --no-rfc2440-text --personal-cipher-prefs --personal-digest-prefs --personal-compress-prefs --sign-with --user --use-agent --no-use-agent --gpg-agent-info --reader-port --ctapi-driver --pcsc-driver --disable-ccid --honor-http-proxy --tofu-db-format --strict --no-strict --load-extension --sk-comments --no-sk-comments --compress-keys --compress-sigs --force-v3-sigs --no-force-v3-sigs --force-v4-certs --no-force-v4-certs --no-mdc-warning --force-mdc --no-force-mdc --disable-mdc --no-disable-mdc --x-sequoia-parcimonie --x-sequoia-autostart-parcimonie --x-sequoia-parcimonie-daemonize --version --warranty --dump-option-table --dump-options --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --tofu-policy)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --options)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --log-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --default-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --encrypt-to)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --group)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -z)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --auto-key-locate)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --recipient)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --local-user)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -u)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
    esac
}

if [[ "${BASH_VERSINFO[0]}" -eq 4 && "${BASH_VERSINFO[1]}" -ge 4 || "${BASH_VERSINFO[0]}" -gt 4 ]]; then
    complete -F _gpg-sq -o nosort -o bashdefault -o default gpg-sq
else
    complete -F _gpg-sq -o bashdefault -o default gpg-sq
fi
