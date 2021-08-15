##
## Edited by Liam Major
##
## ~/.bashrc
##

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# putting directories within vars
dotfilesFolder=$HOME/.dotfiles # this is the bare git repo which tracks all of the dot files on my system
backgroundsFolder='/usr/share/backgrounds/' # this directory contains all of the background images

#####################
# Aliasing Commands #
#####################

# basic root aliases
alias ls='ls --color=auto'
alias ll='ls -alh --color=auto'
alias la='ls -Al --color=auto'
alias l='ls -CFlh --color=auto'

# short-hands
alias w='nitrogen --set-zoom-fill --random ${backgroundsFolder}'
alias c='clear'
alias dfs='git --git-dir=${dotfilesFolder} --work-tree=$HOME' # this is an alias to manage the dotfiles repo
alias fs='source $HOME/.xinitrc'
alias src='source $HOME/.bashrc'

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
loadPrompt='$HOME/.prompts/bootstrap'
if [[ -f loadPrompt ]]; then
	# Loading the inputted prompt
	loadPrompt lambda
else
	# Default copy
	PS1='[\u@\h \W]\$ '
fi

# Alacritty Auto-complete script
source ~/.bash_completion/alacritty
