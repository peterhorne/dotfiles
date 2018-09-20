autoload -U compinit && compinit

autoload -U colors && colors
export LSCOLORS="Gxfxcxdxbxegedabagacad"
alias ls='ls -G'
setopt auto_cd
bindkey '^r' history-incremental-search-backward

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^x^e" edit-command-line

export PAGER=less
export LESS=R # clear screen after `git log`

## History file configuration
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

# Case-insensitive tab-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'


export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export EDITOR='nvim'

# Fix fn-backspace
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char

# Setup prompt
setopt prompt_subst
if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
  function git_prompt_info() {
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
    echo " %{$fg[cyan]%}${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
  }
  PROMPT='%{$fg[blue]%}%~$(git_prompt_info)%{$reset_color%} '
else
  PROMPT='%c$(git_prompt_info)'
fi

# set iterm2 tab titles to current dir
precmd() {
  echo -ne "\e]1;${PWD##*/}\a"
}

# ^Z to foreground the last suspended job.
foreground-current-job() { fg; }
zle -N foreground-current-job
bindkey -M emacs '^z' foreground-current-job
bindkey -M viins '^z' foreground-current-job
bindkey -M vicmd '^z' foreground-current-job

[ -f $HOME/.local-exports ] && source $HOME/.local-exports

# fasd
fasd_cache="${HOME}/.fasd-init-cache"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init auto >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache
alias j='fasd_cd -d'

# chruby
[ -f /usr/local/opt/chruby/share/chruby/chruby.sh ] && source /usr/local/opt/chruby/share/chruby/chruby.sh
[ -f /usr/local/opt/chruby/share/chruby/auto.sh ] && source /usr/local/opt/chruby/share/chruby/auto.sh

# rustup
export PATH="$HOME/.cargo/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -f /usr/local/opt/nvm/nvm.sh ] && source /usr/local/opt/nvm/nvm.sh

# git
alias cpg='git rev-parse HEAD | tr -d "\n" | pbcopy'
alias cpgp='cpg && git push'
alias git=hub

# direnv
export DIRENV_LOG_FORMAT=""
eval "$(direnv hook zsh)"

# go
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# latex
export PATH="/Library/TeX/texbin:$PATH"

# FZF
export FZF_DEFAULT_COMMAND='ag -g "" --hidden'

fcs() { # FZF copy (git) SHA
  local commits commit
  commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
  echo -n $(echo "$commit" | sed "s/ .*//")
}

# Useful aliases
function take() {
  mkdir -p $1
  cd $1
}

alias lower="tr '[:upper:]' '[:lower:]'"
alias upper="tr '[:lower:]' '[:upper:]'"
alias uuid="uuidgen | lower"
