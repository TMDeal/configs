#!/bin/bash

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -d $HOME/.tmux/sessions ]; then
    PATH=$PATH:$HOME/.tmux/sessions
fi

export ANDROID_HOME=/opt/android-sdk
if [ -d /opt/android-sdk ]; then
    PATH=$PATH:$ANDROID_HOME/tools
    PATH=$PATH:$ANDROID_HOME/platform-tools
fi

if [ -d $HOME/.cargo/bin ]; then
    PATH=$PATH:$HOME/.cargo/bin
fi

export NPM_PREFIX=$HOME/.npm-packages
if [ -x /usr/bin/npm ]; then
    if [ ! -d $NPM_PREFIX ]; then
        mkdir $NPM_PREFIX
    fi
    if [ ! -f $HOME/.npmrc ]; then
        npm config set prefix $NPM_PREFIX
    fi
    PATH=$PATH:$NPM_PREFIX/bin
fi

export GOROOT=/usr/local/go
export GOPATH=$HOME/my-workspace/go
if [ -d $GOPATH/bin ]; then
    PATH=$PATH:$GOPATH/bin
fi
if [ -d $GOROOT/bin ]; then
    PATH=$PATH:$GOROOT/bin
fi

if [ -d $HOME/.local/bin ]; then
    PATH=$PATH:$HOME/.local/bin
fi

if [ -d $HOME/.scripts ]; then
    PATH=$PATH:$HOME/.scripts
fi

export PATH
export SWT_GTK3=0

export PATH="$HOME/.cargo/bin:$PATH"
