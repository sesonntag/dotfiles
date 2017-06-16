# Path to your oh-my-zsh installation.
export ZSH=/Users/sebastian/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="bira" # bira josh ys

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
#
# Load following plugins. Add wisely, as too many plugins slow down shell startup.
plugins=(git osx terminalapp sudo web-search extract colored-man-pages cp)



# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# ls)
alias ls='ls -G'
alias la='ls -AG'
alias ll='ls -alhG'
alias lt='ls -althG'


# alias for content of folder recursively
alias content='for t in files links directories; do echo `find . -type ${t:0:1} | wc -l` $t; done 2> /dev/null'


# Rsync scripts
alias rsync_home_to_core_750='chmod +x ~/System/Skripte/rsync_home_to_core_750.sh && . ~/System/Skripte/rsync_home_to_core_750.sh && chmod -x ~/System/Skripte/rsync_home_to_core_750.sh'


alias rsync_core_750_to_wd_2000='chmod +x ~/System/Skripte/rsync_core_750_to_wd_2000.sh && . ~/System/Skripte/rsync_core_750_to_wd_2000.sh && chmod -x ~/System/Skripte/rsync_core_750_to_wd_2000.sh'


# alias for weather news
alias wetter='curl http://wttr\.in/'
alias wetter_in_siegen='curl http://wttr\.in/Siegen'
alias wetter_in_mudersbach='curl http://wttr\.in/Mudersbach'
alias wetter_in_stavoren='curl http://wttr\.in/Stavoren'
alias wetter_in_winterbach='curl http://wttr\.in/Winterbach,+Germany'
alias wetter_in_schorndorf='curl http://wttr\.in/Schorndorf'


# alias for running macvim from terminal
alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
