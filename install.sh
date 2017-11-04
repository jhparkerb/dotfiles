#!/bin/sh

set -e

install() {
	[ -n "$1" ] || return
	SRC=$(basename "$1")
 	shift

	[ -f "$SRC" ] || return
	DEST=$HOME/.$SRC

	[ -f "$DEST" ] && cp -f "$DEST" "$DEST.old"

	ln -sf "$HOME/.dotfiles/$SRC" "$HOME/.$SRC"
}

install emacs
install gitconfig
install nethackrc
install profile
install tmux.conf
install vimrc
