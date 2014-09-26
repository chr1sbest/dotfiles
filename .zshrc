# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="gallois"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/home/chris/bin:~/Downloads/scala-2.9.3/bin:~/applications/sbt/bin:/usr/local/heroku/bin:/home/chris/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


#aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

function mkcd {
  # Make dir and CD into it
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}

function copy {
  # Copy to clipboard
  cat $1 | xclip -selection clipboard
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
alias wallpaper='python /home/chris/dotfiles/scripts/wallpaper-switcher.py'

#virtualenv
export WORKON_HOME="$HOME/.virtualenvs" 
source /usr/local/bin/virtualenvwrapper.sh 
alias iriver="workon intelriver; cdvirtualenv; cl dashboard"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### SBT ###
export PATH="~/applications/sbt/bin:$PATH"
export PATH="~/Downloads/scala-2.9.3/bin:$PATH"

### Exercism ###
export PATH="/home/chris/bin:$PATH"

### Gistit ###
export GISTIT_TOKEN="d9578c98db1f8e7d190f9ba1d0b95d53af83e7b4"
