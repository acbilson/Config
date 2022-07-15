#!/bin/sh
. ./helpers.sh

make_folders() {
	mkdir -p ~/.config/nvim/pack/bundle/{start,opt}
}

install_plugins()
{
	start=$(pwd)
	repo_src="$HOME/.config/nvim/$1"
	repo_dst="$HOME/.config/nvim/pack/bundle/$2"

	cd "$repo_dst"

	for repo in $(cat "$repo_src"); do
		while true; do
			read -p "Add $repo to runtime folder (y/n)? " add_runtime
			case $add_runtime in
				[Yy]* ) git clone "$repo"; break;;
				[Nn]* ) break;;
				* ) echo "Please answer yes or no.";;
			esac
		done
	done

	cd $start
}

install_start_repos() {
	install_plugins start-repos.txt start
}

install_start_repos() {
	install_plugins opt-repos.txt opt
}

print_start "Starting nvim installation."

if skip_missing nvim; then
	echo 'The nvim editor does not exist. Please install the executable to continue.'
else
	ask_to_install make_folders 'Add package directories opt and start'

	if skip_missing git; then
		echo 'The git exe does not exist. Either add packages directly to ~/.config/nvim/pack/bundle/{start,opt} or install the executable.'
	else
		ask_to_install install_start_repos 'Install runtime plugins'
		ask_to_install install_opt_repos 'Install optional plugins'
	fi
fi

print_end "Ending installation."
