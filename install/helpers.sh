#!/bin/sh

print_start() {
	echo "############################"
	echo "$1"
	echo "----------------------------"
}

print_end() {
	echo "----------------------------"
	echo "$1"
	echo "############################"
}

ask_to_install() {
	cmd=$1
	msg=$2

	while true; do
		read -p "$msg (y/n)? " do_it
		case $do_it in
			[Yy]* ) $1; break;;
			[Nn]* ) break;;
			* ) echo "Please answer yes or no.";;
		esac
	done
}

skip_missing() {
	cmd=$1
	if type $cmd > /dev/null; then
		return 1
	fi
	return 0
}
