ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sorin-custom"
DISABLE_AUTO_UPDATE="true"
plugins=(autojump chruby extract osx zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
unsetopt autonamedirs
unsetopt correct_all # Disable zsh autocorrect

source $HOME/.path
source $HOME/.exports
[ -f $HOME/.local-exports ] && source $HOME/.local-exports

# Git shortcuts
alias cpg='git rev-parse HEAD | tr -d "\n" | pbcopy'
alias cpgp='cpg && git push'

# hub
alias git=hub

# autoenv
source /usr/local/opt/autoenv/activate.sh

