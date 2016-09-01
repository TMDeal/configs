#!/usr/bin/bash

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -d $HOME/.composer/vendor/bin ]; then
    PATH=$PATH:$HOME/.composer/vendor/bin
fi

if [ -d $HOME/.gem/ruby/2.3.0/bin ]; then
    PATH=$PATH:$HOME/.gem/ruby/2.3.0/bin
fi

if [ -d $HOME/.tmux/sessions ]; then
    PATH=$PATH:$HOME/.tmux/sessions
fi

if [ -d $HOME/.go ]; then
    export GOPATH=$HOME/.go
    PATH=$PATH:$GOPATH/bin
fi

export PATH
export SWT_GTK3=0
