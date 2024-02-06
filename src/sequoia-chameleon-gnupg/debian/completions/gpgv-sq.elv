
use builtin;
use str;

set edit:completion:arg-completer[gpgv-sq] = {|@words|
    fn spaces {|n|
        builtin:repeat $n ' ' | str:join ''
    }
    fn cand {|text desc|
        edit:complex-candidate $text &display=$text' '(spaces (- 14 (wcswidth $text)))$desc
    }
    var command = 'gpgv-sq'
    for word $words[1..-1] {
        if (str:has-prefix $word '-') {
            break
        }
        set command = $command';'$word
    }
    var completions = [
        &'gpgv-sq'= {
            cand --keyring 'take the keys from the keyring FILE'
            cand -o 'write output to FILE'
            cand --output 'write output to FILE'
            cand --status-fd 'write status info to this FD'
            cand --weak-digest 'reject signatures made with ALGO'
            cand -v 'verbose'
            cand --verbose 'verbose'
            cand -q 'be somewhat more quiet'
            cand --quiet 'be somewhat more quiet'
            cand --ignore-time-conflict 'make timestamp conflicts only a warning'
            cand -h 'Print help'
            cand --help 'Print help'
        }
    ]
    $completions[$command]
}
