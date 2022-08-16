#
# CUSTOM Zsh Settings
#

# use Vim keybindings for zsh
bindkey -v

#increase history size
export HISTSIZE=1000000

#append cmd history immediately
setopt INC_APPEND_HISTORY

# add local PATH folder
export PATH=${PATH}:${HOME}/.local/bin

# add golang  PATH folder
export PATH=${PATH}:/usr/local/go/bin

# add SSH keys
eval $(ssh-agent -s) > /dev/null
ssh-add ~/.ssh/id_ed25519 > /dev/null 2>&1

# direnv hook
eval "$(direnv hook zsh)"

# allow pass to provide the ssh passphrase
export ASK_SSHPASS="/usr/bin/pass show pphrase"

#DISABLED:  start syncthing
# pgrep syncthing > /dev/null 2>&1
# if [ $? -ne 0 ]; then
#       /usr/bin/syncthing >> /var/log/syncthing.log 2>&1 &
# fi

# add go path
export PATH=$PATH:$(go env GOPATH)/bin

# try to use Vim all the time
export EDITOR=/usr/bin/vim

# activate tmux plugins
# tmux source ~/.tmux.conf

# general purpose aliases
alias grbm="git fetch origin && git rebase origin/master"
alias glo="git log --oneline"
alias vf="vim ."
alias downloads="cd ~/Downloads"
alias kcc="kubectl config current-context"

# source completion and key-bindings for fzf
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# add krew to PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# add personal "bin" folder to $PATH
export PATH=$PATH:${HOME}/bin

 #source local-machine specific settings
[ -f ~/.localrc ] && source ~/.localrc
