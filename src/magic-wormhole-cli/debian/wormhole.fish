complete -c magic-wormhole-cli -n "__fish_use_subcommand" -s v -l verbose -d 'Enable logging to stdout, for debugging purposes'
complete -c magic-wormhole-cli -n "__fish_use_subcommand" -s h -l help -d 'Print help'
complete -c magic-wormhole-cli -n "__fish_use_subcommand" -s V -l version -d 'Print version'
complete -c magic-wormhole-cli -n "__fish_use_subcommand" -f -a "send" -d 'Send a file or a folder'
complete -c magic-wormhole-cli -n "__fish_use_subcommand" -f -a "receive" -d 'Receive a file or a folder'
complete -c magic-wormhole-cli -n "__fish_use_subcommand" -f -a "send-many" -d 'Send a file to many recipients'
complete -c magic-wormhole-cli -n "__fish_use_subcommand" -f -a "forward" -d 'Forward ports from one machine to another'
complete -c magic-wormhole-cli -n "__fish_use_subcommand" -f -a "completion" -d 'Generate shell completions for the wormhole CLI'
complete -c magic-wormhole-cli -n "__fish_use_subcommand" -f -a "help"
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send" -l relay-server -l relay -d 'Use a custom relay server (specify multiple times for multiple relays)' -r -f
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send" -l rendezvous-server -d 'Use a custom rendezvous server. Both sides need to use the same value in order to find each other' -r -f
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send" -l code -d 'Enter a code instead of generating one automatically' -r
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send" -s c -l code-length -d 'Length of code (in bytes/words)' -r
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send" -l rename -l name -d 'Suggest a different name to the receiver to keep the file\'s actual name secret. Not allowed when sending more than one file' -r
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send" -l force-direct -d 'Disable the relay server support and force a direct connection'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send" -l force-relay -d 'Always route traffic over a relay server. This hides your IP address from the peer (but not from the server operators. Use Tor for that)'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send" -s v -l verbose -d 'Enable logging to stdout, for debugging purposes'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send" -s h -l help -d 'Print help'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send" -s V -l version -d 'Print version'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from receive" -l relay-server -l relay -d 'Use a custom relay server (specify multiple times for multiple relays)' -r -f
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from receive" -l rendezvous-server -d 'Use a custom rendezvous server. Both sides need to use the same value in order to find each other' -r -f
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from receive" -l out-dir -d 'Store transferred file or folder in the specified directory. Defaults to $PWD' -r -f -a "(__fish_complete_directories)"
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from receive" -l noconfirm -l yes -d 'Accept file transfer without asking for confirmation'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from receive" -l force-direct -d 'Disable the relay server support and force a direct connection'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from receive" -l force-relay -d 'Always route traffic over a relay server. This hides your IP address from the peer (but not from the server operators. Use Tor for that)'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from receive" -s v -l verbose -d 'Enable logging to stdout, for debugging purposes'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from receive" -s h -l help -d 'Print help'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from receive" -s V -l version -d 'Print version'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send-many" -s n -l tries -d 'Only send the file up to n times, limiting the number of people that may receive it. These are also the number of tries a potential attacker gets at guessing the password' -r
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send-many" -l timeout -d 'Automatically stop providing the file after a certain amount of time' -r
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send-many" -l relay-server -l relay -d 'Use a custom relay server (specify multiple times for multiple relays)' -r -f
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send-many" -l rendezvous-server -d 'Use a custom rendezvous server. Both sides need to use the same value in order to find each other' -r -f
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send-many" -l code -d 'Enter a code instead of generating one automatically' -r
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send-many" -s c -l code-length -d 'Length of code (in bytes/words)' -r
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send-many" -l rename -l name -d 'Suggest a different name to the receiver to keep the file\'s actual name secret. Not allowed when sending more than one file' -r
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send-many" -l force-direct -d 'Disable the relay server support and force a direct connection'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send-many" -l force-relay -d 'Always route traffic over a relay server. This hides your IP address from the peer (but not from the server operators. Use Tor for that)'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send-many" -s v -l verbose -d 'Enable logging to stdout, for debugging purposes'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send-many" -s h -l help -d 'Print help'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from send-many" -s V -l version -d 'Print version'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and not __fish_seen_subcommand_from serve; and not __fish_seen_subcommand_from connect" -s v -l verbose -d 'Enable logging to stdout, for debugging purposes'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and not __fish_seen_subcommand_from serve; and not __fish_seen_subcommand_from connect" -s h -l help -d 'Print help'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and not __fish_seen_subcommand_from serve; and not __fish_seen_subcommand_from connect" -s V -l version -d 'Print version'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and not __fish_seen_subcommand_from serve; and not __fish_seen_subcommand_from connect" -f -a "serve" -d 'Make the following ports of your system available to your peer'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and not __fish_seen_subcommand_from serve; and not __fish_seen_subcommand_from connect" -f -a "connect" -d 'Connect to some ports forwarded to you'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and __fish_seen_subcommand_from serve" -l relay-server -l relay -d 'Use a custom relay server (specify multiple times for multiple relays)' -r -f
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and __fish_seen_subcommand_from serve" -l rendezvous-server -d 'Use a custom rendezvous server. Both sides need to use the same value in order to find each other' -r -f
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and __fish_seen_subcommand_from serve" -l code -d 'Enter a code instead of generating one automatically' -r
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and __fish_seen_subcommand_from serve" -s c -l code-length -d 'Length of code (in bytes/words)' -r
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and __fish_seen_subcommand_from serve" -l force-direct -d 'Disable the relay server support and force a direct connection'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and __fish_seen_subcommand_from serve" -l force-relay -d 'Always route traffic over a relay server. This hides your IP address from the peer (but not from the server operators. Use Tor for that)'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and __fish_seen_subcommand_from serve" -s v -l verbose -d 'Enable logging to stdout, for debugging purposes'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and __fish_seen_subcommand_from serve" -s h -l help -d 'Print help'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and __fish_seen_subcommand_from serve" -s V -l version -d 'Print version'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and __fish_seen_subcommand_from connect" -s p -l port -d 'Bind to specific ports instead of taking random free high ports. Can be provided multiple times' -r
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and __fish_seen_subcommand_from connect" -l bind -d 'Bind to a specific address to accept the forwarding. Depending on your system and firewall, this may make the forwarded ports accessible from the outside' -r -f
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and __fish_seen_subcommand_from connect" -l relay-server -l relay -d 'Use a custom relay server (specify multiple times for multiple relays)' -r -f
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and __fish_seen_subcommand_from connect" -l rendezvous-server -d 'Use a custom rendezvous server. Both sides need to use the same value in order to find each other' -r -f
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and __fish_seen_subcommand_from connect" -l noconfirm -l yes -d 'Accept the forwarding without asking for confirmation'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and __fish_seen_subcommand_from connect" -l force-direct -d 'Disable the relay server support and force a direct connection'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and __fish_seen_subcommand_from connect" -l force-relay -d 'Always route traffic over a relay server. This hides your IP address from the peer (but not from the server operators. Use Tor for that)'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and __fish_seen_subcommand_from connect" -s v -l verbose -d 'Enable logging to stdout, for debugging purposes'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and __fish_seen_subcommand_from connect" -s h -l help -d 'Print help'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from forward; and __fish_seen_subcommand_from connect" -s V -l version -d 'Print version'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from completion" -s v -l verbose -d 'Enable logging to stdout, for debugging purposes'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from completion" -s h -l help -d 'Print help'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from completion" -s V -l version -d 'Print version'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from help" -s v -l verbose -d 'Enable logging to stdout, for debugging purposes'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from help" -s h -l help -d 'Print help'
complete -c magic-wormhole-cli -n "__fish_seen_subcommand_from help" -s V -l version -d 'Print version'
