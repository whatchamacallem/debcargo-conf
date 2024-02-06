complete -c gpg-sq -l tofu-policy -d 'set the TOFU policy for a key' -r
complete -c gpg-sq -l options -d 'read options from FILE' -r
complete -c gpg-sq -l log-file -d 'write server mode logs to FILE' -r
complete -c gpg-sq -l default-key -d 'use NAME as default secret key' -r
complete -c gpg-sq -l encrypt-to -d 'encrypt to user ID NAME as well' -r
complete -c gpg-sq -l group -d 'set up email aliases' -r
complete -c gpg-sq -s o -l output -d 'write output to FILE' -r
complete -c gpg-sq -s z -d 'set compress level to N (0 disables)' -r
complete -c gpg-sq -l auto-key-locate -d 'use MECHANISMS to locate keys by mail address' -r
complete -c gpg-sq -s r -l recipient -d 'encrypt for USERID' -r
complete -c gpg-sq -s u -l local-user -d 'use USERID to sign or decrypt' -r
complete -c gpg-sq -s s -l sign -d 'make a signature'
complete -c gpg-sq -l clear-sign -d 'make a clear text signature'
complete -c gpg-sq -s b -l detach-sign -d 'make a detached signature'
complete -c gpg-sq -s e -l encrypt -d 'encrypt data'
complete -c gpg-sq -s c -l symmetric -d 'encryption only with symmetric cipher'
complete -c gpg-sq -s d -l decrypt -d 'decrypt data (default)'
complete -c gpg-sq -l verify -d 'verify a signature'
complete -c gpg-sq -s k -l list-keys -d 'list keys'
complete -c gpg-sq -l list-signatures -d 'list keys and signatures'
complete -c gpg-sq -l check-signatures -d 'list and check key signatures'
complete -c gpg-sq -l fingerprint -d 'list keys and fingerprints'
complete -c gpg-sq -s K -l list-secret-keys -d 'list secret keys'
complete -c gpg-sq -l generate-key -d 'generate a new key pair'
complete -c gpg-sq -l quick-generate-key -d 'quickly generate a new key pair'
complete -c gpg-sq -l quick-add-uid -d 'quickly add a new user-id'
complete -c gpg-sq -l quick-revoke-uid -d 'quickly revoke a user-id'
complete -c gpg-sq -l quick-set-expire -d 'quickly set a new expiration date'
complete -c gpg-sq -l full-generate-key -d 'full featured key pair generation'
complete -c gpg-sq -l generate-revocation -d 'generate a revocation certificate'
complete -c gpg-sq -l delete-keys -d 'remove keys from the public keyring'
complete -c gpg-sq -l delete-secret-keys -d 'remove keys from the secret keyring'
complete -c gpg-sq -l quick-sign-key -d 'quickly sign a key'
complete -c gpg-sq -l quick-lsign-key -d 'quickly sign a key locally'
complete -c gpg-sq -l quick-revoke-sig -d 'quickly revoke a key signature'
complete -c gpg-sq -l sign-key -d 'sign a key'
complete -c gpg-sq -l lsign-key -d 'sign a key locally'
complete -c gpg-sq -l edit-key -d 'sign or edit a key'
complete -c gpg-sq -l change-passphrase -d 'change a passphrase'
complete -c gpg-sq -l export -d 'export keys'
complete -c gpg-sq -l send-keys -d 'export keys to a keyserver'
complete -c gpg-sq -l receive-keys -d 'import keys from a keyserver'
complete -c gpg-sq -l search-keys -d 'search for keys on a keyserver'
complete -c gpg-sq -l refresh-keys -d 'update all keys from a keyserver'
complete -c gpg-sq -l import -d 'import/merge keys'
complete -c gpg-sq -l update-trustdb -d 'update the trust database'
complete -c gpg-sq -l print-md -d 'print message digests'
complete -c gpg-sq -l server -d 'run in server mode'
complete -c gpg-sq -s v -l verbose -d 'verbose'
complete -c gpg-sq -s q -l quiet -d 'be somewhat more quiet'
complete -c gpg-sq -l openpgp -d 'use strict OpenPGP behavior'
complete -c gpg-sq -s n -l dry-run -d 'do not make any changes'
complete -c gpg-sq -s i -l interactive -d 'prompt before overwriting'
complete -c gpg-sq -s a -l armor -d 'create ascii armored output'
complete -c gpg-sq -l textmode -d 'use canonical text mode'
complete -c gpg-sq -l auto-key-import -d 'import missing key from a signature'
complete -c gpg-sq -l include-key-block -d 'include the public key in signatures'
complete -c gpg-sq -l disable-dirmngr -d 'disable all access to the dirmngr'
complete -c gpg-sq -s h -l help -d 'Print help'
