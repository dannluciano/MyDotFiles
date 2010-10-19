export PATH="/usr/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
export PATH="/usr/local:$PATH"
export ARCHFLAGS="-arch i386 -arch x86_64"

export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"

export BLUE="\[\033[0;34m\]"
export NO_COLOR="\[\e[0m\]"
export GRAY="\[\033[1;30m\]"
export GREEN="\[\033[0;32m\]"
export LIGHT_GRAY="\[\033[0;37m\]"
export LIGHT_GREEN="\[\033[1;32m\]"
export LIGHT_RED="\[\033[1;31m\]"
export RED="\[\033[0;31m\]"
export WHITE="\[\033[1;37m\]"
export YELLOW="\[\033[0;33m\]"

source ~/.git_completion.sh
source ~/.bash_completion.sh

alias ls="ls -G"
alias colors="sh ~/.colors.sh"

alias showip="ifconfig | grep broadcast | sed 's/.*inet \(.*\) netmask.*/\1/'"
alias myip="curl http://www.whatismyip.com/automation/n09230945.asp"
alias top="top -o cpu"

# complete rake tasks
complete -C ~/.rake_completion.rb -o default rake

# rvm
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# [usuario@host] ruby version path pwd if .git brach
PS1='\n[\u@\h] \[\033[1;31m\]`~/.rvm/bin/rvm-prompt i v` \[\033[1;30m\]\w\a\[\033[0m\]$(__git_ps1 " \[\033[1;37m\](%s)\[\033[0m\]")\n\$ '
# PS1='\n[\u@\h] \[\033[1;30m\]\w\a\[\033[0m\]$(__git_ps1 " \[\033[1;31m\](%s)\[\033[0m\]")\n\$ '
