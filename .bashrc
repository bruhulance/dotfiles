##
## Edited by Liam Major
##
## ~/.bashrc
##

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Setting bash configs
HISTSIZE=-1 # unlimited history size
HISTFILESIZE=-1 # unlimited history file size
shopt -s histappend

# putting directories within vars
dotfilesFolder=$HOME/.dotfiles # this is the bare git repo which tracks all of the dot files on my system
backgroundsFolder=/usr/share/backgrounds/ # this directory contains all of the background images

#####################
# Aliasing Commands #
#####################

# basic root aliases
alias ls='ls --color=auto --time-style=long-iso --group-directories-first'
alias l='ls -CFlh'
alias ll='ls -lhG'
alias la='ll -aA'
alias l.='ll -d .*'

# short-hands
alias w='nitrogen --set-zoom-fill --random ${backgroundsFolder}'
alias c='clear'
alias dfs='git --git-dir=${dotfilesFolder} --work-tree=$HOME' # this is an alias to manage the dotfiles repo
alias fs='source $HOME/.xinitrc'
alias src='source $HOME/.bashrc'
alias home='cd $HOME'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias edit='$EDITOR'
alias browser='$BROWSER'

# functions which can't be aliases
h() {
	wc -l $HOME/.bash_history | awk '{print $1}' | xargs echo 'history size:'
}

###################
# Loading Scripts #
###################

# Executing colorscript upon shell run
if hash colorscript 2>/dev/null
then
	# removing the first line of colorscript since it outputs the name of the script
	colorscript random | tail -n+2
fi

# Using my own prompt loader to load prompts
loadPrompt="$HOME/.prompts/bootstrap"
if [[ -f ${loadPrompt} ]]; then
	# Loading the inputted prompt
	PS1=$(${loadPrompt} lambda)
else
	# Default copy
	PS1='[\u@\h \W]\$ '
fi

# Alacritty Auto-complete script
source ~/.bash_completion/alacritty
