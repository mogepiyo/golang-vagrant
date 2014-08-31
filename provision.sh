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
apt-get install make

# Configure Go & Vim:
# http://tip.golang.org/misc/vim/readme.txt?m=text
# Configure Go workspace:
su vagrant -c "echo 'GOROOT=/usr/local/go' >> ~/.profile"
su vagrant -c "echo 'GOPATH=/home/vagrant/gocode' >> ~/.profile"
su vagrant -c "echo 'GOBIN=\$GOPATH/bin' >> ~/.profile"
su vagrant -c "echo 'PATH=\$PATH:\$GOBIN' >> ~/.profile"
su vagrant -c "mkdir -p /home/vagrant/gocode"
# Vim bindings for bash shell:
# su vagrant -c "echo 'set editing-mode vi' > ~/.inputrc"
# su vagrant -c "echo 'set keymap vi-command' >> ~/.inputrc"
# Vim config:
su vagrant -c "echo 'filetype off' > ~/.vimrc"
su vagrant -c "echo 'filetype plugin indent off' >> ~/.vimrc"
su vagrant -c "echo 'set runtimepath+=\$GOROOT/misc/vim' >> ~/.vimrc"
su vagrant -c "echo 'filetype plugin indent on' >> ~/.vimrc"
su vagrant -c "echo 'syntax on' >> ~/.vimrc"
# su vagrant -c "echo 'autocmd FileType go autocmd BufWritePre <buffer> Fmt' >> ~/.vimrc"
su vagrant -c "echo 'filetype plugin on' >> ~/.vimrc"
su vagrant -c "echo 'filetype indent on' >> ~/.vimrc"
su vagrant -c "echo 'autocmd FileType go compiler go' >> ~/.vimrc"
su vagrant -c "echo 'set number' >> ~/.vimrc"
# Install Vim plugins:
su vagrant -c "mkdir -p /home/vagrant/.vim/ftdetect"
su vagrant -c "mkdir -p /home/vagrant/.vim/syntax"
su vagrant -c "mkdir -p /home/vagrant/.vim/autoload/go"
su vagrant -c "mkdir -p /home/vagrant/.vim/ftplugin"
su vagrant -c "mkdir -p /home/vagrant/.vim/ftplugin/go"
su vagrant -c "mkdir -p /home/vagrant/.vim/indent"
su vagrant -c "mkdir -p /home/vagrant/.vim/compiler"
su vagrant -c "mkdir -p /home/vagrant/.vim/plugin"
su vagrant -c "ln -s /usr/local/go/misc/vim/ftdetect/gofiletype.vim /home/vagrant/.vim/ftdetect/"
su vagrant -c "ln -s /usr/local/go/misc/vim/syntax/go.vim /home/vagrant/.vim/syntax"
su vagrant -c "ln -s /usr/local/go/misc/vim/autoload/go/complete.vim /home/vagrant/.vim/autoload/go"
su vagrant -c "ln -s /usr/local/go/misc/vim/ftplugin/go.vim /home/vagrant/.vim/ftplugin"
su vagrant -c "ln -s /usr/local/go/misc/vim/ftplugin/go/fmt.vim /home/vagrant/.vim/ftplugin/go"
su vagrant -c "ln -s /usr/local/go/misc/vim/ftplugin/go/import.vim /home/vagrant/.vim/ftplugin/go"
su vagrant -c "ln -s /usr/local/go/misc/vim/indent/go.vim /home/vagrant/.vim/indent"
su vagrant -c "ln -s /usr/local/go/misc/vim/compiler/go.vim /home/vagrant/.vim/compiler"
su vagrant -c "ln -s /usr/local/go/misc/vim/plugin/godoc.vim /home/vagrant/.vim/plugin"
# Install my vimrc
su vagrant -c "git clone https://gist.github.com/4953ccde3ac74fd00bfa.git ~/vimrc"
su vagrant -c "cat ~/vimrc/vimrc >> .vimrc"
su vagrant -c "rm -rf ~/vimrc"
su vagrant -c "mkdir -p ~/.vim/bundle"
su vagrant -c "git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim"
su vagrant -c "mkdir -p ~/.swap/"
su vagrant -c "mkdir -p ~/.backup/"
# go lint
su vagrant -c "go get github.com/golang/lint/golint"
