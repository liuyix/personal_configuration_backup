#!/bin/bash

bak_and_link() {
	if [ -f "$1" ];then
		mv $1 $1.orig	
	fi
	ln -s $BASEDIR/$2 $1
}

if [ "$#" -lt 1 ];then
	echo 'you must input config directory path'
	exit 0
fi

BASEDIR=$1

bak_and_link ~/.bashrc bashrc
bak_and_link ~/.vimrc vimrc
bak_and_link ~/.vim vim.d
bak_and_link ~/.emacs emacs.conf
bak_and_link ~/.emacs.d emacs.d

