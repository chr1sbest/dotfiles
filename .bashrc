# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# zsh
alias vim="stty stop '' -ixoff ; vim"
# `Frozing' tty, so after any command terminal settings will be restored

# bash
# No ttyctl, so we need to save and then restore terminal settings 
vim()
{
    local STTYOPTS="$(stty --save)"
    stty stop '' -ixoff
    command vim "$@"
    stty "$STTYOPTS"
}

function mkcd {  #make dir and cd into it
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

function cl()
{
     builtin cd "$*" && ls -a
 }

#intelRiver SSH Settings
export EC2_KEYPAIR=intelriver
export EC2_URL=https://ec2.us-west-2.amazonaws.com
export EC2_PRIVATE_KEY=~/intelriver.pem
export JAVA_HOME=/usr/lib/jvm/java-6-openjdk/

#Custom aliases
alias 61b="cd ~/workspace/61b"
alias 61a="cd ~/workspace/61a"
alias del="rm -rf"
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias doctest='python -m doctest'
alias ~='cd ~'
alias mouse='unclutter -idle 0.5 -root'
alias c='clear'
alias majestic='vlc "http://www.youtube.com/watch?v=zrzJyV_dNNU&list=UUXIyz409s7bNWVcM-vjfdVA" -Z -f --no-video-title-show'
alias android='VBoxManage startvm a04d479f-40d9-4845-9a24-e92f331a5626'
alias dim='xbacklight -set'
alias melatonin='dim 10 & redshift&'
alias switch='git checkout'
alias keyoff='xinput set-int-prop 13 "Device Enabled" 8 0'
alias keyon='xinput set-int-prop 13 "Device Enabled" 8 0'
alias variety='~/../../opt/extras.ubuntu.com/variety/bin/variety'
alias wallpaper='variety -n'

#task manager aliases
alias tasks='python ~/workspace/taskmaster/tasks.py'
alias add='tasks add'
alias fin='tasks fin'
alias undo='tasks undo'
alias name='tasks name'
alias move='tasks move'

alias incomplete='python ~/workspace/taskmaster/incomplete.py'

#virtualenv
export WORKON_HOME="$HOME/.virtualenvs" 
source /usr/local/bin/virtualenvwrapper.sh 
alias iriver="workon intelriver; cdvirtualenv; cl dashboard"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#greeting
#python ~/workspace/taskmaster/greeting.py
#tasks

### SBT ###
export PATH="~/applications/sbt/bin:$PATH"
export PATH="~/Downloads/scala-2.9.3/bin:$PATH"

#wallpapers
alias wallpaper='python /home/chris/dotfiles/scripts/wallpaper-switcher.py'

#gistit
export GISTIT_TOKEN="d9578c98db1f8e7d190f9ba1d0b95d53af83e7b4"
