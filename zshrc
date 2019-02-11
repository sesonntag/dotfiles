#!/bin/zsh
#
#*******************************************************************************
# Title: zshrc
# Description: zsh configuration file
# Author: Sebastian Sonntag
# Date: 2019-02-11
# License:
#*******************************************************************************

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="hyperzsh" # bira geoffgarside josh ys

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
last-working-dir
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

#alias to extend the ln command
alias ln='ln -v'

# alias to extend the mkdir command
alias mkdir='mkdir -p'

# alias for content of folder recursively
alias content='for t in files links directories; do echo `find . -type ${t:0:1} | wc -l` $t; done 2> /dev/null'

# export editor variable
export EDITOR='vim'

# alias for neovim
alias vim='nvim'

# define the command line language
export LANG=en_US.UTF-8


###################################
# operating system  realted stuff #
###################################

# mac os specific parts
if [[ "$OSTYPE" == "darwin"* ]]; then

    # source my scripts folder
    export PATH="/Users/sebastiansonntag/System/Scripts:$PATH"

    # aliases for rsync scripts
    alias rsync_my_mac='chmod +x rsync_home_to_wd_2000.sh && ./rsync_home_to_wd_2000.sh && chmod -x rsync_home_to_wd_2000.sh'
    alias rsync_my_external_drives='chmod +x rsync_wd_2000_to_core_750.sh && ./rsync_wd_2000_to_core_750.sh && chmod -x rsync_wd_2000_to_core_750.sh'

    # aliases for keeping brew clean
    alias brewup='brew update; brew upgrade; brew cleanup; brew doctor; brew cask upgrade'

    # alias for git
    alias git='/usr/local/bin/git'

    # alias for rsync
    alias rsync='/usr/local/bin/rsync'

    # alias to use ctags from Homebrew
    alias ctags='alias ctags=`brew --prefix`/bin/ctags'

    # added by Miniconda3 installer
    export PATH="/Users/sebastiansonntag/.opt/miniconda3/bin:$PATH"

elif [[ "$OSTYPE" == "linux"* ]]; then
    # alias for system updates
    alias sudo_update='sudo wajig update && sudo wajig dist-upgrade && sudo wajig autoremove && sudo wajig autoclean && sudo wajig clean'

    # added by Miniconda3 installer
    export PATH="/home/desonnse/.opt/miniconda3/bin:$PATH"
fi
