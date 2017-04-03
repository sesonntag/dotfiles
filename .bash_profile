# ls
alias ls='ls -G'
alias la='ls -AG'
alias ll='ls -alhG'
alias lt='ls -althG'


# alias for content of folder recursively
alias inhalt='for t in files links directories; do echo `find . -type ${t:0:1} | wc -l` $t; done 2> /dev/null'


# Rsync scripts
alias rsync_home_to_core_750='chmod +x ~/Library/Mobile\ Documents/com~apple~CloudDocs/System/Skripte/rsync_home_to_core_750.sh && . ~/Library/Mobile\ Documents/com~apple~CloudDocs/System/Skripte/rsync_home_to_core_750.sh && chmod -x ~/Library/Mobile\ Documents/com~apple~CloudDocs/System/Skripte/rsync_home_to_core_750.sh'
#alias rsync_home_to_core_750='chmod +x ~/System/Skripte/rsync_home_to_core_750.sh && . ~/System/Skripte/rsync_home_to_core_750.sh && chmod -x ~/System/Skripte/rsync_home_to_core_750.sh'
alias rsync_core_750_to_wd_2000='chmod +x ~/Library/Mobile\ Documents/com~apple~CloudDocs/System/Skripte/rsync_core_750_to_wd_2000.sh && . ~/Library/Mobile\ Documents/com~apple~CloudDocs/System/Skripte/rsync_core_750_to_wd_2000.sh && chmod -x ~/Library/Mobile\ Documents/com~apple~CloudDocs/System/Skripte/rsync_core_750_to_wd_2000.sh'
#alias rsync_core_750_to_wd_2000='chmod +x ~/System/Skripte/rsync_core_750_to_wd_2000.sh && . ~/System/Skripte/rsync_core_750_to_wd_2000.sh && chmod -x ~/System/Skripte/rsync_core_750_to_wd_2000.sh'


# alias for weather news
alias wetter='curl http://wttr\.in/'
alias wetter_in_siegen='curl http://wttr\.in/Siegen'
alias wetter_in_mudersbach='curl http://wttr\.in/Mudersbach'
alias wetter_in_stavoren='curl http://wttr\.in/Stavoren'
alias wetter_in_winterbach='curl http://wttr\.in/Winterbach,+Germany'
alias wetter_in_schorndorf='curl http://wttr\.in/Schorndorf'


# alias for running macvim from terminal
#alias mvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
#alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'


# path to icloud drive
alias cd_iCloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'


# added by Anaconda3 4.3.1 installer
export PATH="/anaconda/bin:$PATH"
