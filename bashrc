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

pydir() {
    mkdir -p $1
    touch $1/__init__.py
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

if [ -f /etc/bash_completion ]; then
   . /etc/bash_completion
fi

export VIRTUALENV_PYTHON=/usr/bin/python3

export TERM=xterm-256color
export VISUAL="nvim"
export EDITOR="nvim"

if [[ -f ~/.fzf.bash ]]; then
    export FZF_DEFAULT_OPTS="--reverse --border"
    # export FZF_DEFAULT_COMMAND='ag -g ""'
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow \
        -g "!*.{a,lock,png,jpg,jpeg,ico,svg}" \
        -g "!{.git,.cache,node_modules,bundle,build,pkg,vendor,third_party,bin,dist,target,_build,deps}/*" 2> /dev/null'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    bind -x '"\C-p": vim $(fzf --height 40%);'
    source ~/.fzf.bash
fi

if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/my-workspace/python/projects
    source /usr/bin/virtualenvwrapper.sh
fi

# if $( command_exists ng ); then
#     source <(ng completion --bash)
# fi

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
alias ta="tmux -2 attach"
alias tt="tmuxinator"
alias ..="cd .."
alias q="exit"
alias :q="exit"
alias c="clear"
alias vimn="vim -u NONE"
alias gpp="g++ -std=c++1y -Wall -Wextra -g"
alias open="xdg-open"
alias ev="vim ~/.config/nvim/vimrc"
alias eb="vim ~/.bashrc"
alias sb="source ~/.bashrc"
alias et="vim ~/.tmux.conf"
alias etm="vim ~/.config/termite/config"
alias ei3="vim ~/.config/i3/config"
alias ei3b="vim ~/.config/i3/i3blocks.conf"
alias ei3s="vim ~/.config/i3/i3status.conf"
alias ehttp="vim /etc/httpd/conf/httpd.conf"
# alias python="python3"
# alias pip="pip3"
alias ctrlc='xclip -selection c'
alias ctrlv='xclip -selection c -o'
alias weather='curl wttr.in'

# if [ -n "$VIRTUAL_ENV" ]; then
#   . "$VIRTUAL_ENV/bin/activate"
# fi

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -d $HOME/.asdf ]; then
    . $HOME/.asdf/asdf.sh
    . $HOME/.asdf/completions/asdf.bash
fi

if [ -f $HOME/.tmuxinator.bash ]; then
    . ~/.tmuxinator.bash
fi

export PATH="/home/trent/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

