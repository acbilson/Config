#!/bin/sh

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

echo "Starting nvim installation."

if ! type "nvim" > /dev/null; then
	echo 'The nvim editor does not exist. Please install the executable to continue.'
	return 0
fi


if ! type "git" > /dev/null; then
	echo 'The git exe does not exist. Either add packages directly to ~/.config/nvim/pack/bundle/{start,opt} or install the executable.'
else
	while true; do
		read -p 'Add package directories opt and start (y/n)? ' add_package
		case $add_package in
			[Yy]* ) mkdir -p ~/.config/nvim/pack/bundle/{start,opt}; break;;
			[Nn]* ) break;;
			* ) echo "Please answer yes or no.";;
		esac
	done

	while true; do
		read -p 'Install runtime plugins (y/n)? ' install_runtime
		case $install_runtime in
			[Yy]* ) install_plugins start-repos.txt start; break;;
			[Nn]* ) break;;
			* ) echo "Please answer yes or no.";;
		esac
	done

	while true; do
		read -p 'Install optional plugins (y/n)? ' install_optional
		case $install_optional in
			[Yy]* ) install_plugins opt-repos.txt opt; break;;
			[Nn]* ) break;;
			* ) echo "Please answer yes or no.";;
		esac
	done
fi

echo "Ending installation."
