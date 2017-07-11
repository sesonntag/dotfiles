# aliases to extend the ls command
alias ls='ls -G'
alias la='ls -AG'
alias ll='ls -alhG'
alias lt='ls -althG'

# alias for content of folder recursively
alias content='for t in files links directories; do echo `find . -type ${t:0:1} | wc -l` $t; done 2> /dev/null'

# aliases for rsync scripts
alias rsync_home_to_wd_2000='chmod +x ~/System/Apple/macOS/Skripte/rsync_home_to_wd_2000.sh && . ~/System/Apple/macOS/Skripte/rsync_home_to_wd_2000.sh && chmod -x ~/System/Apple/macOS/Skripte/rsync_home_to_wd_2000.sh'
alias rsync_wd_2000_to_core_750='chmod +x ~/System/Apple/macOS/Skripte/rsync_wd_2000_to_core_750.sh && . ~/System/Apple/macOS/Skripte/rsync_wd_2000_to_core_750.sh && chmod -x ~/System/Apple/macOS/Skripte/rsync_wd_2000_to_core_750.sh'

# aliases for weather news
alias weather='curl http://wttr\.in/'
alias weather_in_siegen='curl http://wttr\.in/Siegen'
alias weather_in_stavoren='curl http://wttr\.in/Stavoren'
alias weather_in_hebsack='curl http://wttr\.in/Hebsack'

# alias for macvim
alias vim='mvim -v'

# aliases for keeping brew clean
alias brewup='brew update; brew upgrade; brew prune; brew cleanup; brew doctor'
