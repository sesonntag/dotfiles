# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/sebastian/.zsh/completions:"* ]]; then export FPATH="/Users/sebastian/.zsh/completions:$FPATH"; fi
#!/bin/zsh
#
#*******************************************************************************
# Title: zshrc
# Description: zsh configuration file
# Author: Sebastian Sonntag
# Date: 2026-02-11
# License:MIT
#*******************************************************************************

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
#ZSH_THEME="robbyrussell"
ZSH_THEME="af-magic"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Load following plugins. Add wisely, as too many plugins slow down shell startup.
plugins=(
colored-man-pages
colorize
command-not-found
copyfile
cp
dirhistory
extract
git
history
sudo
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
alias weather_in_oberagger='curl http://wttr\.in/Eckenhagen'
alias weather_in_hebsack='curl http://wttr\.in/Hebsack'

#alias to extend the ln command
alias ln='ln -v'

# alias to extend the mkdir command
alias mkdir='mkdir -p'

# alias for content of folder recursively
alias content='for t in files links directories; do echo `find . -type ${t:0:1} | wc -l` $t; done 2> /dev/null'

# alias for emacs without gui
alias emacs='emacs -nw'

# alias for neovim as vim
alias vim='nvim'

# alias for micro
alias mic='micro'

# yt-dlp alias
alias yt_dlp_best='yt-dlp -S res,codec:h264,codec:aac --merge-output-format mkv --cookies-from-browser edge'

# alias for pulling of all git repos
alias pull_all_gits='~/Code/own/shell_scripts/pull_all_gits.sh --no-stash'

# alias for oh-my-zsh update
alias omzup='omz update'

# export editor variable and make vim default
export EDITOR='micro'

# define the command line language
export LANG=en_US.UTF-8


###################################
# operating system  realted stuff #
###################################

# mac os specific parts
if [[ "$OSTYPE" == "darwin"* ]]; then

    # initialize homebrew
    eval "$(/opt/homebrew/bin/brew shellenv)" >> /Users/sebastian/.zprofile

    # aliases for keeping brew clean
    alias brewup='brew update; brew upgrade; brew cleanup; brew doctor; brew upgrade --cask'

    # add path for zsh
    export PATH="/usr/local/sbin:$PATH"

    # alias to use git from Homebrew
    alias git='/usr/local/bin/git'

    # alias to use rsync from Homebrew
    alias rsync='/usr/local/bin/rsync'

    # alias to use ctags from Homebrew
    alias ctags='alias ctags=`brew --prefix`/bin/ctags'

    # conda related stuff

      # >>> conda initialize >>>
      # !! Contents within this block are managed by 'conda init' !!
      __conda_setup="$('/Users/sebastian/.opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
      if [ $? -eq 0 ]; then
          eval "$__conda_setup"
      else
          if [ -f "/Users/sebastian/.opt/miniconda3/etc/profile.d/conda.sh" ]; then
            #. "/opt/anaconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
          else
            export PATH="/Users/sebastian/.opt/miniconda3/bin:$PATH"
          fi
      fi
      unset __conda_setup
      # <<< conda initialize <<<

    . "/Users/sebastian/.deno/env"
    # Initialize zsh completions (added by deno install script)
    autoload -Uz compinit
    compinit

# linux specific parts
else

   # check linux distro used
    if [ -f /etc/os-release ]; then
        # freedesktop.org and systemd
        . /etc/os-release
        OS=$NAME
        VER=$VERSION_ID
    fi

	# export for calvados env
	export PMDTECPY='/home/desonnse/Code/calvados/chiffre/40_Code'

    # alias for using users vim setup when being root/sudo
    alias rvim='sudo -E vim'

    if [[ "$OS" == "Debian"* ]]; then
        # alias for debian system updates
        alias sudo_update='sudo apt update && sudo apt full-upgrade && sudo apt autoremove && sudo apt autoclean && sudo apt clean'

        # conda related stuff

        # >>> conda initialize >>>
        # !! Contents within this block are managed by 'conda init' !!
        __conda_setup="$('/home/desonnse/.opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
        if [ $? -eq 0 ]; then
            eval "$__conda_setup"
        else
            if [ -f "/home/desonnse/.opt/miniconda3/etc/profile.d/conda.sh" ]; then
            else
                export PATH="/home/desonnse/.opt/miniconda3/bin:$PATH"
            fi
        fi
        unset __conda_setup
        # <<< conda initialize <<<

    elif [[ "$OS" == "Ubuntu"* ]]; then
        # alias for ubuntu based system updates
        alias sudo_update='sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo apt autoclean && sudo apt clean'

    elif [[ "$OS" == "Linux Mint"* ]]; then
        # alias for debian system updates
        alias sudo_update='sudo apt update && sudo apt full-upgrade && sudo apt autoremove && sudo apt autoclean && sudo apt clean'

    elif [[ "$OS" == "Fedora"* ]]; then
        # alias for fedora based system updates
        alias sudo_update='sudo dnf update --refresh && sudo dnf autoremove && sudo dnf clean all'

    elif [[ "$OS" == "Rocky Linux"* ]]; then
        # alias for fedora based system updates
        alias sudo_update='sudo dnf update --refresh && sudo dnf autoremove && sudo dnf clean all'

    elif [[ "$OS" == "openSUSE Leap"* ]]; then
        # alias for opensuse based system updates
        alias sudo_update='sudo zypper refresh && sudo zypper update'

    else
        echo OS not determined - some aliases cannot be defined accordingly
    fi
fi
