_magic-wormhole-cli() {
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
                cmd="magic__wormhole__cli"
                ;;
            magic__wormhole__cli,completion)
                cmd="magic__wormhole__cli__completion"
                ;;
            magic__wormhole__cli,forward)
                cmd="magic__wormhole__cli__forward"
                ;;
            magic__wormhole__cli,help)
                cmd="magic__wormhole__cli__help"
                ;;
            magic__wormhole__cli,receive)
                cmd="magic__wormhole__cli__receive"
                ;;
            magic__wormhole__cli,rx)
                cmd="magic__wormhole__cli__receive"
                ;;
            magic__wormhole__cli,send)
                cmd="magic__wormhole__cli__send"
                ;;
            magic__wormhole__cli,send-many)
                cmd="magic__wormhole__cli__send__many"
                ;;
            magic__wormhole__cli,tx)
                cmd="magic__wormhole__cli__send"
                ;;
            magic__wormhole__cli__forward,connect)
                cmd="magic__wormhole__cli__forward__connect"
                ;;
            magic__wormhole__cli__forward,open)
                cmd="magic__wormhole__cli__forward__serve"
                ;;
            magic__wormhole__cli__forward,serve)
                cmd="magic__wormhole__cli__forward__serve"
                ;;
            *)
                ;;
        esac
    done

    case "${cmd}" in
        magic__wormhole__cli)
            opts="-v -h -V --verbose --help --version send receive send-many forward completion help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
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
        magic__wormhole__cli__completion)
            opts="-v -h -V --verbose --help --version bash elvish fish powershell zsh"
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
        magic__wormhole__cli__forward)
            opts="-v -h -V --verbose --help --version serve connect"
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
        magic__wormhole__cli__forward__connect)
            opts="-p -v -h -V --port --bind --yes --noconfirm --relay --relay-server --rendezvous-server --force-direct --force-relay --verbose --help --version [CODE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --port)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -p)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --bind)
                    COMPREPLY=("${cur}")
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o nospace
                    fi
                    return 0
                    ;;
                --relay-server)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --relay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rendezvous-server)
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
        magic__wormhole__cli__forward__serve)
            opts="-c -v -h -V --relay --relay-server --rendezvous-server --force-direct --force-relay --code --code-length --verbose --help --version [[DOMAIN:]PORT]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --relay-server)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --relay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rendezvous-server)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code-length)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
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
        magic__wormhole__cli__help)
            opts="-v -h -V --verbose --help --version"
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
        magic__wormhole__cli__receive)
            opts="-v -h -V --yes --noconfirm --relay --relay-server --rendezvous-server --force-direct --force-relay --out-dir --verbose --help --version [CODE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --relay-server)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --relay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rendezvous-server)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --out-dir)
                    COMPREPLY=()
                    if [[ "${BASH_VERSINFO[0]}" -ge 4 ]]; then
                        compopt -o plusdirs
                    fi
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
            return 0
            ;;
        magic__wormhole__cli__send)
            opts="-c -v -h -V --relay --relay-server --rendezvous-server --force-direct --force-relay --code --code-length --name --rename --verbose --help --version <FILENAME|DIRNAME>..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --relay-server)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --relay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rendezvous-server)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code-length)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rename)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --name)
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
        magic__wormhole__cli__send__many)
            opts="-n -c -v -h -V --tries --timeout --relay --relay-server --rendezvous-server --force-direct --force-relay --code --code-length --name --rename --verbose --help --version <FILENAME|DIRNAME>..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --tries)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -n)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --timeout)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --relay-server)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --relay)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rendezvous-server)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --code-length)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --rename)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --name)
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
    complete -F _magic-wormhole-cli -o nosort -o bashdefault -o default magic-wormhole-cli
else
    complete -F _magic-wormhole-cli -o bashdefault -o default magic-wormhole-cli
fi
