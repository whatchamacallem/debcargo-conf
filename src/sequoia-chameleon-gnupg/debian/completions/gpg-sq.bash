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
            opts="-s -b -e -c -d -k -K -v -q -n -i -a -o -z -r -u -h --sign --clear-sign --detach-sign --encrypt --symmetric --decrypt --verify --list-keys --list-signatures --check-signatures --fingerprint --list-secret-keys --generate-key --quick-generate-key --quick-add-uid --quick-revoke-uid --quick-set-expire --full-generate-key --generate-revocation --delete-keys --delete-secret-keys --quick-sign-key --quick-lsign-key --quick-revoke-sig --sign-key --lsign-key --edit-key --change-passphrase --export --send-keys --receive-keys --search-keys --refresh-keys --import --update-trustdb --print-md --server --tofu-policy --verbose --quiet --options --log-file --default-key --encrypt-to --group --openpgp --dry-run --interactive --armor --output --textmode --auto-key-locate --auto-key-import --include-key-block --disable-dirmngr --recipient --local-user --help"
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
