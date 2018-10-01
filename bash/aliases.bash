#Reload bash config
alias reload!="source ~/.bashrc"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then #GNU `ls`
	colorflag="--color"
else OS X `ls`
	colorflag="-G"
fi

alias vim="nvim"

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ls="ls -1ah ${colorflag}"
alias la="ls -AF ${colorflag}"
alias ll="ls -1Fh ${colorflag}"
alias lld="ls -1 | grep ^d"
alias rmf="rm -rf"

# Helpers
alias grep="grep --color=auto --exclude=*.pyc --exclude-dir=.mypy_cache --exclude-dir=.git"
alias t="t --task-dir ~/.t/tasks --list tasks"
alias df="df -h" # disk free, in Gigabytes, not bytes
alias du="du -h -c" # calculate disk usage for a folder

# Git
alias g="git status -sb"

# IP addresses net-tools deprecation
# alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
# alias localip="ipconfig getifaddr en1"
# alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# File size
alias fs="stat -f \"%z bytes\""

# one of @janmoesen's Protip's
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
	alias="$method"="lwp-request -m '$method'"
done
