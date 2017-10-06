
# Add colour to grep and exclude .git directories
alias grep='grep --color=auto --exclude-dir=\.git'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# dotfile repo
alias cfg='/usr/bin/git --git-dir=$HOME/.rjm-cfg/ --work-tree=$HOME'
