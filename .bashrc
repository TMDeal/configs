#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#COLORS
TC='\e['
RESET="${TC}0m"
BLACK="${TC}30m";
RED="${TC}31m";
GREEN="${TC}32m";
YELLOW="${TC}33m";
BLUE="${TC}34m";
PURPLE="${TC}35m";
CYAN="${TC}36m";
WHITE="${TC}37m";

command_exists(){
    if command -v "$1" > /dev/null; then
        true
    else
        false
    fi
}

md(){
    mkdir -p $1
    cd $1
}

extract(){
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

# Bash completion
if [ -f /etc/bash_completion ]; then
    ./etc/bash_completion
fi

export TERM=xterm-256color
export VISUAL=vim
export EDITOR=vim

[[ -f /usr/share/fzf/key-bindings.bash ]] && source /usr/share/fzf/key-bindings.bash
export FZF_DEFAULT_OPTS="--extended"

if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/my-workspace/python/projects
    source /usr/bin/virtualenvwrapper.sh
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
HISTCONTROL=ignoredups

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# use vi commands for navigation
# set -o vi

if [ -f $HOME/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE=1
    PS1='[\u@\h: \w]$(__git_ps1 "(%s)")\$ '
else
    PS1='[\u@\h: \w]\$ '
fi

#alias settings
if $( command_exists nvim ); then
   alias vim="nvim"
fi

alias ls="ls --color=auto --group-directories-first -h"
alias l="ls -alh"
alias tmux="tmux -2"
alias ..="cd .."
alias q="exit"
alias :q="exit"
alias c="clear"
alias links="xlinks"
alias vimn="vim -u NONE"
alias gpp="g++ -std=c++1y -Wall -Wextra -g"

alias ev="vim ~/.vimrc"
alias eb="vim ~/.bashrc"
alias sb="source ~/.bashrc"
alias et="vim ~/.tmux.conf"
alias etm="vim ~/.config/termite/config"
alias ei3="vim ~/.config/i3/config"
alias ei3b="vim ~/.config/i3/i3blocks.conf"
alias ei3s="vim ~/.config/i3/i3status.conf"
alias ehttp="vim /etc/httpd/conf/httpd.conf"

