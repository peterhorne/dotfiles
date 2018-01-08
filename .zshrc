ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sorin-custom"
DISABLE_AUTO_UPDATE="true"
plugins=(autojump chruby ctrl-zsh osx zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
unsetopt autonamedirs
unsetopt correct_all # Disable zsh autocorrect
setopt extended_glob

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export EDITOR='nvim'

[ -f $HOME/.local-exports ] && source $HOME/.local-exports

# rustup
source $HOME/.cargo/env

# Git shortcuts
alias cpg='git rev-parse HEAD | tr -d "\n" | pbcopy'
alias cpgp='cpg && git push'

# hub
alias git=hub

# direnv
export DIRENV_LOG_FORMAT=""
eval "$(direnv hook zsh)"

# go path
export GOPATH="$HOME/.go"

# latex binaries
export PATH="/Library/TeX/texbin:$PATH"

# fix <C-h> in vim (no backspace)
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > /tmp/$TERM.ti
tic /tmp/$TERM.ti
rm /tmp/$TERM.ti

# FZF
export FZF_DEFAULT_COMMAND='ag -g "" --hidden'

# FZF git commits
fcs() {
  local commits commit
  commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
  echo -n $(echo "$commit" | sed "s/ .*//")
}

alias lower="tr '[:upper:]' '[:lower:]'"
alias upper="tr '[:lower:]' '[:upper:]'"
alias uuid="uuidgen | lower"
