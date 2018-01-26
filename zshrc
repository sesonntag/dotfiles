# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="bira" # bira geoffgarside josh ys

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Load following plugins. Add wisely, as too many plugins slow down shell startup.
plugins=(adb git osx terminalapp sudo web-search extract colored-man-pages cp tmux history dirhistory)

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"

# source the oh-my-zsh file for the fancy stuff
source $ZSH/oh-my-zsh.sh


######################
# bash_profile stuff #
######################

# Generals
# aliases to extend the ls command
alias ls='ls -G'
alias la='ls -AG'
alias ll='ls -alhG'
alias lt='ls -althG'

# alias for content of folder recursively
alias content='for t in files links directories; do echo `find . -type ${t:0:1} | wc -l` $t; done 2> /dev/null'

# aliases for weather news
alias weather='curl http://wttr\.in/'
alias weather_in_siegen='curl http://wttr\.in/Siegen'
alias weather_in_stavoren='curl http://wttr\.in/Stavoren'
alias weather_in_hebsack='curl http://wttr\.in/Hebsack'

# os specific parts
# mac os specific parts
if [[ "$OSTYPE" == "darwin"* ]]; then

    # aliases for rsync scripts
    alias rsync_home_to_wd_2000='chmod +x ~/System/Apple/macOS/Skripte/rsync_home_to_wd_2000.sh && . ~/System/Apple/macOS/Skripte/rsync_home_to_wd_2000.sh && chmod -x ~/System/Apple/macOS/Skripte/rsync_home_to_wd_2000.sh'
    alias rsync_wd_2000_to_core_750='chmod +x ~/System/Apple/macOS/Skripte/rsync_wd_2000_to_core_750.sh && . ~/System/Apple/macOS/Skripte/rsync_wd_2000_to_core_750.sh && chmod -x ~/System/Apple/macOS/Skripte/rsync_wd_2000_to_core_750.sh'

    # alias for macvim
    alias vim='mvim -v'

    # export editor variable
    export EDITOR='vim'

    # aliases for keeping brew clean
    alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'

    # alias to use ctags from Homebrew
    alias ctags='alias ctags=`brew --prefix`/bin/ctags'
fi
