# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
# export PYTHONPATH=$PYTHONPATH:/Users/Andy/Library/Python/2.7/lib/python/site-packages

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced


## Customize bash prompt
function prompt {
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"
  local RESETCOLOR="\[\e[00m\]"

  export PS1="\n$RED\u$BLUE @ $GREEN[\W] $RESETCOLOR$GREENBOLD\$(git branch 2> /dev/null): $RESETCOLOR"
  export PS2=" | → $RESETCOLOR"
}

prompt

# added by Anaconda 2.3.0 installer
# export PATH="/Users/Andy/anaconda/bin:$PATH"
# export PATH=/usr/local/bin:(...)

# added to solve ValueError
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# MacPorts Installer addition on 2016-05-26_at_17:52:09: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# add alias for inkscape
alias inkscape="/Applications/Inkscape.app/Contents/Resources/bin/inkscape"

# refresh shell
alias reload='source ~/.bash_profile'

# alway run emacs in shell
alias emacs='emacs -nw'

# alias for various directories
alias home='cd /Users/Andy'

# always run octave in shell
alias octave='octave-cli'

# customize ls
alias ls='ls -GFh'
alias ll='ls -l'
alias lla='ls -l -a'
