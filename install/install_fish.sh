#!/bin/sh
. ./helpers.sh

install_fisher_manager() {
	curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
}

install_autopair() {
	fisher install jorgebucaran/autopair.fish
}

install_expansion() {
	fisher install nickeb96/puffer-fish
}

install_dotfiles() {
	stow fish
}

print_start "Starting fish shell installation."

if skip_missing fish; then
	echo 'The fish exe does not exist. Please install with your favorite package manager to continue.'
	return 1
else
	ask_to_install install_fisher_manager 'Install the fisher plugin manager'
	ask_to_install install_autopair 'Install the autopair plugin with fisher'
	ask_to_install install_expansion 'Install a path expansion plugin with fisher'
fi

if skip_missing stow; then
	echo 'The stow exe does not exist. Either add config files to ~/.config/fish or install the executable.'
else
	ask_to_install install_dotfiles 'Install fish dotfiles with stow'
fi

print_end "Ending installation"
return 0
