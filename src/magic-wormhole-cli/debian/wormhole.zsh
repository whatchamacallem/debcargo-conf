compdef _magic-wormhole-cli magic-wormhole-cli
 _magic-wormhole-cli() { #compdef magic-wormhole-cli

autoload -U is-at-least

_magic-wormhole-cli() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" \
'-v[Enable logging to stdout, for debugging purposes]' \
'--verbose[Enable logging to stdout, for debugging purposes]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_magic-wormhole-cli_commands" \
"*::: :->magic-wormhole-cli" \
&& ret=0
    case $state in
    (magic-wormhole-cli)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:magic-wormhole-cli-command-$line[1]:"
        case $line[1] in
            (send)
_arguments "${_arguments_options[@]}" \
'*--relay-server=[Use a custom relay server (specify multiple times for multiple relays)]:tcp://HOSTNAME:PORT:_urls' \
'*--relay=[Use a custom relay server (specify multiple times for multiple relays)]:tcp://HOSTNAME:PORT:_urls' \
'--rendezvous-server=[Use a custom rendezvous server. Both sides need to use the same value in order to find each other]:ws://example.org:_urls' \
'--code=[Enter a code instead of generating one automatically]:CODE: ' \
'-c+[Length of code (in bytes/words)]:NUMWORDS: ' \
'--code-length=[Length of code (in bytes/words)]:NUMWORDS: ' \
'--rename=[Suggest a different name to the receiver to keep the file'\''s actual name secret. Not allowed when sending more than one file]:FILE_NAME: ' \
'--name=[Suggest a different name to the receiver to keep the file'\''s actual name secret. Not allowed when sending more than one file]:FILE_NAME: ' \
'--force-direct[Disable the relay server support and force a direct connection]' \
'(--force-direct)--force-relay[Always route traffic over a relay server. This hides your IP address from the peer (but not from the server operators. Use Tor for that)]' \
'-v[Enable logging to stdout, for debugging purposes]' \
'--verbose[Enable logging to stdout, for debugging purposes]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'*::files:_files' \
&& ret=0
;;
(receive)
_arguments "${_arguments_options[@]}" \
'*--relay-server=[Use a custom relay server (specify multiple times for multiple relays)]:tcp://HOSTNAME:PORT:_urls' \
'*--relay=[Use a custom relay server (specify multiple times for multiple relays)]:tcp://HOSTNAME:PORT:_urls' \
'--rendezvous-server=[Use a custom rendezvous server. Both sides need to use the same value in order to find each other]:ws://example.org:_urls' \
'--out-dir=[Store transferred file or folder in the specified directory. Defaults to \$PWD]:PATH:_files -/' \
'--noconfirm[Accept file transfer without asking for confirmation]' \
'--yes[Accept file transfer without asking for confirmation]' \
'--force-direct[Disable the relay server support and force a direct connection]' \
'(--force-direct)--force-relay[Always route traffic over a relay server. This hides your IP address from the peer (but not from the server operators. Use Tor for that)]' \
'-v[Enable logging to stdout, for debugging purposes]' \
'--verbose[Enable logging to stdout, for debugging purposes]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::code -- Provide the code now rather than typing it interactively:' \
&& ret=0
;;
(send-many)
_arguments "${_arguments_options[@]}" \
'-n+[Only send the file up to n times, limiting the number of people that may receive it. These are also the number of tries a potential attacker gets at guessing the password]:N: ' \
'--tries=[Only send the file up to n times, limiting the number of people that may receive it. These are also the number of tries a potential attacker gets at guessing the password]:N: ' \
'--timeout=[Automatically stop providing the file after a certain amount of time]:MINUTES: ' \
'*--relay-server=[Use a custom relay server (specify multiple times for multiple relays)]:tcp://HOSTNAME:PORT:_urls' \
'*--relay=[Use a custom relay server (specify multiple times for multiple relays)]:tcp://HOSTNAME:PORT:_urls' \
'--rendezvous-server=[Use a custom rendezvous server. Both sides need to use the same value in order to find each other]:ws://example.org:_urls' \
'--code=[Enter a code instead of generating one automatically]:CODE: ' \
'-c+[Length of code (in bytes/words)]:NUMWORDS: ' \
'--code-length=[Length of code (in bytes/words)]:NUMWORDS: ' \
'--rename=[Suggest a different name to the receiver to keep the file'\''s actual name secret. Not allowed when sending more than one file]:FILE_NAME: ' \
'--name=[Suggest a different name to the receiver to keep the file'\''s actual name secret. Not allowed when sending more than one file]:FILE_NAME: ' \
'--force-direct[Disable the relay server support and force a direct connection]' \
'(--force-direct)--force-relay[Always route traffic over a relay server. This hides your IP address from the peer (but not from the server operators. Use Tor for that)]' \
'-v[Enable logging to stdout, for debugging purposes]' \
'--verbose[Enable logging to stdout, for debugging purposes]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'*::files:_files' \
&& ret=0
;;
(forward)
_arguments "${_arguments_options[@]}" \
'-v[Enable logging to stdout, for debugging purposes]' \
'--verbose[Enable logging to stdout, for debugging purposes]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_magic-wormhole-cli__forward_commands" \
"*::: :->forward" \
&& ret=0

    case $state in
    (forward)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:magic-wormhole-cli-forward-command-$line[1]:"
        case $line[1] in
            (serve)
_arguments "${_arguments_options[@]}" \
'*--relay-server=[Use a custom relay server (specify multiple times for multiple relays)]:tcp://HOSTNAME:PORT:_urls' \
'*--relay=[Use a custom relay server (specify multiple times for multiple relays)]:tcp://HOSTNAME:PORT:_urls' \
'--rendezvous-server=[Use a custom rendezvous server. Both sides need to use the same value in order to find each other]:ws://example.org:_urls' \
'--code=[Enter a code instead of generating one automatically]:CODE: ' \
'-c+[Length of code (in bytes/words)]:NUMWORDS: ' \
'--code-length=[Length of code (in bytes/words)]:NUMWORDS: ' \
'--force-direct[Disable the relay server support and force a direct connection]' \
'(--force-direct)--force-relay[Always route traffic over a relay server. This hides your IP address from the peer (but not from the server operators. Use Tor for that)]' \
'-v[Enable logging to stdout, for debugging purposes]' \
'--verbose[Enable logging to stdout, for debugging purposes]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'*::targets -- List of ports to open up. You can optionally specify a domain/address to forward remote ports:_hosts' \
&& ret=0
;;
(connect)
_arguments "${_arguments_options[@]}" \
'*-p+[Bind to specific ports instead of taking random free high ports. Can be provided multiple times]:PORT: ' \
'*--port=[Bind to specific ports instead of taking random free high ports. Can be provided multiple times]:PORT: ' \
'--bind=[Bind to a specific address to accept the forwarding. Depending on your system and firewall, this may make the forwarded ports accessible from the outside]:ADDRESS:( )' \
'*--relay-server=[Use a custom relay server (specify multiple times for multiple relays)]:tcp://HOSTNAME:PORT:_urls' \
'*--relay=[Use a custom relay server (specify multiple times for multiple relays)]:tcp://HOSTNAME:PORT:_urls' \
'--rendezvous-server=[Use a custom rendezvous server. Both sides need to use the same value in order to find each other]:ws://example.org:_urls' \
'--noconfirm[Accept the forwarding without asking for confirmation]' \
'--yes[Accept the forwarding without asking for confirmation]' \
'--force-direct[Disable the relay server support and force a direct connection]' \
'(--force-direct)--force-relay[Always route traffic over a relay server. This hides your IP address from the peer (but not from the server operators. Use Tor for that)]' \
'-v[Enable logging to stdout, for debugging purposes]' \
'--verbose[Enable logging to stdout, for debugging purposes]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
'::code -- Provide the code now rather than typing it interactively:' \
&& ret=0
;;
        esac
    ;;
esac
;;
(completion)
_arguments "${_arguments_options[@]}" \
'-v[Enable logging to stdout, for debugging purposes]' \
'--verbose[Enable logging to stdout, for debugging purposes]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':shell -- The shell type to generate completions for (bash, elvish, powershell, zsh):(bash elvish fish powershell zsh)' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" \
'-v[Enable logging to stdout, for debugging purposes]' \
'--verbose[Enable logging to stdout, for debugging purposes]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
        esac
    ;;
esac
}

(( $+functions[_magic-wormhole-cli_commands] )) ||
_magic-wormhole-cli_commands() {
    local commands; commands=(
'send:Send a file or a folder' \
'tx:Send a file or a folder' \
'receive:Receive a file or a folder' \
'rx:Receive a file or a folder' \
'send-many:Send a file to many recipients' \
'forward:Forward ports from one machine to another' \
'completion:Generate shell completions for the wormhole CLI' \
'help:' \
    )
    _describe -t commands 'magic-wormhole-cli commands' commands "$@"
}
(( $+functions[_magic-wormhole-cli__completion_commands] )) ||
_magic-wormhole-cli__completion_commands() {
    local commands; commands=()
    _describe -t commands 'magic-wormhole-cli completion commands' commands "$@"
}
(( $+functions[_magic-wormhole-cli__forward__connect_commands] )) ||
_magic-wormhole-cli__forward__connect_commands() {
    local commands; commands=()
    _describe -t commands 'magic-wormhole-cli forward connect commands' commands "$@"
}
(( $+functions[_magic-wormhole-cli__forward_commands] )) ||
_magic-wormhole-cli__forward_commands() {
    local commands; commands=(
'serve:Make the following ports of your system available to your peer' \
'open:Make the following ports of your system available to your peer' \
'connect:Connect to some ports forwarded to you' \
    )
    _describe -t commands 'magic-wormhole-cli forward commands' commands "$@"
}
(( $+functions[_magic-wormhole-cli__help_commands] )) ||
_magic-wormhole-cli__help_commands() {
    local commands; commands=()
    _describe -t commands 'magic-wormhole-cli help commands' commands "$@"
}
(( $+functions[_magic-wormhole-cli__receive_commands] )) ||
_magic-wormhole-cli__receive_commands() {
    local commands; commands=()
    _describe -t commands 'magic-wormhole-cli receive commands' commands "$@"
}
(( $+functions[_magic-wormhole-cli__send_commands] )) ||
_magic-wormhole-cli__send_commands() {
    local commands; commands=()
    _describe -t commands 'magic-wormhole-cli send commands' commands "$@"
}
(( $+functions[_magic-wormhole-cli__send-many_commands] )) ||
_magic-wormhole-cli__send-many_commands() {
    local commands; commands=()
    _describe -t commands 'magic-wormhole-cli send-many commands' commands "$@"
}
(( $+functions[_magic-wormhole-cli__forward__serve_commands] )) ||
_magic-wormhole-cli__forward__serve_commands() {
    local commands; commands=()
    _describe -t commands 'magic-wormhole-cli forward serve commands' commands "$@"
}

if [ "$funcstack[1]" = "_magic-wormhole-cli" ]; then
    _magic-wormhole-cli "$@"
else
    compdef _magic-wormhole-cli magic-wormhole-cli
fi
 }

if [ "$funcstack[1]" = "magic-wormhole-cli" ]; then
   magic-wormhole-cli "$@"
fi