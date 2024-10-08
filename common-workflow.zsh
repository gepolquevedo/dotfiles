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

# add SSH keys
eval $(ssh-agent -s) > /dev/null
ssh-add ~/.ssh/id_ed25519 > /dev/null 2>&1

# direnv hook
eval "$(direnv hook zsh)"

# allow pass to provide the ssh passphrase
export ASK_SSHPASS="/usr/bin/pass show pphrase"

# set GPG_TTY to allow passphrase input
export GPG_TTY=$TTY

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
# TODO: migrate this to zprofile or zlogin
# tmux source ~/.tmux.conf

# general purpose aliases
alias grbm="git fetch origin && git rebase origin/master"
alias glo="git log --oneline"
alias gcm="git checkout master"
alias v="vim"
alias vf="vim ."
alias downloads="cd ~/Downloads"
alias kcc="kubectl config current-context"
alias b="bat"

# add krew to PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# add personal "bin" folder to $PATH
export PATH=$PATH:${HOME}/bin

 #source local-machine specific settings
[ -f ~/.localrc ] && source ~/.localrc
