# zmodload zsh/zprof # uncomment this and last file command to profile startup time

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500
# Don't put duplicate lines in the history
export HISTCONTROL=erasedups:ignoredups

# MacOS Java config for android development
# Ensure you have the correct Java version installed
# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk.jdk/Contents/Home
# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# ----------------------
# Aliases
# ----------------------
# To temporarily bypass an alias, we preceed the command with a \
# EG: the ls command is aliased, but to use the normal ls command you would type \ls

# directory inspection
alias l="ls -lh" # List files in current directory
alias ll="ls -al" # List all files in current directory in long list format
alias o="open ." # Open the current directory in Finder
alias cls='clear'

# Change directory
alias home='cd ~'
alias dev='cd $HOME/dev'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
# Programs
alias c="code"
# Utilities
alias brew-up='brew update --verbose; brew upgrade; brew cleanup -s --verbose; brew doctor --verbose; trash `brew --cache`;'
# ----------------------
# Git Aliases and functions
# ----------------------
alias gaa='git add .'
alias gcm='git commit -m'
alias gpsh='git push'
alias gpl='git pull'
alias gs='git status --short'
# requires the 'gitui' program to be installed
alias gui='gitui'
# Delete all branches that do not have a remote
function gdelete() {
	local branches=$(git branch --vv | grep ": gone" | awk '{print $1}')
	if [ -n "$branches" ]; then
		echo "Deleting branches: $branches"
		read -p "Are you sure you want to delete these branches? (y/n): " confirm
		if [[ $confirm == [yY] ]]; then
			echo "$branches" | xargs git branch -D
			echo "Branches deleted"
		else
			echo "Operation cancelled"
		fi
	else
		echo "No branches to delete"
	fi
}

# ----------------------
# Functions
# ----------------------
# Create directory and navigate to it
function mkcd()
{
	mkdir -p $1 && cd $1
}
# Remove a directory and all files
function rmd()
{
	local path=$1
	if [ -z "$path" ]; then
		echo "Usage: rmd <directory>"
		return 1
	fi

	printf "Are you sure you want to delete all of '$path' ? (y/n): "
	read confirm
	if [[ $confirm == [yY] ]]; then
		/bin/rm -rfv "$path"
		echo "'$path' has been deleted"
	else
		echo "Operation cancelled"
	fi
}

## Add PNPM here

## Add BUN here

## Install starship before sourcing config
eval "$(starship init zsh)"

# zprof # uncomment to profile startup time