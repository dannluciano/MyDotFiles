cp bash_completion.sh ~/.bash_completion.sh
cp bash_profile ~/.bash_profile
cp colors.sh ~/.colors.sh
cp git_completion.sh ~/.git_completion.sh
cp gitconfig ~/.gitconfig
cp rake_completion.rb ~/.rake_completion.rb
cp gemrc ~/.gemrc
cp gitignore ~/.gitignore
cp gitattributes ~/.gitattributes

chmod 755 ~/.rake_completion.rb

sudo mkdir -p /etc/bash_completion

source ~/.bash_profile