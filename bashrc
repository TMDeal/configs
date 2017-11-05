#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

command_exists(){
    command -v "$1" > /dev/null
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
export VISUAL="nvim-qt --nofork"
export EDITOR="nvim"

if [[ -f ~/.fzf.bash ]]; then
    export FZF_DEFAULT_OPTS="--reverse --border"
    # export FZF_DEFAULT_COMMAND='ag -g ""'
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules,build,dist,vendor,.cache,bundle}/*" 2> /dev/null'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    bind -x '"\C-p": vim $(fzf --height 40%);'
    source ~/.fzf.bash
fi

if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/my-workspace/python/projects
    source /usr/bin/virtualenvwrapper.sh
fi

if $( command_exists ng ); then
    source <(ng completion --bash)
fi

if [ -f $HOME/.tnsrc ]; then 
    source $HOME/.tnsrc 
fi

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# use vi commands for navigation
# set -o vi

if [ -f $HOME/.git-prompt.sh ]; then
    source $HOME/.git-prompt.sh
    export GIT_PS1_SHOWDIRTYSTATE=1
    PS1='[\u@\h: \W]$(__git_ps1 "(%s)")\$ '
else
    PS1='[\u@\h: \w]\$ '
fi

if $( command_exists nvim ); then
   alias vim="nvim"

   if $( command_exists nvim-qt ); then
       alias gvim="nvim-qt"
   fi

fi

if $( command_exists tmuxinator ); then
    alias mux="tmuxinator"
fi

if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto --group-directories-first'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias l="ls -Alh"
alias t="tmux -2"
alias ..="cd .."
alias q="exit"
alias :q="exit"
alias c="clear"
alias links="xlinks"
alias vimn="vim -u NONE"
alias gpp="g++ -std=c++1y -Wall -Wextra -g"
alias mongo="mongo --quiet"
alias open="xdg-open"

alias ev="vim ~/configs/vim/vimrc"
alias eb="vim ~/.bashrc"
alias sb="source ~/.bashrc"
alias et="vim ~/.tmux.conf"
alias etm="vim ~/.config/termite/config"
alias ei3="vim ~/.config/i3/config"
alias ei3b="vim ~/.config/i3/i3blocks.conf"
alias ei3s="vim ~/.config/i3/i3status.conf"
alias ehttp="vim /etc/httpd/conf/httpd.conf"
