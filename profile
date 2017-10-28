#!/usr/bin/bash

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -d $HOME/.config/composer/vendor/bin ]; then
    PATH=$PATH:$HOME/.config/composer/vendor/bin
fi

if [ -d $HOME/.gem/ruby/2.4.0/bin ]; then
    PATH=$PATH:$HOME/.gem/ruby/2.4.0/bin
fi

if [ -d $HOME/.tmux/sessions ]; then
    PATH=$PATH:$HOME/.tmux/sessions
fi

export ANDROID_HOME=/opt/android-sdk
if [ -d /opt/android-sdk ]; then
    PATH=$PATH:$ANDROID_HOME/tools
    PATH=$PATH:$ANDROID_HOME/platform-tools
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

export GOPATH=$HOME/go
if [ -d $HOME/go ]; then
    PATH=$PATH:$GOPATH/bin
fi

if [ -d $HOME/.local/bin ]; then
    PATH=$PATH:$HOME/.local/bin
fi

export PATH
export SWT_GTK3=0
