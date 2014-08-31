#!/bin/bash

# Update, get python-software-properties in order to get add-apt-repository, 
# then update (for latest git version):
apt-get update
apt-get install -y python-software-properties
add-apt-repository -y ppa:git-core/ppa
apt-get update
apt-get install -y git

# Vim & Curl:
apt-get install -y vim curl

# For NFS speedup:
apt-get install -y nfs-common portmap

# Make
apt-get install -y make

# Configure Go & Vim:
# http://tip.golang.org/misc/vim/readme.txt?m=text

VAGRANT_USER="$(ls -1 /home/)"

# Configure Go workspace:
su $VAGRANT_USER -c "echo 'GOROOT=/usr/local/go' >> ~/.profile"
su $VAGRANT_USER -c "echo 'GOPATH=\$HOME/gocode' >> ~/.profile"
su $VAGRANT_USER -c "echo 'GOBIN=\$GOPATH/bin' >> ~/.profile"
su $VAGRANT_USER -c "echo 'PATH=\$PATH:\$GOBIN' >> ~/.profile"
su $VAGRANT_USER -c "mkdir -p ~/gocode"

# Vim config:
su $VAGRANT_USER -c "echo 'filetype off' > ~/.vimrc"
su $VAGRANT_USER -c "echo 'filetype plugin indent off' >> ~/.vimrc"
su $VAGRANT_USER -c "echo 'set runtimepath+=\$GOROOT/misc/vim' >> ~/.vimrc"
su $VAGRANT_USER -c "echo 'filetype plugin indent on' >> ~/.vimrc"
su $VAGRANT_USER -c "echo 'syntax on' >> ~/.vimrc"
su $VAGRANT_USER -c "echo 'filetype plugin on' >> ~/.vimrc"
su $VAGRANT_USER -c "echo 'filetype indent on' >> ~/.vimrc"
su $VAGRANT_USER -c "echo 'autocmd FileType go compiler go' >> ~/.vimrc"
su $VAGRANT_USER -c "echo 'set number' >> ~/.vimrc"

# Install Vim plugins:
su $VAGRANT_USER -c "mkdir -p ~/.vim/ftdetect"
su $VAGRANT_USER -c "mkdir -p ~/.vim/syntax"
su $VAGRANT_USER -c "mkdir -p ~/.vim/autoload/go"
su $VAGRANT_USER -c "mkdir -p ~/.vim/ftplugin"
su $VAGRANT_USER -c "mkdir -p ~/.vim/ftplugin/go"
su $VAGRANT_USER -c "mkdir -p ~/.vim/indent"
su $VAGRANT_USER -c "mkdir -p ~/.vim/compiler"
su $VAGRANT_USER -c "mkdir -p ~/.vim/plugin"
su $VAGRANT_USER -c "ln -s /usr/local/go/misc/vim/ftdetect/gofiletype.vim ~/.vim/ftdetect/"
su $VAGRANT_USER -c "ln -s /usr/local/go/misc/vim/syntax/go.vim ~/.vim/syntax"
su $VAGRANT_USER -c "ln -s /usr/local/go/misc/vim/autoload/go/complete.vim ~/.vim/autoload/go"
su $VAGRANT_USER -c "ln -s /usr/local/go/misc/vim/ftplugin/go.vim ~/.vim/ftplugin"
su $VAGRANT_USER -c "ln -s /usr/local/go/misc/vim/ftplugin/go/fmt.vim ~/.vim/ftplugin/go"
su $VAGRANT_USER -c "ln -s /usr/local/go/misc/vim/ftplugin/go/import.vim ~/.vim/ftplugin/go"
su $VAGRANT_USER -c "ln -s /usr/local/go/misc/vim/indent/go.vim ~/.vim/indent"
su $VAGRANT_USER -c "ln -s /usr/local/go/misc/vim/compiler/go.vim ~/.vim/compiler"
su $VAGRANT_USER -c "ln -s /usr/local/go/misc/vim/plugin/godoc.vim ~/.vim/plugin"

# Install my vimrc
su $VAGRANT_USER -c "git clone https://gist.github.com/4953ccde3ac74fd00bfa.git ~/vimrc"
su $VAGRANT_USER -c "cat ~/vimrc/vimrc >> .vimrc"
su $VAGRANT_USER -c "rm -rf ~/vimrc"
su $VAGRANT_USER -c "rm -rf ~/.vim/bundle"
su $VAGRANT_USER -c "mkdir -p ~/.vim/bundle"
su $VAGRANT_USER -c "git clone --recursive https://github.com/Shougo/vimproc.git ~/.vim/bundle/vimproc/"
su $VAGRANT_USER -c "cd ~/.vim/bundle/vimproc/; make"
su $VAGRANT_USER -c "git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim"
su $VAGRANT_USER -c "mkdir -p ~/.swap/"
su $VAGRANT_USER -c "mkdir -p ~/.backup/"
su $VAGRANT_USER -c "echo 'colorscheme wombat256mod' >> ~/.vimrc"

# go lint
/usr/local/go/bin/go get github.com/golang/lint/golint
