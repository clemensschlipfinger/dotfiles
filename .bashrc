#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTFILESIZE=
export HISTSIZE=

#mimic Zsh run-help ability
#run-help() { help "$READLINE_LINE" 2>/dev/null || man "$READLINE_LINE"; }
#bind -m vi-insert -x '"\eh": run-help'

#command not found helper
#need to install pkgfile and run pkgfile -u
#source /usr/share/doc/pkgfile/command-not-found.bash

# aliases
source ~/.alias

# bash completions
complete -cf doas

source /usr/share/bash-completion/completions/git
__git_complete dotconfig __git_main

#prompt 
eval "$(starship init bash)"
eval "$(zoxide init bash)"
