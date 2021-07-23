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

# aliasing commands
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -la --color=auto'
alias w='nitrogen --set-zoom-fill --random /usr/share/backgrounds'
alias dfs='git --git-dir=${dotfilesFolder} --work-tree=$HOME' # this is an alias to manage the dotfiles repo

# customizing the terminal text
# PS1='[\u@\h \W]\$ '

# Alacritty Auto-complete script
source ~/.bash_completion/alacritty
