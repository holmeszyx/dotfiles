#!/usr/bin/env bash

# install

FORCE=''

DOTFILES=( .vimrc .bashrc )

# make a backup for $1
function backup() {

	if [[ ! -d "bak/$USER" ]]; then
		mkdir -p bak/$USER/
	fi 

	if [[ -f $1 ]]; then
		echo "backup $1 ($PWD/bak/$USER)"
		cp $1 bak/$USER/
		return $?
	fi
	return 1
}

# link dot file to target
# $1: dotfile (relative to $PWD), $2: target
function lnkf() {

	if [[ ! -f $PWD/$1 ]]; then
		return 1
	fi 	

	if [[ -f $2 ]]; then
		if [[ ! $FORCE ]]; then
			# target exists!!!
			echo "$2 is exits"
			return 2
		else
			backup $2
			rt=$?
			if [[ $rt == 0 ]]; then
				# bak success. delete old file
				rm -f $2
			fi
		fi
	fi

	ln -s $PWD/$1 $2
	echo "Done. $1"
}


function install() {

	for i in ${DOTFILES[@]}; do

		if [[ -f $PWD/$i ]]; then
			echo "install $i ..."
			lnkf $i $HOME/$i
		else
			echo "$i no found"
		fi


	done

}

if [[ "$1" == "--force" ]]; then
	FORCE=true
	echo "** In FORCE MODE **"
fi

install

