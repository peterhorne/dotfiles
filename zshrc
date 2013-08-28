ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster-custom"
plugins=(git autojump osx travis)

source $ZSH/oh-my-zsh.sh
unsetopt autonamedirs
unsetopt correct_all # Disable zsh autocorrect

source $HOME/.path
source $HOME/.exports

# Base16
source $HOME/.base16-shell/base16-tomorrow.dark.sh

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Git shortcuts
alias cpg='git rev-parse HEAD | tr -d "\n" | pbcopy'
alias cpgp='cpg && git push'
alias git=hub

alias open-html="sed -n -e '/<html>/,/<\/html>/ p' > /tmp/cli-output.html; open /tmp/cli-output.html"

alias tree="tree -L 2 -C"

alias ppjson="python -mjson.tool | pygmentize -l javascript"

function stfu() {
    1=${1-staging}
    curl -X DELETE -d "environment=$1&user=capistrano" http://musicglue-hubot.herokuapp.com/hubot/deployments;
    echo "You can now deploy to $1 again";
}

function deploy-status() {
    php -r "\$envs = json_decode(file_get_contents('http://musicglue-hubot.herokuapp.com/hubot/deployments'), true); if(empty(\$envs)) { echo \"No-one is currently deploying\\n\"; } else { foreach (\$envs as \$env) { echo \"{\$env['user']} is deploying to {\$env['env']}\\n\"; } }"
}

function phpjson() {
    php -r "echo json_encode(unserialize('$1'));" | ppjson
}

function lipsum() {
    php -r "echo json_decode(file_get_contents('http://lipsum.com/feed/json?amount=1'))->feed->lipsum;" | pbcopy
}

