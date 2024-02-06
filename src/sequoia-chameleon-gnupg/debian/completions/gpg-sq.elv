
use builtin;
use str;

set edit:completion:arg-completer[gpg-sq] = {|@words|
    fn spaces {|n|
        builtin:repeat $n ' ' | str:join ''
    }
    fn cand {|text desc|
        edit:complex-candidate $text &display=$text' '(spaces (- 14 (wcswidth $text)))$desc
    }
    var command = 'gpg-sq'
    for word $words[1..-1] {
        if (str:has-prefix $word '-') {
            break
        }
        set command = $command';'$word
    }
    var completions = [
        &'gpg-sq'= {
            cand --tofu-policy 'set the TOFU policy for a key'
            cand --options 'read options from FILE'
            cand --log-file 'write server mode logs to FILE'
            cand --default-key 'use NAME as default secret key'
            cand --encrypt-to 'encrypt to user ID NAME as well'
            cand --group 'set up email aliases'
            cand -o 'write output to FILE'
            cand --output 'write output to FILE'
            cand -z 'set compress level to N (0 disables)'
            cand --auto-key-locate 'use MECHANISMS to locate keys by mail address'
            cand -r 'encrypt for USERID'
            cand --recipient 'encrypt for USERID'
            cand -u 'use USERID to sign or decrypt'
            cand --local-user 'use USERID to sign or decrypt'
            cand -s 'make a signature'
            cand --sign 'make a signature'
            cand --clear-sign 'make a clear text signature'
            cand -b 'make a detached signature'
            cand --detach-sign 'make a detached signature'
            cand -e 'encrypt data'
            cand --encrypt 'encrypt data'
            cand -c 'encryption only with symmetric cipher'
            cand --symmetric 'encryption only with symmetric cipher'
            cand -d 'decrypt data (default)'
            cand --decrypt 'decrypt data (default)'
            cand --verify 'verify a signature'
            cand -k 'list keys'
            cand --list-keys 'list keys'
            cand --list-signatures 'list keys and signatures'
            cand --check-signatures 'list and check key signatures'
            cand --fingerprint 'list keys and fingerprints'
            cand -K 'list secret keys'
            cand --list-secret-keys 'list secret keys'
            cand --generate-key 'generate a new key pair'
            cand --quick-generate-key 'quickly generate a new key pair'
            cand --quick-add-uid 'quickly add a new user-id'
            cand --quick-revoke-uid 'quickly revoke a user-id'
            cand --quick-set-expire 'quickly set a new expiration date'
            cand --full-generate-key 'full featured key pair generation'
            cand --generate-revocation 'generate a revocation certificate'
            cand --delete-keys 'remove keys from the public keyring'
            cand --delete-secret-keys 'remove keys from the secret keyring'
            cand --quick-sign-key 'quickly sign a key'
            cand --quick-lsign-key 'quickly sign a key locally'
            cand --quick-revoke-sig 'quickly revoke a key signature'
            cand --sign-key 'sign a key'
            cand --lsign-key 'sign a key locally'
            cand --edit-key 'sign or edit a key'
            cand --change-passphrase 'change a passphrase'
            cand --export 'export keys'
            cand --send-keys 'export keys to a keyserver'
            cand --receive-keys 'import keys from a keyserver'
            cand --search-keys 'search for keys on a keyserver'
            cand --refresh-keys 'update all keys from a keyserver'
            cand --import 'import/merge keys'
            cand --update-trustdb 'update the trust database'
            cand --print-md 'print message digests'
            cand --server 'run in server mode'
            cand -v 'verbose'
            cand --verbose 'verbose'
            cand -q 'be somewhat more quiet'
            cand --quiet 'be somewhat more quiet'
            cand --openpgp 'use strict OpenPGP behavior'
            cand -n 'do not make any changes'
            cand --dry-run 'do not make any changes'
            cand -i 'prompt before overwriting'
            cand --interactive 'prompt before overwriting'
            cand -a 'create ascii armored output'
            cand --armor 'create ascii armored output'
            cand --textmode 'use canonical text mode'
            cand --auto-key-import 'import missing key from a signature'
            cand --include-key-block 'include the public key in signatures'
            cand --disable-dirmngr 'disable all access to the dirmngr'
            cand -h 'Print help'
            cand --help 'Print help'
        }
    ]
    $completions[$command]
}
