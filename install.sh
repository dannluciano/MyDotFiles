#!/bin/bash
cp bash_completion.sh ~/.bash_completion.sh
cp bash_profile ~/.bash_profile
cp colors.sh ~/.colors.sh
cp gem_completion.sh ~/.gem_completion.sh
cp gemrc ~/.gemrc
cp git_completion.sh ~/.git_completion.sh
cp gitattributes ~/.gitattributes
cp gitconfig ~/.gitconfig
cp gitignore ~/.gitignore

cp irbrc ~/.irbrc
cp rake_completion.rb ~/.rake_completion.rb

chmod 755 ~/.rake_completion.rb

sudo mkdir -p /etc/bash_completion

source ~/.bash_profile