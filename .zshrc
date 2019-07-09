# Path to your oh-my-zsh installation.
export ZSH="/Users/josephbonilla/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# We only want to run gpg-agent on our local workstation. We accomplish that by trying to
# detect if this shell was spawned from ssh or not. If the SSH_CLIENT env var is set, then
# this is probably a remote login and we don't want to run gpg-agent.

eval ssh-agent
if [ ! -n "" ]; then
  gpgconf --launch gpg-agent

  if [ "0" -ne 8334 ]; then
      export SSH_AUTH_SOCK="/Users/josephbonilla/.gnupg/S.gpg-agent.ssh"
  fi

  GPG_TTY=/dev/ttys001
  export GPG_TTY
  # only necessary if using pinentry in the tty (instead of GUI)
  echo UPDATESTARTUPTTY | gpg-connect-agent > /dev/null 2>&1
fi

# Lando shortcut
alias ld='lando drush'
alias lde='lando db-export'
alias ldi='lando db-import'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias terminus=/Users/josephbonilla/apps/terminus/bin/terminus
alias t=terminus

# Install go path
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# Arduino path
export PATH=/Applications/Arduino.app/Contents/MacOS:$PATH
