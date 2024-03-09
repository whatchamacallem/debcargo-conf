_sq-wot() {
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
                cmd="sq__wot"
                ;;
            sq__wot,authenticate)
                cmd="sq__wot__authenticate"
                ;;
            sq__wot,help)
                cmd="sq__wot__help"
                ;;
            sq__wot,identify)
                cmd="sq__wot__identify"
                ;;
            sq__wot,list)
                cmd="sq__wot__list"
                ;;
            sq__wot,lookup)
                cmd="sq__wot__lookup"
                ;;
            sq__wot,path)
                cmd="sq__wot__path"
                ;;
            sq__wot__help,authenticate)
                cmd="sq__wot__help__authenticate"
                ;;
            sq__wot__help,help)
                cmd="sq__wot__help__help"
                ;;
            sq__wot__help,identify)
                cmd="sq__wot__help__identify"
                ;;
            sq__wot__help,list)
                cmd="sq__wot__help__list"
                ;;
            sq__wot__help,lookup)
                cmd="sq__wot__help__lookup"
                ;;
            sq__wot__help,path)
                cmd="sq__wot__help__path"
                ;;
            *)
                ;;
        esac
    done

    case "${cmd}" in
        sq__wot)
            opts="-k -r -f -a -h -V --gpg --keyring --gpg-keyring --network --keyserver --trust-root --format --gpg-ownertrust --gossip --certification-network --trust-amount --partial --full --double --time --known-notation --help --version authenticate lookup identify list path help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -k)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyserver)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --format)
                    COMPREPLY=($(compgen -W "dot human-readable" -- "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -W "dot human-readable" -- "${cur}"))
                    return 0
                    ;;
                --trust-amount)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
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
        sq__wot__authenticate)
            opts="-k -r -f -a -h --email --gpg --keyring --gpg-keyring --network --keyserver --trust-root --format --gpg-ownertrust --gossip --certification-network --trust-amount --partial --full --double --time --known-notation --help <FINGERPRINT|KEYID> <USERID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -k)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyserver)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --format)
                    COMPREPLY=($(compgen -W "dot human-readable" -- "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -W "dot human-readable" -- "${cur}"))
                    return 0
                    ;;
                --trust-amount)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
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
        sq__wot__help)
            opts="authenticate lookup identify list path help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        sq__wot__help__authenticate)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        sq__wot__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        sq__wot__help__identify)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        sq__wot__help__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        sq__wot__help__lookup)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        sq__wot__help__path)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        sq__wot__identify)
            opts="-k -r -f -a -h --gpg --keyring --gpg-keyring --network --keyserver --trust-root --format --gpg-ownertrust --gossip --certification-network --trust-amount --partial --full --double --time --known-notation --help <FINGERPRINT|KEYID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -k)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyserver)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --format)
                    COMPREPLY=($(compgen -W "dot human-readable" -- "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -W "dot human-readable" -- "${cur}"))
                    return 0
                    ;;
                --trust-amount)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
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
        sq__wot__list)
            opts="-k -r -f -a -h --email --gpg --keyring --gpg-keyring --network --keyserver --trust-root --format --gpg-ownertrust --gossip --certification-network --trust-amount --partial --full --double --time --known-notation --help [PATTERN]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -k)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyserver)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --format)
                    COMPREPLY=($(compgen -W "dot human-readable" -- "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -W "dot human-readable" -- "${cur}"))
                    return 0
                    ;;
                --trust-amount)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
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
        sq__wot__lookup)
            opts="-k -r -f -a -h --email --gpg --keyring --gpg-keyring --network --keyserver --trust-root --format --gpg-ownertrust --gossip --certification-network --trust-amount --partial --full --double --time --known-notation --help <USERID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -k)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyserver)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --format)
                    COMPREPLY=($(compgen -W "dot human-readable" -- "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -W "dot human-readable" -- "${cur}"))
                    return 0
                    ;;
                --trust-amount)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
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
        sq__wot__path)
            opts="-k -r -f -a -h --email --gpg --keyring --gpg-keyring --network --keyserver --trust-root --format --gpg-ownertrust --gossip --certification-network --trust-amount --partial --full --double --time --known-notation --help [FINGERPRINT|KEYID] [USERID]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -k)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyserver)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --format)
                    COMPREPLY=($(compgen -W "dot human-readable" -- "${cur}"))
                    return 0
                    ;;
                -f)
                    COMPREPLY=($(compgen -W "dot human-readable" -- "${cur}"))
                    return 0
                    ;;
                --trust-amount)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
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
    complete -F _sq-wot -o nosort -o bashdefault -o default sq-wot
else
    complete -F _sq-wot -o bashdefault -o default sq-wot
fi
