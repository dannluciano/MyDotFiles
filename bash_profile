# Exports
export ARCHFLAGS="-arch x86_64"
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"
export EDITOR="emacs"

# Colors Exports
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

# Node PATH
export NODE_PATH="/usr/local/lib/node_modules"

# Android PATH
export ANDROID_HOME="~/.android-sdk"
export PATH="$PATH:$ANDROID_HOME/tools"

# Misc Alias
alias ls="ls -G"
alias showip="ifconfig | grep broadcast | sed 's/.*inet \(.*\) netmask.*/\1/'"
alias myip="curl http://www.whatismyip.com/automation/n09230945.asp"
alias top="top -o cpu"
alias emacs="/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/bin/emacsclient"
alias cleanlog="sudo rm -rf /private/var/log/asl/*"
alias nginx="/opt/nginx/sbin/nginx"
alias screensave="nice -n +20 /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background"
alias lock="open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"
alias make="make -j2"

# Bundle ALias
alias b="bundle"
alias bi="b install --path vendor"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

# [usuario@host] ruby version path pwd if .git brach
PS1='\n[\u@\h] \[\033[1;31m\]`~/.rvm/bin/rvm-prompt i v` \[\033[1;30m\]\w\a\[\033[0m\]$(__git_ps1 " \[\033[1;37m\](%s)\[\033[0m\]")\n\$ '

export TODO=~/Dropbox/todo

function todo() { if [ $# == "0" ]; then cat $TODO; else echo "• $@" >> $TODO; fi }
function todone() { sed -i -e "/$*/d" $TODO; }

# Bash Completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
fi

# Complete Rake Tasks
complete -C ~/.rake_completion.rb -o default rake

# Complete Git Commands
source ~/.git_completion.sh