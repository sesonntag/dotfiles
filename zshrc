#!/bin/zsh
#
#*******************************************************************************
# Title: .zshrc
# Description: zsh configuration file
# Author: Sebastian Sonntag
# Date: 2018-08-05
# License:
#*******************************************************************************

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="bira" # bira geoffgarside josh ys

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
cp
dirhistory
extract
git
history
osx
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

# alias for content of folder recursively
alias content='for t in files links directories; do echo `find . -type ${t:0:1} | wc -l` $t; done 2> /dev/null'

# export editor variable
export EDITOR='vim'


###################################
# operating system  realted stuff #
###################################

# mac os specific parts
if [[ "$OSTYPE" == "darwin"* ]]; then

    # aliases for rsync scripts
    alias rsync_home_to_wd_2000='chmod +x ~/System/Multiplattform/Skripte/rsync_home_to_wd_2000.sh && . ~/System/Multiplattform/Skripte/rsync_home_to_wd_2000.sh && chmod -x ~/System/Multiplattform/Skripte/rsync_home_to_wd_2000.sh'
    alias rsync_wd_2000_to_core_750='chmod +x ~/System/Multiplattform/Skripte/rsync_wd_2000_to_core_750.sh && . ~/System/Multiplattform/Skripte/rsync_wd_2000_to_core_750.sh && chmod -x ~/System/Multiplattform/Skripte/rsync_wd_2000_to_core_750.sh'

    # alias for neovim
    alias vim='mvim -v'

    # aliases for keeping brew clean
    alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor; brew cask upgrade; brew cask cleanup;'

    # alias to use ctags from Homebrew
    alias ctags='alias ctags=`brew --prefix`/bin/ctags'

    # added by Miniconda2 installer
    export PATH="/Users/sebastiansonntag/.opt/miniconda3/bin:$PATH"

elif [[ "$OSTYPE" == "linux"* ]]; then
    # alias for system updates
    alias sudo_update='sudo wajig update && sudo wajig dist-upgrade && sudo wajig autoremove && sudo wajig autoclean && sudo wajig clean'
fi
