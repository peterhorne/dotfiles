autoload -U compinit && compinit

autoload -U colors && colors
alias ls='ls -p'
setopt auto_cd
bindkey '^r' history-incremental-search-backward

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^x^e" edit-command-line

export PAGER=less
export LESS=R # clear screen after `git log`

# History file configuration
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

# History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_ignore_all_dups   # delete duplicates when adding new commands
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

# Case-insensitive tab-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# Don't consume trailing space after tab-completion when typing `|`
ZLE_REMOVE_SUFFIX_CHARS=""

export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export EDITOR='nvim'

# Fix fn-backspace
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char

# Setup prompt
setopt prompt_subst
if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
  PROMPT='%{$fg[cyan]%}$%{$reset_color%} '
  RPROMPT='%{$fg[cyan]%}%~%{$reset_color%}'
else
  PROMPT='$ '
  RPROMPT='%~'
fi

# set iterm2 tab titles to current dir
precmd() {
  echo -ne "\e]1;${PWD##*/}\a"
}

# ^Z to foreground the last suspended job.
foreground-current-job() { fg; }
zle -N foreground-current-job
bindkey "^z" foreground-current-job

[ -f $HOME/.local-exports ] && source $HOME/.local-exports

# fasd
fasd_cache="${HOME}/.fasd-init-cache"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init auto >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache
alias j='fasd_cd -d'

# git
alias cpg='git rev-parse HEAD | tr -d "\n" | pbcopy'
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
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS='--color bw'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_CTRL_R_OPTS='--reverse'
source "/usr/local/opt/fzf/shell/key-bindings.zsh"

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/bin/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/bin/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/bin/google-cloud-sdk/completion.zsh.inc'; fi

# npm is a clusterfuck
export DISABLE_OPENCOLLECTIVE=true

# asdf
[ -f /usr/local/opt/asdf/asdf.sh ] && source /usr/local/opt/asdf/asdf.sh
