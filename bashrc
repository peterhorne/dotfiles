source ~/.bash_prompt

# colours
alias ls='ls -G'
alias phpunit='phpunit --colors'

# fix tmux colours
alias tmux="TERM=screen-256color-bce tmux"

# enable hub
alias git=hub

# enable homebrew
PATH=/usr/local/bin:/usr/local/sbin:$PATH

# enable homebrew python
PATH=/usr/local/share/python:$PATH

# enable virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects
source /usr/local/share/python/virtualenvwrapper.sh

# enable rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
