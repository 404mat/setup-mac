# sourcung oh-my-zsh config (if you move ohmyszh config to an exterman file)
# source $HOME/.ohmyzsh-config-custom

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500
# Don't put duplicate lines in the history
export HISTCONTROL=erasedups:ignoredups
PROMPT_COMMAND='history -a'

# ----------------------
# Aliases
# ----------------------
# To temporarily bypass an alias, we preceed the command with a \
# EG: the ls command is aliased, but to use the normal ls command you would type \ls
alias l="ls -lh" # List files in current directory
alias ll="ls -al" # List all files in current directory in long list format
alias o="open ." # Open the current directory in Finder/Explorer
alias cls='clear' # Clear screen

# Change directory aliases
alias home='cd ~'
alias dev='cd $HOME/dev'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Remove a directory and all files
alias rmd='rm -rfv'

# Show open ports
alias openports='netstat -nape --inet'

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

# IP address lookup
alias whatismyip="whatsmyip"
function whatsmyip ()
{
	# Dumps a list of all IP addresses for every device
	# /sbin/ifconfig |grep -B1 "inet addr" |awk '{ if ( $1 == "inet" ) { print $2 } else if ( $2 == "Link" ) { printf "%s:" ,$1 } }' |awk -F: '{ print $1 ": " $3 }';

	# Internal IP Lookup
	echo -n "Internal IP: " ; /sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'

	# External IP Lookup
	echo -n "External IP: " ; wget http://smart-ip.net/myip -O - -q
}


# NVM config
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
