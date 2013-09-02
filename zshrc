ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster-custom"
plugins=(git autojump osx travis musicglue)

source $ZSH/oh-my-zsh.sh
unsetopt autonamedirs
unsetopt correct_all # Disable zsh autocorrect

source $HOME/.path
source $HOME/.exports

# Base16
source $HOME/.base16-shell/base16-solarized.dark.sh

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Git shortcuts
alias cpg='git rev-parse HEAD | tr -d "\n" | pbcopy'
alias cpgp='cpg && git push'
alias git=hub

alias open-html="sed -n -e '/<html>/,/<\/html>/ p' > /tmp/cli-output.html; open /tmp/cli-output.html"

alias tree="tree -L 2 -C"

alias ppjson="python -mjson.tool | pygmentize -l javascript"

function phpjson() {
    php -r "echo json_encode(unserialize('$1'));" | ppjson
}

function lipsum() {
    php -r "echo json_decode(file_get_contents('http://lipsum.com/feed/json?amount=1'))->feed->lipsum;" | pbcopy
}
