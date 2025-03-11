# zmodload zsh/zprof # uncomment this and last file command to profile startup time

# sourcung oh-my-zsh config (if you move ohmyszh config to an exterman file)
# source $HOME/.ohmyzsh-config-custom

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500
# Don't put duplicate lines in the history
export HISTCONTROL=erasedups:ignoredups

# ----------------------
# Aliases
# ----------------------
# To temporarily bypass an alias, we preceed the command with a \
# EG: the ls command is aliased, but to use the normal ls command you would type \ls
alias l="ls -lh" # List files in current directory
alias ll="ls -al" # List all files in current directory in long list format
alias o="open ." # Open the current directory in Finder
alias cls='clear' # Clear screen

# Change directory aliases
alias home='cd ~'
alias dev='cd $HOME/dev'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Programs
alias c="open $1 -a \"Visual Studio Code\""

# Remove a directory and all files
alias rmd='rm -rfv'

# ----------------------
# Git Aliases
# ----------------------
alias gaa='git add .'
alias gcm='git commit -m'
alias gpsh='git push'
alias gpl='git pull'
alias gss='git status -s'
alias gs='echo ""; echo "*******"; echo -e "   PULL BEFORE COMMITTING"; echo "*******"; echo ""; git status'
# requires the 'gitui' utility to be installed
alias gui='gitui'

# ----------------------
# Functions
# ----------------------
# Create directory and navigate to it
function mkcd()
{
	mkdir -p $1 && cd $1
}

# Returns the last 2 fields of the working directory
pwdtail ()
{
	pwd|awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fnm : Fast Node Manager (activate this after installing FNM)
# eval "$(fnm env --use-on-cd --shell zsh)"

# zprof # uncomment to profile startup time