#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias bashrc='helix ~/.bashrc'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias get='sudo pacman -S'
alias update='sudo pacman -Syu'
alias yeet='sudo pacman -Rcns'
alias neofetch='hyfetch'
alias hx='helix'
alias nf='hyfetch'
alias c='clear'
alias yay='paru'
PS1='[\u@\h \W]\$ '
