#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# aliasing commands
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -la'

# customizing the terminal text
# PS1='[\u@\h \W]\$ '

# Alacritty Auto-complete script
source ~/.bash_completion/alacritty

# This aliases the bare git repo to manage dotfiles
#   this is the folder of the repo based off of the home dir
dotfilesFolder="$HOME/.dotfiles"
#   this is the alias to add files
alias dotfiles='git --git-dir=${dotfilesFolder} --work-tree=$HOME'

# pacman aliases
