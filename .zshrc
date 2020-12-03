# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/khanj/.zshrc'

autoload -Uz compinit
compinit

#
# Config zsh themes
#
export ZSH="/home/khanj/.ohmyzsh"
ZSH_THEME="bira"
source $ZSH/oh-my-zsh.sh

# Colorful manual pages
export LESS_TERMCAP_mb=$'\e[40m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;7;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export EDITOR=/usr/bin/vim
export TERMINAL=/usr/bin/xfce4-terminal
export PATH=$PATH:/home/khanj/.scripts
