complete -c sq-wot -n "__fish_use_subcommand" -s k -l keyring -d 'Adds KEYRING to the list of keyrings' -r -F
complete -c sq-wot -n "__fish_use_subcommand" -l keyserver -d 'Sets the keyserver to use to KEYSERVER' -r
complete -c sq-wot -n "__fish_use_subcommand" -s r -l trust-root -d 'Treats the specified certificate as a trust root' -r
complete -c sq-wot -n "__fish_use_subcommand" -s f -l format -d 'Render the output in a specific format' -r -f -a "{dot	'output in graphviz\'s DOT format',human-readable	'output in human readable format'}"
complete -c sq-wot -n "__fish_use_subcommand" -s a -l trust-amount -d 'The required amount of trust' -r
complete -c sq-wot -n "__fish_use_subcommand" -l time -d 'Sets the reference time to TIME' -r
complete -c sq-wot -n "__fish_use_subcommand" -l known-notation -d 'Adds NOTATION to the list of known notations' -r
complete -c sq-wot -n "__fish_use_subcommand" -l gpg -d 'Uses gpg\'s keyring and gpg\'s trust roots'
complete -c sq-wot -n "__fish_use_subcommand" -l gpg-keyring -d 'Adds GnuPG\'s keyring to the list of keyrings'
complete -c sq-wot -n "__fish_use_subcommand" -l network -d 'Looks up missing certificates over the network'
complete -c sq-wot -n "__fish_use_subcommand" -l gpg-ownertrust -d 'Causes `sq-wot` to use gpg\'s trust roots as the trust roots'
complete -c sq-wot -n "__fish_use_subcommand" -l gossip -d 'Treats all certificates as unreliable trust roots'
complete -c sq-wot -n "__fish_use_subcommand" -l certification-network -d 'Treats the network as a certification network'
complete -c sq-wot -n "__fish_use_subcommand" -l partial -d 'Require partial authentication'
complete -c sq-wot -n "__fish_use_subcommand" -l full -d 'Require full authentication'
complete -c sq-wot -n "__fish_use_subcommand" -l double -d 'Require double authentication'
complete -c sq-wot -n "__fish_use_subcommand" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sq-wot -n "__fish_use_subcommand" -s V -l version -d 'Print version'
complete -c sq-wot -n "__fish_use_subcommand" -f -a "authenticate" -d 'Authenticate a binding'
complete -c sq-wot -n "__fish_use_subcommand" -f -a "lookup" -d 'Lookup the certificates associated with a User ID'
complete -c sq-wot -n "__fish_use_subcommand" -f -a "identify" -d 'Identify a certificate'
complete -c sq-wot -n "__fish_use_subcommand" -f -a "list" -d 'List all authenticated bindings (User ID and certificate pairs)'
complete -c sq-wot -n "__fish_use_subcommand" -f -a "path" -d 'Verify the specified path'
complete -c sq-wot -n "__fish_use_subcommand" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c sq-wot -n "__fish_seen_subcommand_from authenticate" -s k -l keyring -d 'Adds KEYRING to the list of keyrings' -r -F
complete -c sq-wot -n "__fish_seen_subcommand_from authenticate" -l keyserver -d 'Sets the keyserver to use to KEYSERVER' -r
complete -c sq-wot -n "__fish_seen_subcommand_from authenticate" -s r -l trust-root -d 'Treats the specified certificate as a trust root' -r
complete -c sq-wot -n "__fish_seen_subcommand_from authenticate" -s f -l format -d 'Render the output in a specific format' -r -f -a "{dot	'output in graphviz\'s DOT format',human-readable	'output in human readable format'}"
complete -c sq-wot -n "__fish_seen_subcommand_from authenticate" -s a -l trust-amount -d 'The required amount of trust' -r
complete -c sq-wot -n "__fish_seen_subcommand_from authenticate" -l time -d 'Sets the reference time to TIME' -r
complete -c sq-wot -n "__fish_seen_subcommand_from authenticate" -l known-notation -d 'Adds NOTATION to the list of known notations' -r
complete -c sq-wot -n "__fish_seen_subcommand_from authenticate" -l email -d 'Changes the USERID parameter to match User IDs with the specified email address'
complete -c sq-wot -n "__fish_seen_subcommand_from authenticate" -l gpg -d 'Uses gpg\'s keyring and gpg\'s trust roots'
complete -c sq-wot -n "__fish_seen_subcommand_from authenticate" -l gpg-keyring -d 'Adds GnuPG\'s keyring to the list of keyrings'
complete -c sq-wot -n "__fish_seen_subcommand_from authenticate" -l network -d 'Looks up missing certificates over the network'
complete -c sq-wot -n "__fish_seen_subcommand_from authenticate" -l gpg-ownertrust -d 'Causes `sq-wot` to use gpg\'s trust roots as the trust roots'
complete -c sq-wot -n "__fish_seen_subcommand_from authenticate" -l gossip -d 'Treats all certificates as unreliable trust roots'
complete -c sq-wot -n "__fish_seen_subcommand_from authenticate" -l certification-network -d 'Treats the network as a certification network'
complete -c sq-wot -n "__fish_seen_subcommand_from authenticate" -l partial -d 'Require partial authentication'
complete -c sq-wot -n "__fish_seen_subcommand_from authenticate" -l full -d 'Require full authentication'
complete -c sq-wot -n "__fish_seen_subcommand_from authenticate" -l double -d 'Require double authentication'
complete -c sq-wot -n "__fish_seen_subcommand_from authenticate" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sq-wot -n "__fish_seen_subcommand_from lookup" -s k -l keyring -d 'Adds KEYRING to the list of keyrings' -r -F
complete -c sq-wot -n "__fish_seen_subcommand_from lookup" -l keyserver -d 'Sets the keyserver to use to KEYSERVER' -r
complete -c sq-wot -n "__fish_seen_subcommand_from lookup" -s r -l trust-root -d 'Treats the specified certificate as a trust root' -r
complete -c sq-wot -n "__fish_seen_subcommand_from lookup" -s f -l format -d 'Render the output in a specific format' -r -f -a "{dot	'output in graphviz\'s DOT format',human-readable	'output in human readable format'}"
complete -c sq-wot -n "__fish_seen_subcommand_from lookup" -s a -l trust-amount -d 'The required amount of trust' -r
complete -c sq-wot -n "__fish_seen_subcommand_from lookup" -l time -d 'Sets the reference time to TIME' -r
complete -c sq-wot -n "__fish_seen_subcommand_from lookup" -l known-notation -d 'Adds NOTATION to the list of known notations' -r
complete -c sq-wot -n "__fish_seen_subcommand_from lookup" -l email -d 'Changes the USERID parameter to match User IDs with the specified email address'
complete -c sq-wot -n "__fish_seen_subcommand_from lookup" -l gpg -d 'Uses gpg\'s keyring and gpg\'s trust roots'
complete -c sq-wot -n "__fish_seen_subcommand_from lookup" -l gpg-keyring -d 'Adds GnuPG\'s keyring to the list of keyrings'
complete -c sq-wot -n "__fish_seen_subcommand_from lookup" -l network -d 'Looks up missing certificates over the network'
complete -c sq-wot -n "__fish_seen_subcommand_from lookup" -l gpg-ownertrust -d 'Causes `sq-wot` to use gpg\'s trust roots as the trust roots'
complete -c sq-wot -n "__fish_seen_subcommand_from lookup" -l gossip -d 'Treats all certificates as unreliable trust roots'
complete -c sq-wot -n "__fish_seen_subcommand_from lookup" -l certification-network -d 'Treats the network as a certification network'
complete -c sq-wot -n "__fish_seen_subcommand_from lookup" -l partial -d 'Require partial authentication'
complete -c sq-wot -n "__fish_seen_subcommand_from lookup" -l full -d 'Require full authentication'
complete -c sq-wot -n "__fish_seen_subcommand_from lookup" -l double -d 'Require double authentication'
complete -c sq-wot -n "__fish_seen_subcommand_from lookup" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sq-wot -n "__fish_seen_subcommand_from identify" -s k -l keyring -d 'Adds KEYRING to the list of keyrings' -r -F
complete -c sq-wot -n "__fish_seen_subcommand_from identify" -l keyserver -d 'Sets the keyserver to use to KEYSERVER' -r
complete -c sq-wot -n "__fish_seen_subcommand_from identify" -s r -l trust-root -d 'Treats the specified certificate as a trust root' -r
complete -c sq-wot -n "__fish_seen_subcommand_from identify" -s f -l format -d 'Render the output in a specific format' -r -f -a "{dot	'output in graphviz\'s DOT format',human-readable	'output in human readable format'}"
complete -c sq-wot -n "__fish_seen_subcommand_from identify" -s a -l trust-amount -d 'The required amount of trust' -r
complete -c sq-wot -n "__fish_seen_subcommand_from identify" -l time -d 'Sets the reference time to TIME' -r
complete -c sq-wot -n "__fish_seen_subcommand_from identify" -l known-notation -d 'Adds NOTATION to the list of known notations' -r
complete -c sq-wot -n "__fish_seen_subcommand_from identify" -l gpg -d 'Uses gpg\'s keyring and gpg\'s trust roots'
complete -c sq-wot -n "__fish_seen_subcommand_from identify" -l gpg-keyring -d 'Adds GnuPG\'s keyring to the list of keyrings'
complete -c sq-wot -n "__fish_seen_subcommand_from identify" -l network -d 'Looks up missing certificates over the network'
complete -c sq-wot -n "__fish_seen_subcommand_from identify" -l gpg-ownertrust -d 'Causes `sq-wot` to use gpg\'s trust roots as the trust roots'
complete -c sq-wot -n "__fish_seen_subcommand_from identify" -l gossip -d 'Treats all certificates as unreliable trust roots'
complete -c sq-wot -n "__fish_seen_subcommand_from identify" -l certification-network -d 'Treats the network as a certification network'
complete -c sq-wot -n "__fish_seen_subcommand_from identify" -l partial -d 'Require partial authentication'
complete -c sq-wot -n "__fish_seen_subcommand_from identify" -l full -d 'Require full authentication'
complete -c sq-wot -n "__fish_seen_subcommand_from identify" -l double -d 'Require double authentication'
complete -c sq-wot -n "__fish_seen_subcommand_from identify" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sq-wot -n "__fish_seen_subcommand_from list" -s k -l keyring -d 'Adds KEYRING to the list of keyrings' -r -F
complete -c sq-wot -n "__fish_seen_subcommand_from list" -l keyserver -d 'Sets the keyserver to use to KEYSERVER' -r
complete -c sq-wot -n "__fish_seen_subcommand_from list" -s r -l trust-root -d 'Treats the specified certificate as a trust root' -r
complete -c sq-wot -n "__fish_seen_subcommand_from list" -s f -l format -d 'Render the output in a specific format' -r -f -a "{dot	'output in graphviz\'s DOT format',human-readable	'output in human readable format'}"
complete -c sq-wot -n "__fish_seen_subcommand_from list" -s a -l trust-amount -d 'The required amount of trust' -r
complete -c sq-wot -n "__fish_seen_subcommand_from list" -l time -d 'Sets the reference time to TIME' -r
complete -c sq-wot -n "__fish_seen_subcommand_from list" -l known-notation -d 'Adds NOTATION to the list of known notations' -r
complete -c sq-wot -n "__fish_seen_subcommand_from list" -l email -d 'Changes the USERID parameter to match User IDs with the specified email address'
complete -c sq-wot -n "__fish_seen_subcommand_from list" -l gpg -d 'Uses gpg\'s keyring and gpg\'s trust roots'
complete -c sq-wot -n "__fish_seen_subcommand_from list" -l gpg-keyring -d 'Adds GnuPG\'s keyring to the list of keyrings'
complete -c sq-wot -n "__fish_seen_subcommand_from list" -l network -d 'Looks up missing certificates over the network'
complete -c sq-wot -n "__fish_seen_subcommand_from list" -l gpg-ownertrust -d 'Causes `sq-wot` to use gpg\'s trust roots as the trust roots'
complete -c sq-wot -n "__fish_seen_subcommand_from list" -l gossip -d 'Treats all certificates as unreliable trust roots'
complete -c sq-wot -n "__fish_seen_subcommand_from list" -l certification-network -d 'Treats the network as a certification network'
complete -c sq-wot -n "__fish_seen_subcommand_from list" -l partial -d 'Require partial authentication'
complete -c sq-wot -n "__fish_seen_subcommand_from list" -l full -d 'Require full authentication'
complete -c sq-wot -n "__fish_seen_subcommand_from list" -l double -d 'Require double authentication'
complete -c sq-wot -n "__fish_seen_subcommand_from list" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sq-wot -n "__fish_seen_subcommand_from path" -s k -l keyring -d 'Adds KEYRING to the list of keyrings' -r -F
complete -c sq-wot -n "__fish_seen_subcommand_from path" -l keyserver -d 'Sets the keyserver to use to KEYSERVER' -r
complete -c sq-wot -n "__fish_seen_subcommand_from path" -s r -l trust-root -d 'Treats the specified certificate as a trust root' -r
complete -c sq-wot -n "__fish_seen_subcommand_from path" -s f -l format -d 'Render the output in a specific format' -r -f -a "{dot	'output in graphviz\'s DOT format',human-readable	'output in human readable format'}"
complete -c sq-wot -n "__fish_seen_subcommand_from path" -s a -l trust-amount -d 'The required amount of trust' -r
complete -c sq-wot -n "__fish_seen_subcommand_from path" -l time -d 'Sets the reference time to TIME' -r
complete -c sq-wot -n "__fish_seen_subcommand_from path" -l known-notation -d 'Adds NOTATION to the list of known notations' -r
complete -c sq-wot -n "__fish_seen_subcommand_from path" -l email -d 'Changes the USERID parameter to match User IDs with the specified email address'
complete -c sq-wot -n "__fish_seen_subcommand_from path" -l gpg -d 'Uses gpg\'s keyring and gpg\'s trust roots'
complete -c sq-wot -n "__fish_seen_subcommand_from path" -l gpg-keyring -d 'Adds GnuPG\'s keyring to the list of keyrings'
complete -c sq-wot -n "__fish_seen_subcommand_from path" -l network -d 'Looks up missing certificates over the network'
complete -c sq-wot -n "__fish_seen_subcommand_from path" -l gpg-ownertrust -d 'Causes `sq-wot` to use gpg\'s trust roots as the trust roots'
complete -c sq-wot -n "__fish_seen_subcommand_from path" -l gossip -d 'Treats all certificates as unreliable trust roots'
complete -c sq-wot -n "__fish_seen_subcommand_from path" -l certification-network -d 'Treats the network as a certification network'
complete -c sq-wot -n "__fish_seen_subcommand_from path" -l partial -d 'Require partial authentication'
complete -c sq-wot -n "__fish_seen_subcommand_from path" -l full -d 'Require full authentication'
complete -c sq-wot -n "__fish_seen_subcommand_from path" -l double -d 'Require double authentication'
complete -c sq-wot -n "__fish_seen_subcommand_from path" -s h -l help -d 'Print help (see more with \'--help\')'
complete -c sq-wot -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from authenticate; and not __fish_seen_subcommand_from lookup; and not __fish_seen_subcommand_from identify; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from path; and not __fish_seen_subcommand_from help" -f -a "authenticate" -d 'Authenticate a binding'
complete -c sq-wot -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from authenticate; and not __fish_seen_subcommand_from lookup; and not __fish_seen_subcommand_from identify; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from path; and not __fish_seen_subcommand_from help" -f -a "lookup" -d 'Lookup the certificates associated with a User ID'
complete -c sq-wot -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from authenticate; and not __fish_seen_subcommand_from lookup; and not __fish_seen_subcommand_from identify; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from path; and not __fish_seen_subcommand_from help" -f -a "identify" -d 'Identify a certificate'
complete -c sq-wot -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from authenticate; and not __fish_seen_subcommand_from lookup; and not __fish_seen_subcommand_from identify; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from path; and not __fish_seen_subcommand_from help" -f -a "list" -d 'List all authenticated bindings (User ID and certificate pairs)'
complete -c sq-wot -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from authenticate; and not __fish_seen_subcommand_from lookup; and not __fish_seen_subcommand_from identify; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from path; and not __fish_seen_subcommand_from help" -f -a "path" -d 'Verify the specified path'
complete -c sq-wot -n "__fish_seen_subcommand_from help; and not __fish_seen_subcommand_from authenticate; and not __fish_seen_subcommand_from lookup; and not __fish_seen_subcommand_from identify; and not __fish_seen_subcommand_from list; and not __fish_seen_subcommand_from path; and not __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
