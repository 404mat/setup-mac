#! /usr/bin/env bash

# Sourcing zshrc in zprofile (create if it does not exists)
if [ ! -f $HOME/.zprofile ]; then
    echo "Zsh profile does not exist, creating .zprofile ..."
    touch $HOME/.zprofile
fi
echo "Appending Zsh profile with .zshrc sourcing on startup ..."
echo ""
echo 'if [ -f $HOME/.zshrc ]; then
    source $HOME/.zshrc
fi' >> $HOME/.zprofile

# Copying dotfiles
DOTFILES=(.zshrc .gitconfig .gitignore .hushlogin)

for dotfile in $(echo ${DOTFILES[*]});
do
    echo "Initializing $dotfile ..."
    if [ -f $HOME/$(echo $dotfile) ]; 
    then
        echo ""
        echo "$dotfile already exists ! Do you want to replace it ?"
        select yn in "Yes" "No"; do
            case $yn in
                Yes ) 
                    cp ../dotfiles/$(echo $dotfile) $HOME/$(echo $dotfile)
                    echo ""; break;;
                No )
                    echo ""; break;;
            esac
        done
    else
        cp $(echo $dotfile) ~/$(echo $dotfile)
    fi
done

echo ""
echo "All dotfiles have been initialized."