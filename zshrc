#!/bin/zsh
#
#*******************************************************************************
# Title: zshrc
# Description: zsh configuration file
# Author: Sebastian Sonntag
# Date: 2019-07-09
# License:
#*******************************************************************************

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="af-magic" # hyperzsh bira geoffgarside josh ys

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Load following plugins. Add wisely, as too many plugins slow down shell startup.
plugins=(
adb
colored-man-pages
colorize
command-not-found
copyfile
cp
dirhistory
extract
git
history
#last-working-dir
osx
pep8
pip
python
sudo
terminalapp
tmux
web-search
)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"

# source the oh-my-zsh file for the fancy stuff
source $ZSH/oh-my-zsh.sh


##############################
# bash_profile general stuff #
##############################

# Generals
# aliases to extend the ls command
alias ls='ls -G'
alias la='ls -AG'
alias ll='ls -alhG'
alias lt='ls -althG'

# aliases for weather news
alias weather='curl http://wttr\.in/'
alias weather_in_siegen='curl http://wttr\.in/Siegen'
alias weather_in_stavoren='curl http://wttr\.in/Stavoren'
alias weather_in_hebsack='curl http://wttr\.in/Hebsack'

#alias to extend the ln command
alias ln='ln -v'

# alias to extend the mkdir command
alias mkdir='mkdir -p'

# alias for content of folder recursively
alias content='for t in files links directories; do echo `find . -type ${t:0:1} | wc -l` $t; done 2> /dev/null'

# export editor variable
export EDITOR='vim'

# alias for pipenv
alias prp='pipenv run python'

# define the command line language
export LANG=en_US.UTF-8


###################################
# operating system  realted stuff #
###################################

# mac os specific parts
if [[ "$OSTYPE" == "darwin"* ]]; then

    # aliases for rsync scripts
    alias backup_home_to_synology='/Users/sebastiansonntag/System/shell_scripts/backup_home_to_synology.sh'
    alias backup_synology_to_wd2000='/Users/sebastiansonntag/System/shell_scripts/backup_synology_to_wd2000.sh'

    # aliases for keeping brew clean
    alias brewup='brew update; brew upgrade; brew cleanup; brew doctor; brew cask upgrade'

    # add path for zsh
    export PATH="/usr/local/sbin:$PATH"

    # alias to use git from Homebrew
    alias git='/usr/local/bin/git'

    # alias to use rsync from Homebrew
    alias rsync='/usr/local/bin/rsync'

    # alias to use ctags from Homebrew
    alias ctags='alias ctags=`brew --prefix`/bin/ctags'

# linux specific parts
else
    # check linux distro used
    if [ -f /etc/os-release ]; then
        # freedesktop.org and systemd
        . /etc/os-release
        OS=$N   AME
        VER=$VERSION_ID
    fi
    
    if [[ "$OS" == "Debian"* ]]; then
        # alias for debian system updates
        alias sudo_update='sudo apt update && sudo apt full-upgrade && sudo apt autoremove && sudo apt autoclean && sudo apt clean'

        # alias for using users vim setup when being root/sudo
        alias rvim='sudo -E vim'

        # miniconda3 path
        export PATH="/home/desonnse/.opt/miniconda3/bin:$PATH"
      
    elif [[ "$OS" == "Ubuntu"* ]]; then
        # alias for ubuntu based system updates
        alias sudo_update='sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo apt autoclean && sudo apt clean'
    
    else
        echo OS not determined - some aliases cannot be defined accordingly
    fi
fi
