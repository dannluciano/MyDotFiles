export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
export ARCHFLAGS="-arch i386 -arch x86_64"

export EDITOR="/usr/bin/mate -wl1"
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"

# Colours
BLUE="\[\033[0;34m\]"
NO_COLOR="\[\e[0m\]"
GRAY="\[\033[1;30m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GRAY="\[\033[0;37m\]"
LIGHT_GREEN="\[\033[1;32m\]"
LIGHT_RED="\[\033[1;31m\]"
RED="\[\033[0;31m\]"
WHITE="\[\033[1;37m\]"
YELLOW="\[\033[0;33m\]"

source ~/.git_completion.sh
source ~/.bash_completion.sh

alias ls="ls -G"
alias colors="sh ~/.colors.sh"

alias showip="ifconfig | grep broadcast | sed 's/.*inet \(.*\) netmask.*/\1/'"
alias myip="curl http://www.whatismyip.com/automation/n09230945.asp"
alias top="top -o cpu"

# complete rake tasks
complete -C ~/.rake_completion.rb -o default rake

PS1='\n[\u] \[\033[1;30m\]\w\a\[\033[0m\]$(__git_ps1 " \[\033[0;31m\](%s)\[\033[0m\]")\n\$ '