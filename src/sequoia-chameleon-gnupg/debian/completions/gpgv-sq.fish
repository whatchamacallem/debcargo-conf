complete -c gpgv-sq -l keyring -d 'take the keys from the keyring FILE' -r
complete -c gpgv-sq -s o -l output -d 'write output to FILE' -r
complete -c gpgv-sq -l status-fd -d 'write status info to this FD' -r
complete -c gpgv-sq -l weak-digest -d 'reject signatures made with ALGO' -r
complete -c gpgv-sq -s v -l verbose -d 'verbose'
complete -c gpgv-sq -s q -l quiet -d 'be somewhat more quiet'
complete -c gpgv-sq -l ignore-time-conflict -d 'make timestamp conflicts only a warning'
complete -c gpgv-sq -s h -l help -d 'Print help'
