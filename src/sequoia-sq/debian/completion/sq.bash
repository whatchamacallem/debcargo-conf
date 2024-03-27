_sq() {
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
                cmd="sq"
                ;;
            sq,autocrypt)
                cmd="sq__autocrypt"
                ;;
            sq,cert)
                cmd="sq__cert"
                ;;
            sq,decrypt)
                cmd="sq__decrypt"
                ;;
            sq,encrypt)
                cmd="sq__encrypt"
                ;;
            sq,help)
                cmd="sq__help"
                ;;
            sq,inspect)
                cmd="sq__inspect"
                ;;
            sq,key)
                cmd="sq__key"
                ;;
            sq,network)
                cmd="sq__network"
                ;;
            sq,pki)
                cmd="sq__pki"
                ;;
            sq,sign)
                cmd="sq__sign"
                ;;
            sq,toolbox)
                cmd="sq__toolbox"
                ;;
            sq,verify)
                cmd="sq__verify"
                ;;
            sq,version)
                cmd="sq__version"
                ;;
            sq__autocrypt,decode)
                cmd="sq__autocrypt__decode"
                ;;
            sq__autocrypt,encode-sender)
                cmd="sq__autocrypt__encode__sender"
                ;;
            sq__autocrypt,help)
                cmd="sq__autocrypt__help"
                ;;
            sq__autocrypt,import)
                cmd="sq__autocrypt__import"
                ;;
            sq__autocrypt__help,decode)
                cmd="sq__autocrypt__help__decode"
                ;;
            sq__autocrypt__help,encode-sender)
                cmd="sq__autocrypt__help__encode__sender"
                ;;
            sq__autocrypt__help,help)
                cmd="sq__autocrypt__help__help"
                ;;
            sq__autocrypt__help,import)
                cmd="sq__autocrypt__help__import"
                ;;
            sq__cert,export)
                cmd="sq__cert__export"
                ;;
            sq__cert,help)
                cmd="sq__cert__help"
                ;;
            sq__cert,import)
                cmd="sq__cert__import"
                ;;
            sq__cert,lint)
                cmd="sq__cert__lint"
                ;;
            sq__cert__help,export)
                cmd="sq__cert__help__export"
                ;;
            sq__cert__help,help)
                cmd="sq__cert__help__help"
                ;;
            sq__cert__help,import)
                cmd="sq__cert__help__import"
                ;;
            sq__cert__help,lint)
                cmd="sq__cert__help__lint"
                ;;
            sq__help,autocrypt)
                cmd="sq__help__autocrypt"
                ;;
            sq__help,cert)
                cmd="sq__help__cert"
                ;;
            sq__help,decrypt)
                cmd="sq__help__decrypt"
                ;;
            sq__help,encrypt)
                cmd="sq__help__encrypt"
                ;;
            sq__help,help)
                cmd="sq__help__help"
                ;;
            sq__help,inspect)
                cmd="sq__help__inspect"
                ;;
            sq__help,key)
                cmd="sq__help__key"
                ;;
            sq__help,network)
                cmd="sq__help__network"
                ;;
            sq__help,pki)
                cmd="sq__help__pki"
                ;;
            sq__help,sign)
                cmd="sq__help__sign"
                ;;
            sq__help,toolbox)
                cmd="sq__help__toolbox"
                ;;
            sq__help,verify)
                cmd="sq__help__verify"
                ;;
            sq__help,version)
                cmd="sq__help__version"
                ;;
            sq__help__autocrypt,decode)
                cmd="sq__help__autocrypt__decode"
                ;;
            sq__help__autocrypt,encode-sender)
                cmd="sq__help__autocrypt__encode__sender"
                ;;
            sq__help__autocrypt,import)
                cmd="sq__help__autocrypt__import"
                ;;
            sq__help__cert,export)
                cmd="sq__help__cert__export"
                ;;
            sq__help__cert,import)
                cmd="sq__help__cert__import"
                ;;
            sq__help__cert,lint)
                cmd="sq__help__cert__lint"
                ;;
            sq__help__key,adopt)
                cmd="sq__help__key__adopt"
                ;;
            sq__help__key,attest-certifications)
                cmd="sq__help__key__attest__certifications"
                ;;
            sq__help__key,expire)
                cmd="sq__help__key__expire"
                ;;
            sq__help__key,generate)
                cmd="sq__help__key__generate"
                ;;
            sq__help__key,import)
                cmd="sq__help__key__import"
                ;;
            sq__help__key,list)
                cmd="sq__help__key__list"
                ;;
            sq__help__key,password)
                cmd="sq__help__key__password"
                ;;
            sq__help__key,revoke)
                cmd="sq__help__key__revoke"
                ;;
            sq__help__key,subkey)
                cmd="sq__help__key__subkey"
                ;;
            sq__help__key,userid)
                cmd="sq__help__key__userid"
                ;;
            sq__help__key__subkey,add)
                cmd="sq__help__key__subkey__add"
                ;;
            sq__help__key__subkey,revoke)
                cmd="sq__help__key__subkey__revoke"
                ;;
            sq__help__key__userid,add)
                cmd="sq__help__key__userid__add"
                ;;
            sq__help__key__userid,revoke)
                cmd="sq__help__key__userid__revoke"
                ;;
            sq__help__key__userid,strip)
                cmd="sq__help__key__userid__strip"
                ;;
            sq__help__network,dane)
                cmd="sq__help__network__dane"
                ;;
            sq__help__network,fetch)
                cmd="sq__help__network__fetch"
                ;;
            sq__help__network,keyserver)
                cmd="sq__help__network__keyserver"
                ;;
            sq__help__network,wkd)
                cmd="sq__help__network__wkd"
                ;;
            sq__help__network__dane,fetch)
                cmd="sq__help__network__dane__fetch"
                ;;
            sq__help__network__dane,generate)
                cmd="sq__help__network__dane__generate"
                ;;
            sq__help__network__keyserver,fetch)
                cmd="sq__help__network__keyserver__fetch"
                ;;
            sq__help__network__keyserver,publish)
                cmd="sq__help__network__keyserver__publish"
                ;;
            sq__help__network__wkd,direct-url)
                cmd="sq__help__network__wkd__direct__url"
                ;;
            sq__help__network__wkd,fetch)
                cmd="sq__help__network__wkd__fetch"
                ;;
            sq__help__network__wkd,generate)
                cmd="sq__help__network__wkd__generate"
                ;;
            sq__help__network__wkd,url)
                cmd="sq__help__network__wkd__url"
                ;;
            sq__help__pki,authenticate)
                cmd="sq__help__pki__authenticate"
                ;;
            sq__help__pki,certify)
                cmd="sq__help__pki__certify"
                ;;
            sq__help__pki,identify)
                cmd="sq__help__pki__identify"
                ;;
            sq__help__pki,link)
                cmd="sq__help__pki__link"
                ;;
            sq__help__pki,list)
                cmd="sq__help__pki__list"
                ;;
            sq__help__pki,lookup)
                cmd="sq__help__pki__lookup"
                ;;
            sq__help__pki,path)
                cmd="sq__help__pki__path"
                ;;
            sq__help__pki__link,add)
                cmd="sq__help__pki__link__add"
                ;;
            sq__help__pki__link,list)
                cmd="sq__help__pki__link__list"
                ;;
            sq__help__pki__link,retract)
                cmd="sq__help__pki__link__retract"
                ;;
            sq__help__toolbox,armor)
                cmd="sq__help__toolbox__armor"
                ;;
            sq__help__toolbox,dearmor)
                cmd="sq__help__toolbox__dearmor"
                ;;
            sq__help__toolbox,extract-cert)
                cmd="sq__help__toolbox__extract__cert"
                ;;
            sq__help__toolbox,keyring)
                cmd="sq__help__toolbox__keyring"
                ;;
            sq__help__toolbox,packet)
                cmd="sq__help__toolbox__packet"
                ;;
            sq__help__toolbox__keyring,filter)
                cmd="sq__help__toolbox__keyring__filter"
                ;;
            sq__help__toolbox__keyring,list)
                cmd="sq__help__toolbox__keyring__list"
                ;;
            sq__help__toolbox__keyring,merge)
                cmd="sq__help__toolbox__keyring__merge"
                ;;
            sq__help__toolbox__keyring,split)
                cmd="sq__help__toolbox__keyring__split"
                ;;
            sq__help__toolbox__packet,decrypt)
                cmd="sq__help__toolbox__packet__decrypt"
                ;;
            sq__help__toolbox__packet,dump)
                cmd="sq__help__toolbox__packet__dump"
                ;;
            sq__help__toolbox__packet,join)
                cmd="sq__help__toolbox__packet__join"
                ;;
            sq__help__toolbox__packet,split)
                cmd="sq__help__toolbox__packet__split"
                ;;
            sq__key,adopt)
                cmd="sq__key__adopt"
                ;;
            sq__key,attest-certifications)
                cmd="sq__key__attest__certifications"
                ;;
            sq__key,expire)
                cmd="sq__key__expire"
                ;;
            sq__key,generate)
                cmd="sq__key__generate"
                ;;
            sq__key,help)
                cmd="sq__key__help"
                ;;
            sq__key,import)
                cmd="sq__key__import"
                ;;
            sq__key,list)
                cmd="sq__key__list"
                ;;
            sq__key,password)
                cmd="sq__key__password"
                ;;
            sq__key,revoke)
                cmd="sq__key__revoke"
                ;;
            sq__key,subkey)
                cmd="sq__key__subkey"
                ;;
            sq__key,userid)
                cmd="sq__key__userid"
                ;;
            sq__key__help,adopt)
                cmd="sq__key__help__adopt"
                ;;
            sq__key__help,attest-certifications)
                cmd="sq__key__help__attest__certifications"
                ;;
            sq__key__help,expire)
                cmd="sq__key__help__expire"
                ;;
            sq__key__help,generate)
                cmd="sq__key__help__generate"
                ;;
            sq__key__help,help)
                cmd="sq__key__help__help"
                ;;
            sq__key__help,import)
                cmd="sq__key__help__import"
                ;;
            sq__key__help,list)
                cmd="sq__key__help__list"
                ;;
            sq__key__help,password)
                cmd="sq__key__help__password"
                ;;
            sq__key__help,revoke)
                cmd="sq__key__help__revoke"
                ;;
            sq__key__help,subkey)
                cmd="sq__key__help__subkey"
                ;;
            sq__key__help,userid)
                cmd="sq__key__help__userid"
                ;;
            sq__key__help__subkey,add)
                cmd="sq__key__help__subkey__add"
                ;;
            sq__key__help__subkey,revoke)
                cmd="sq__key__help__subkey__revoke"
                ;;
            sq__key__help__userid,add)
                cmd="sq__key__help__userid__add"
                ;;
            sq__key__help__userid,revoke)
                cmd="sq__key__help__userid__revoke"
                ;;
            sq__key__help__userid,strip)
                cmd="sq__key__help__userid__strip"
                ;;
            sq__key__subkey,add)
                cmd="sq__key__subkey__add"
                ;;
            sq__key__subkey,help)
                cmd="sq__key__subkey__help"
                ;;
            sq__key__subkey,revoke)
                cmd="sq__key__subkey__revoke"
                ;;
            sq__key__subkey__help,add)
                cmd="sq__key__subkey__help__add"
                ;;
            sq__key__subkey__help,help)
                cmd="sq__key__subkey__help__help"
                ;;
            sq__key__subkey__help,revoke)
                cmd="sq__key__subkey__help__revoke"
                ;;
            sq__key__userid,add)
                cmd="sq__key__userid__add"
                ;;
            sq__key__userid,help)
                cmd="sq__key__userid__help"
                ;;
            sq__key__userid,revoke)
                cmd="sq__key__userid__revoke"
                ;;
            sq__key__userid,strip)
                cmd="sq__key__userid__strip"
                ;;
            sq__key__userid__help,add)
                cmd="sq__key__userid__help__add"
                ;;
            sq__key__userid__help,help)
                cmd="sq__key__userid__help__help"
                ;;
            sq__key__userid__help,revoke)
                cmd="sq__key__userid__help__revoke"
                ;;
            sq__key__userid__help,strip)
                cmd="sq__key__userid__help__strip"
                ;;
            sq__network,dane)
                cmd="sq__network__dane"
                ;;
            sq__network,fetch)
                cmd="sq__network__fetch"
                ;;
            sq__network,help)
                cmd="sq__network__help"
                ;;
            sq__network,keyserver)
                cmd="sq__network__keyserver"
                ;;
            sq__network,wkd)
                cmd="sq__network__wkd"
                ;;
            sq__network__dane,fetch)
                cmd="sq__network__dane__fetch"
                ;;
            sq__network__dane,generate)
                cmd="sq__network__dane__generate"
                ;;
            sq__network__dane,help)
                cmd="sq__network__dane__help"
                ;;
            sq__network__dane__help,fetch)
                cmd="sq__network__dane__help__fetch"
                ;;
            sq__network__dane__help,generate)
                cmd="sq__network__dane__help__generate"
                ;;
            sq__network__dane__help,help)
                cmd="sq__network__dane__help__help"
                ;;
            sq__network__help,dane)
                cmd="sq__network__help__dane"
                ;;
            sq__network__help,fetch)
                cmd="sq__network__help__fetch"
                ;;
            sq__network__help,help)
                cmd="sq__network__help__help"
                ;;
            sq__network__help,keyserver)
                cmd="sq__network__help__keyserver"
                ;;
            sq__network__help,wkd)
                cmd="sq__network__help__wkd"
                ;;
            sq__network__help__dane,fetch)
                cmd="sq__network__help__dane__fetch"
                ;;
            sq__network__help__dane,generate)
                cmd="sq__network__help__dane__generate"
                ;;
            sq__network__help__keyserver,fetch)
                cmd="sq__network__help__keyserver__fetch"
                ;;
            sq__network__help__keyserver,publish)
                cmd="sq__network__help__keyserver__publish"
                ;;
            sq__network__help__wkd,direct-url)
                cmd="sq__network__help__wkd__direct__url"
                ;;
            sq__network__help__wkd,fetch)
                cmd="sq__network__help__wkd__fetch"
                ;;
            sq__network__help__wkd,generate)
                cmd="sq__network__help__wkd__generate"
                ;;
            sq__network__help__wkd,url)
                cmd="sq__network__help__wkd__url"
                ;;
            sq__network__keyserver,fetch)
                cmd="sq__network__keyserver__fetch"
                ;;
            sq__network__keyserver,help)
                cmd="sq__network__keyserver__help"
                ;;
            sq__network__keyserver,publish)
                cmd="sq__network__keyserver__publish"
                ;;
            sq__network__keyserver__help,fetch)
                cmd="sq__network__keyserver__help__fetch"
                ;;
            sq__network__keyserver__help,help)
                cmd="sq__network__keyserver__help__help"
                ;;
            sq__network__keyserver__help,publish)
                cmd="sq__network__keyserver__help__publish"
                ;;
            sq__network__wkd,direct-url)
                cmd="sq__network__wkd__direct__url"
                ;;
            sq__network__wkd,fetch)
                cmd="sq__network__wkd__fetch"
                ;;
            sq__network__wkd,generate)
                cmd="sq__network__wkd__generate"
                ;;
            sq__network__wkd,help)
                cmd="sq__network__wkd__help"
                ;;
            sq__network__wkd,url)
                cmd="sq__network__wkd__url"
                ;;
            sq__network__wkd__help,direct-url)
                cmd="sq__network__wkd__help__direct__url"
                ;;
            sq__network__wkd__help,fetch)
                cmd="sq__network__wkd__help__fetch"
                ;;
            sq__network__wkd__help,generate)
                cmd="sq__network__wkd__help__generate"
                ;;
            sq__network__wkd__help,help)
                cmd="sq__network__wkd__help__help"
                ;;
            sq__network__wkd__help,url)
                cmd="sq__network__wkd__help__url"
                ;;
            sq__pki,authenticate)
                cmd="sq__pki__authenticate"
                ;;
            sq__pki,certify)
                cmd="sq__pki__certify"
                ;;
            sq__pki,help)
                cmd="sq__pki__help"
                ;;
            sq__pki,identify)
                cmd="sq__pki__identify"
                ;;
            sq__pki,link)
                cmd="sq__pki__link"
                ;;
            sq__pki,list)
                cmd="sq__pki__list"
                ;;
            sq__pki,lookup)
                cmd="sq__pki__lookup"
                ;;
            sq__pki,path)
                cmd="sq__pki__path"
                ;;
            sq__pki__help,authenticate)
                cmd="sq__pki__help__authenticate"
                ;;
            sq__pki__help,certify)
                cmd="sq__pki__help__certify"
                ;;
            sq__pki__help,help)
                cmd="sq__pki__help__help"
                ;;
            sq__pki__help,identify)
                cmd="sq__pki__help__identify"
                ;;
            sq__pki__help,link)
                cmd="sq__pki__help__link"
                ;;
            sq__pki__help,list)
                cmd="sq__pki__help__list"
                ;;
            sq__pki__help,lookup)
                cmd="sq__pki__help__lookup"
                ;;
            sq__pki__help,path)
                cmd="sq__pki__help__path"
                ;;
            sq__pki__help__link,add)
                cmd="sq__pki__help__link__add"
                ;;
            sq__pki__help__link,list)
                cmd="sq__pki__help__link__list"
                ;;
            sq__pki__help__link,retract)
                cmd="sq__pki__help__link__retract"
                ;;
            sq__pki__link,add)
                cmd="sq__pki__link__add"
                ;;
            sq__pki__link,help)
                cmd="sq__pki__link__help"
                ;;
            sq__pki__link,list)
                cmd="sq__pki__link__list"
                ;;
            sq__pki__link,retract)
                cmd="sq__pki__link__retract"
                ;;
            sq__pki__link__help,add)
                cmd="sq__pki__link__help__add"
                ;;
            sq__pki__link__help,help)
                cmd="sq__pki__link__help__help"
                ;;
            sq__pki__link__help,list)
                cmd="sq__pki__link__help__list"
                ;;
            sq__pki__link__help,retract)
                cmd="sq__pki__link__help__retract"
                ;;
            sq__toolbox,armor)
                cmd="sq__toolbox__armor"
                ;;
            sq__toolbox,dearmor)
                cmd="sq__toolbox__dearmor"
                ;;
            sq__toolbox,extract-cert)
                cmd="sq__toolbox__extract__cert"
                ;;
            sq__toolbox,help)
                cmd="sq__toolbox__help"
                ;;
            sq__toolbox,keyring)
                cmd="sq__toolbox__keyring"
                ;;
            sq__toolbox,packet)
                cmd="sq__toolbox__packet"
                ;;
            sq__toolbox__help,armor)
                cmd="sq__toolbox__help__armor"
                ;;
            sq__toolbox__help,dearmor)
                cmd="sq__toolbox__help__dearmor"
                ;;
            sq__toolbox__help,extract-cert)
                cmd="sq__toolbox__help__extract__cert"
                ;;
            sq__toolbox__help,help)
                cmd="sq__toolbox__help__help"
                ;;
            sq__toolbox__help,keyring)
                cmd="sq__toolbox__help__keyring"
                ;;
            sq__toolbox__help,packet)
                cmd="sq__toolbox__help__packet"
                ;;
            sq__toolbox__help__keyring,filter)
                cmd="sq__toolbox__help__keyring__filter"
                ;;
            sq__toolbox__help__keyring,list)
                cmd="sq__toolbox__help__keyring__list"
                ;;
            sq__toolbox__help__keyring,merge)
                cmd="sq__toolbox__help__keyring__merge"
                ;;
            sq__toolbox__help__keyring,split)
                cmd="sq__toolbox__help__keyring__split"
                ;;
            sq__toolbox__help__packet,decrypt)
                cmd="sq__toolbox__help__packet__decrypt"
                ;;
            sq__toolbox__help__packet,dump)
                cmd="sq__toolbox__help__packet__dump"
                ;;
            sq__toolbox__help__packet,join)
                cmd="sq__toolbox__help__packet__join"
                ;;
            sq__toolbox__help__packet,split)
                cmd="sq__toolbox__help__packet__split"
                ;;
            sq__toolbox__keyring,filter)
                cmd="sq__toolbox__keyring__filter"
                ;;
            sq__toolbox__keyring,help)
                cmd="sq__toolbox__keyring__help"
                ;;
            sq__toolbox__keyring,list)
                cmd="sq__toolbox__keyring__list"
                ;;
            sq__toolbox__keyring,merge)
                cmd="sq__toolbox__keyring__merge"
                ;;
            sq__toolbox__keyring,split)
                cmd="sq__toolbox__keyring__split"
                ;;
            sq__toolbox__keyring__help,filter)
                cmd="sq__toolbox__keyring__help__filter"
                ;;
            sq__toolbox__keyring__help,help)
                cmd="sq__toolbox__keyring__help__help"
                ;;
            sq__toolbox__keyring__help,list)
                cmd="sq__toolbox__keyring__help__list"
                ;;
            sq__toolbox__keyring__help,merge)
                cmd="sq__toolbox__keyring__help__merge"
                ;;
            sq__toolbox__keyring__help,split)
                cmd="sq__toolbox__keyring__help__split"
                ;;
            sq__toolbox__packet,decrypt)
                cmd="sq__toolbox__packet__decrypt"
                ;;
            sq__toolbox__packet,dump)
                cmd="sq__toolbox__packet__dump"
                ;;
            sq__toolbox__packet,help)
                cmd="sq__toolbox__packet__help"
                ;;
            sq__toolbox__packet,join)
                cmd="sq__toolbox__packet__join"
                ;;
            sq__toolbox__packet,split)
                cmd="sq__toolbox__packet__split"
                ;;
            sq__toolbox__packet__help,decrypt)
                cmd="sq__toolbox__packet__help__decrypt"
                ;;
            sq__toolbox__packet__help,dump)
                cmd="sq__toolbox__packet__help__dump"
                ;;
            sq__toolbox__packet__help,help)
                cmd="sq__toolbox__packet__help__help"
                ;;
            sq__toolbox__packet__help,join)
                cmd="sq__toolbox__packet__help__join"
                ;;
            sq__toolbox__packet__help,split)
                cmd="sq__toolbox__packet__help__split"
                ;;
            *)
                ;;
        esac
    done

    case "${cmd}" in
        sq)
            opts="-f -v -h --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help encrypt decrypt sign verify inspect cert key pki autocrypt network toolbox version help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__autocrypt)
            opts="-f -v -h --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help import decode encode-sender help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__autocrypt__decode)
            opts="-o -B -f -v -h --output --binary --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__autocrypt__encode__sender)
            opts="-o -f -v -h --output --email --prefer-encrypt --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --email)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --prefer-encrypt)
                    COMPREPLY=($(compgen -W "nopreference mutual" -- "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__autocrypt__help)
            opts="import decode encode-sender help"
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
        sq__autocrypt__help__decode)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__autocrypt__help__encode__sender)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__autocrypt__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__autocrypt__help__import)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__autocrypt__import)
            opts="-f -v -h --recipient-file --session-key --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --recipient-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --session-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__cert)
            opts="-f -v -h --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help import export lint help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__cert__export)
            opts="-B -f -v -h --binary --all --cert --key --userid --grep --email --domain --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [QUERY]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --cert)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --userid)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --grep)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --email)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --domain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__cert__help)
            opts="import export lint help"
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
        sq__cert__help__export)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__cert__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__cert__help__import)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__cert__help__lint)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__cert__import)
            opts="-f -v -h --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__cert__lint)
            opts="-q -F -e -k -o -B -f -v -h --quiet --fix --export-secret-keys --list-keys --output --binary --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__decrypt)
            opts="-o -n -f -v -h --output --signatures --signer-file --recipient-file --private-key-store --dump-session-key --session-key --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --signatures)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -n)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --signer-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --recipient-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --private-key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --session-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__encrypt)
            opts="-o -B -s -f -v -h --output --binary --recipient-email --recipient-userid --recipient-cert --recipient-file --set-metadata-filename --set-metadata-time --signer-file --signer-key --private-key-store --symmetric --encrypt-for --compression --use-expired-subkey --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --recipient-email)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --recipient-userid)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --recipient-cert)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --recipient-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --set-metadata-time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --signer-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --signer-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --private-key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --encrypt-for)
                    COMPREPLY=($(compgen -W "transport storage universal" -- "${cur}"))
                    return 0
                    ;;
                --compression)
                    COMPREPLY=($(compgen -W "none zip zlib bzip2" -- "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__help)
            opts="encrypt decrypt sign verify inspect cert key pki autocrypt network toolbox version help"
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
        sq__help__autocrypt)
            opts="import decode encode-sender"
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
        sq__help__autocrypt__decode)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__autocrypt__encode__sender)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__autocrypt__import)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__cert)
            opts="import export lint"
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
        sq__help__cert__export)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__cert__import)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__cert__lint)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__decrypt)
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
        sq__help__encrypt)
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
        sq__help__help)
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
        sq__help__inspect)
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
        sq__help__key)
            opts="list generate import password expire revoke userid subkey attest-certifications adopt"
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
        sq__help__key__adopt)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__key__attest__certifications)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__key__expire)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__key__generate)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__key__import)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__key__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__key__password)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__key__revoke)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__key__subkey)
            opts="add revoke"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__key__subkey__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__key__subkey__revoke)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__key__userid)
            opts="add revoke strip"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__key__userid__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__key__userid__revoke)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__key__userid__strip)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__network)
            opts="fetch keyserver wkd dane"
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
        sq__help__network__dane)
            opts="generate fetch"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__network__dane__fetch)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__network__dane__generate)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__network__fetch)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__network__keyserver)
            opts="fetch publish"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__network__keyserver__fetch)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__network__keyserver__publish)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__network__wkd)
            opts="generate fetch direct-url url"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__network__wkd__direct__url)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__network__wkd__fetch)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__network__wkd__generate)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__network__wkd__url)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__pki)
            opts="authenticate lookup identify certify link list path"
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
        sq__help__pki__authenticate)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__pki__certify)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__pki__identify)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__pki__link)
            opts="add retract list"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__pki__link__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__pki__link__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__pki__link__retract)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__pki__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__pki__lookup)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__pki__path)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__sign)
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
        sq__help__toolbox)
            opts="keyring extract-cert packet armor dearmor"
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
        sq__help__toolbox__armor)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__toolbox__dearmor)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__toolbox__extract__cert)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__toolbox__keyring)
            opts="list split merge filter"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__toolbox__keyring__filter)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__toolbox__keyring__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__toolbox__keyring__merge)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__toolbox__keyring__split)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__toolbox__packet)
            opts="dump decrypt split join"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__help__toolbox__packet__decrypt)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__toolbox__packet__dump)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__toolbox__packet__join)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__toolbox__packet__split)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__help__verify)
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
        sq__help__version)
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
        sq__inspect)
            opts="-f -v -h --cert --certifications --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --cert)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__key)
            opts="-f -v -h --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help list generate import password expire revoke userid subkey attest-certifications adopt help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__key__adopt)
            opts="-k -o -B -f -v -h --key --expire --allow-broken-crypto --output --binary --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [TARGET-KEY]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -k)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --expire)
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
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__key__attest__certifications)
            opts="-o -B -f -v -h --none --all --output --binary --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [KEY]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__key__expire)
            opts="-o -B -f -v -h --output --binary --subkey --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help <EXPIRY> [FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --subkey)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__key__generate)
            opts="-u -c -o -f -v -h --userid --cipher-suite --with-password --expiry --can-sign --cannot-sign --can-authenticate --cannot-authenticate --can-encrypt --cannot-encrypt --output --rev-cert --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --userid)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -u)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cipher-suite)
                    COMPREPLY=($(compgen -W "rsa3k rsa4k cv25519" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "rsa3k rsa4k cv25519" -- "${cur}"))
                    return 0
                    ;;
                --expiry)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --can-encrypt)
                    COMPREPLY=($(compgen -W "transport storage universal" -- "${cur}"))
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
                --rev-cert)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__key__help)
            opts="list generate import password expire revoke userid subkey attest-certifications adopt help"
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
        sq__key__help__adopt)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__key__help__attest__certifications)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__key__help__expire)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__key__help__generate)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__key__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__key__help__import)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__key__help__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__key__help__password)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__key__help__revoke)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__key__help__subkey)
            opts="add revoke"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__key__help__subkey__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__key__help__subkey__revoke)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__key__help__userid)
            opts="add revoke strip"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__key__help__userid__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__key__help__userid__revoke)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__key__help__userid__strip)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__key__import)
            opts="-f -v -h --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [KEY_FILE]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__key__list)
            opts="-f -v -h --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__key__password)
            opts="-o -B -f -v -h --output --old-password-file --new-password-file --clear --binary --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --old-password-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --new-password-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__key__revoke)
            opts="-o -B -f -v -h --certificate-file --revocation-file --private-key-store --notation --output --binary --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help compromised superseded retired unspecified <MESSAGE>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --certificate-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --revocation-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --private-key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --notation)
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
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__key__subkey)
            opts="-f -v -h --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help add revoke help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__key__subkey__add)
            opts="-o -B -c -f -v -h --output --private-key-store --binary --cipher-suite --expiry --can-sign --can-authenticate --can-encrypt --with-password --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --private-key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cipher-suite)
                    COMPREPLY=($(compgen -W "rsa3k rsa4k cv25519" -- "${cur}"))
                    return 0
                    ;;
                -c)
                    COMPREPLY=($(compgen -W "rsa3k rsa4k cv25519" -- "${cur}"))
                    return 0
                    ;;
                --expiry)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --can-encrypt)
                    COMPREPLY=($(compgen -W "transport storage universal" -- "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__key__subkey__help)
            opts="add revoke help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__key__subkey__help__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__key__subkey__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__key__subkey__help__revoke)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__key__subkey__revoke)
            opts="-o -B -f -v -h --certificate-file --revocation-file --private-key-store --notation --output --binary --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help <SUBKEY> compromised superseded retired unspecified <MESSAGE>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --certificate-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --revocation-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --private-key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --notation)
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
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__key__userid)
            opts="-f -v -h --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help add revoke strip help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__key__userid__add)
            opts="-o -B -f -v -h --output --private-key-store --binary --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help <FILE> <USERID>..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --private-key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__key__userid__help)
            opts="add revoke strip help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__key__userid__help__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__key__userid__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__key__userid__help__revoke)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__key__userid__help__strip)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__key__userid__revoke)
            opts="-o -B -f -v -h --certificate-file --revocation-file --private-key-store --notation --output --binary --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help <USERID> retired unspecified <MESSAGE>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --certificate-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --revocation-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --private-key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --notation)
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
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__key__userid__strip)
            opts="-o -u -B -f -v -h --output --userid --binary --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --userid)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -u)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__network)
            opts="-f -v -h --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help fetch keyserver wkd dane help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__network__dane)
            opts="-f -v -h --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help generate fetch help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__network__dane__fetch)
            opts="-B -o -f -v -h --all --binary --output --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help <ADDRESS>..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__network__dane__generate)
            opts="-s -f -v -h --ttl --size-limit --generic --skip --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help <FQDN> [CERT-RING]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --ttl)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --size-limit)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__network__dane__help)
            opts="generate fetch help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__network__dane__help__fetch)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__network__dane__help__generate)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__network__dane__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__network__fetch)
            opts="-s -o -B -f -v -h --server --output --binary --all --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help <QUERY>..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --server)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -s)
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
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__network__help)
            opts="fetch keyserver wkd dane help"
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
        sq__network__help__dane)
            opts="generate fetch"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__network__help__dane__fetch)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__network__help__dane__generate)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__network__help__fetch)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__network__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__network__help__keyserver)
            opts="fetch publish"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__network__help__keyserver__fetch)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__network__help__keyserver__publish)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__network__help__wkd)
            opts="generate fetch direct-url url"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__network__help__wkd__direct__url)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__network__help__wkd__fetch)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__network__help__wkd__generate)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__network__help__wkd__url)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__network__keyserver)
            opts="-s -f -v -h --server --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help fetch publish help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --server)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -s)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__network__keyserver__fetch)
            opts="-o -B -s -f -v -h --output --binary --all --server --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help <QUERY>..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --server)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -s)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__network__keyserver__help)
            opts="fetch publish help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__network__keyserver__help__fetch)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__network__keyserver__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__network__keyserver__help__publish)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__network__keyserver__publish)
            opts="-s -f -v -h --require-all --server --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --server)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -s)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__network__wkd)
            opts="-f -v -h --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help generate fetch direct-url url help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__network__wkd__direct__url)
            opts="-f -v -h --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help <ADDRESS>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__network__wkd__fetch)
            opts="-B -o -f -v -h --all --binary --output --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help <ADDRESS>..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__network__wkd__generate)
            opts="-d -s -f -v -h --direct-method --skip --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help <WEB-ROOT> <FQDN> [CERT-RING]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__network__wkd__help)
            opts="generate fetch direct-url url help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__network__wkd__help__direct__url)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__network__wkd__help__fetch)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__network__wkd__help__generate)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__network__wkd__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__network__wkd__help__url)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__network__wkd__url)
            opts="-f -v -h --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help <ADDRESS>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__pki)
            opts="-f -v -h --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help authenticate lookup identify certify link list path help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__pki__authenticate)
            opts="-a -f -v -h --email --gossip --certification-network --amount --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help <FINGERPRINT|KEYID> <USERID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --amount)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__pki__certify)
            opts="-o -B -d -a -r -l -f -v -h --output --binary --depth --amount --regex --local --non-revocable --notation --expiry --email --add-userid --allow-not-alive-certifier --allow-revoked-certifier --private-key-store --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help <CERTIFIER-KEY> <KEY_ID|FINGERPRINT|FILE> <USERID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --depth)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -d)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --amount)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --regex)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --expiry)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --private-key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__pki__help)
            opts="authenticate lookup identify certify link list path help"
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
        sq__pki__help__authenticate)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__pki__help__certify)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__pki__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__pki__help__identify)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__pki__help__link)
            opts="add retract list"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__pki__help__link__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__pki__help__link__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__pki__help__link__retract)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__pki__help__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__pki__help__lookup)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__pki__help__path)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__pki__identify)
            opts="-a -f -v -h --gossip --certification-network --amount --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help <FINGERPRINT|KEYID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --amount)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__pki__link)
            opts="-f -v -h --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help add retract list help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__pki__link__add)
            opts="-d -a -r -f -v -h --depth --ca --amount --regex --notation --temporary --expiry --all --userid --email --petname --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help <FINGERPRINT|KEYID> [USERID|EMAIL]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --depth)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -d)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --ca)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --amount)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --regex)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -r)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --expiry)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --userid)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --email)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --petname)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__pki__link__help)
            opts="add retract list help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__pki__link__help__add)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__pki__link__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__pki__link__help__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__pki__link__help__retract)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__pki__link__list)
            opts="-f -v -h --ca --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__pki__link__retract)
            opts="-f -v -h --notation --userid --email --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help <FINGERPRINT|KEYID> [USERID|EMAIL]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --userid)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --email)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__pki__list)
            opts="-a -f -v -h --email --gossip --certification-network --amount --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [PATTERN]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --amount)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__pki__lookup)
            opts="-a -f -v -h --email --gossip --certification-network --amount --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help <USERID>"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --amount)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__pki__path)
            opts="-a -f -v -h --gossip --certification-network --amount --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FINGERPRINT|KEYID] [USERID]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --amount)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -a)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__sign)
            opts="-o -B -a -n -f -v -h --output --binary --private-key-store --detached --cleartext-signature --append --notarize --merge --signer-file --signer-key --notation --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --private-key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --merge)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --signer-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --signer-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__toolbox)
            opts="-f -v -h --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help keyring extract-cert packet armor dearmor help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__toolbox__armor)
            opts="-o -f -v -h --output --label --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --label)
                    COMPREPLY=($(compgen -W "auto message cert key sig file" -- "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__toolbox__dearmor)
            opts="-o -f -v -h --output --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__toolbox__extract__cert)
            opts="-o -B -f -v -h --output --binary --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__toolbox__help)
            opts="keyring extract-cert packet armor dearmor help"
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
        sq__toolbox__help__armor)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__toolbox__help__dearmor)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__toolbox__help__extract__cert)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__toolbox__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__toolbox__help__keyring)
            opts="list split merge filter"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__toolbox__help__keyring__filter)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__toolbox__help__keyring__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__toolbox__help__keyring__merge)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__toolbox__help__keyring__split)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__toolbox__help__packet)
            opts="dump decrypt split join"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__toolbox__help__packet__decrypt)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__toolbox__help__packet__dump)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__toolbox__help__packet__join)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__toolbox__help__packet__split)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__toolbox__keyring)
            opts="-f -v -h --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help list split merge filter help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__toolbox__keyring__filter)
            opts="-o -P -B -f -v -h --output --userid --name --email --domain --handle --prune-certs --binary --to-cert --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --userid)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --name)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --email)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --domain)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --handle)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__toolbox__keyring__help)
            opts="list split merge filter help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__toolbox__keyring__help__filter)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__toolbox__keyring__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__toolbox__keyring__help__list)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__toolbox__keyring__help__merge)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__toolbox__keyring__help__split)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__toolbox__keyring__list)
            opts="-f -v -h --all-userids --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__toolbox__keyring__merge)
            opts="-o -B -f -v -h --output --binary --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__toolbox__keyring__split)
            opts="-p -B -f -v -h --prefix --binary --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --prefix)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -p)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__toolbox__packet)
            opts="-f -v -h --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help dump decrypt split join help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 3 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__toolbox__packet__decrypt)
            opts="-o -B -f -v -h --output --binary --recipient-file --private-key-store --session-key --dump-session-key --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --recipient-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --private-key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --session-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__toolbox__packet__dump)
            opts="-o -x -f -v -h --output --session-key --recipient-file --mpis --hex --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --session-key)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --recipient-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__toolbox__packet__help)
            opts="dump decrypt split join help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
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
        sq__toolbox__packet__help__decrypt)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__toolbox__packet__help__dump)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__toolbox__packet__help__help)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__toolbox__packet__help__join)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__toolbox__packet__help__split)
            opts=""
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 5 ]] ; then
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
        sq__toolbox__packet__join)
            opts="-o -B -f -v -h --output --label --binary --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]..."
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --label)
                    COMPREPLY=($(compgen -W "auto message cert key sig file" -- "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__toolbox__packet__split)
            opts="-B -p -f -v -h --binary --prefix --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 4 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --prefix)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -p)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__verify)
            opts="-o -n -f -v -h --output --detached --signatures --signer-file --signer-cert --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help [FILE]"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --output)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -o)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --detached)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --signatures)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                -n)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --signer-file)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --signer-cert)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
        sq__version)
            opts="-f -v -h --default-output-version --output-versions --force --no-key-store --key-store --no-cert-store --cert-store --pep-cert-store --keyring --output-format --output-version --known-notation --time --trust-root --verbose --help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- "${cur}") )
                return 0
            fi
            case "${prev}" in
                --key-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --pep-cert-store)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --keyring)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --output-format)
                    COMPREPLY=($(compgen -W "human-readable json dot" -- "${cur}"))
                    return 0
                    ;;
                --output-version)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --known-notation)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --time)
                    COMPREPLY=($(compgen -f "${cur}"))
                    return 0
                    ;;
                --trust-root)
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
    complete -F _sq -o nosort -o bashdefault -o default sq
else
    complete -F _sq -o bashdefault -o default sq
fi
