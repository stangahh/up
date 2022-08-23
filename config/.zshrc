# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

. `brew --prefix`/etc/profile.d/z.sh

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

DISABLE_MAGIC_FUNCTIONS=true

plugins=(
    git
    docker
    docker-compose
    node
    npm
    zsh-syntax-highlighting
    zsh-completions
    ssh-agent
    gpg-agent
    z
    dotenv
    brew
    fzf
    asdf
)

# Reloading completion #
# see: https://gist.github.com/ctechols/ca1035271ad134841284#gistcomment-2308206
###################

autoload -Uz compinit

for dump in ~/.zcompdump(N.mh+24); do
    compinit
done

compinit -C


# Load Oh My Zsh #
###################
source $ZSH/oh-my-zsh.sh

# NVM #
# See: https://gist.github.com/fl0w/07ce79bd44788f647deab307c94d6922
###################
lazynvm() {
    unset -f nvm node npm npx
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
    if [ -f "$NVM_DIR/bash_completion" ]; then
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
    fi
}

nvm() {
    lazynvm
    nvm $@
}

node() {
    lazynvm
    node $@
}

npm() {
    lazynvm
    npm $@
}

npx() {
    lazynvm
    npx $@
}

# AWS #
##################
complete -C $(which aws_completer) aws # tab compleition


#
# AWS USER SWITCH
# Autocompletion is defined in ~/.oh-my-zsh/completions/_aws-user
#
function aws-users() {
    grep '\[' ~/.aws/credentials | grep -v '#' | tr -d '[' | tr -d ']'
};

function aws-user () {
    if [ -z $1 ];
    then
        echo "specify AWS user";
        return;
    fi

    exists="$(aws configure get aws_access_key_id --profile $1)"
    if [[ -n $exists ]]; then
        export AWS_DEFAULT_PROFILE=$1;
        export AWS_PROFILE=$1;
        export AWS_REGION=$(aws configure get region --profile $1);
        echo "Switched to AWS Profile: $1";
        aws configure list
    fi
}

#
# Exports
#
##################
export GPG_TTY=$(tty)

#
# Aliases
#
##################
alias reload="source ~/.zshrc"
alias aliases="cat ~/.zshrc | grep 'alias '"
alias ll="ls -alF"
alias me="aws sts get-caller-identity"
alias identity='aws sts get-caller-identity'
alias gitstatusall="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git status -s && echo)' \;"
alias dps="docker-pretty-ps -i=ips"

#
# Kubernetes
#
##################
source <(kubectl completion zsh) # tab compleition

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
