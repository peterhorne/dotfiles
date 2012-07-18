source ~/.bash_solarized
source ~/.bash_prompt

# colours
alias ls='ls -G'
alias phpunit='phpunit --colors'

# fix tmux colours
alias tmux="TERM=screen-256color-bce tmux"

# enable hub
alias git=hub

# enable homebrew
PATH=/usr/local/bin:$PATH

# enable rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
