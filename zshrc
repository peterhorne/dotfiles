ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster-custom"
DISABLE_AUTO_UPDATE="true"
plugins=(git autojump osx musicglue virtualenvwrapper zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
unsetopt autonamedirs
unsetopt correct_all # Disable zsh autocorrect

source $HOME/.path
[ -f $HOME/.local-exports ] && source $HOME/.local-exports
source $HOME/.exports

# Base16
source $HOME/.base16-shell/base16-solarized.dark.sh

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

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

function img() {
    curl ihmage.com/$1
}

