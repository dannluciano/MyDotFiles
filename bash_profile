export PATH="/usr/local:$PATH"
export ARCHFLAGS="-arch x86_64"

export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"

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
