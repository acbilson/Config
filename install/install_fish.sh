#!/bin/sh

install_fisher_manager() {
	curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
}

echo "Starting fish shell installation."

if ! type "fish" > /dev/null; then
	echo 'The fish exe does not exist. Please install the executable to continue.'
	return 0
fi

while true; do
	read -p 'Install the fisher plugin manager (y/n)? ' install_fisher
	case $install_fisher in
		[Yy]* ) install_fisher_manager; break;;
		[Nn]* ) break;;
		* ) echo "Please answer yes or no.";;
	esac
done

while true; do
	read -p 'Install autopair plugin with fisher (y/n)? ' install_autopair
	case $install_autopair in
		[Yy]* ) fisher install jorgebucaran/autopair.fish; break;;
		[Nn]* ) break;;
		* ) echo "Please answer yes or no.";;
	esac
done


while true; do
	read -p 'Install path expansion plugin with fisher (y/n)? ' install_pufferfish
	case $install_pufferfish in
		[Yy]* ) fisher install nickeb96/puffer-fish; break;;
		[Nn]* ) break;;
		* ) echo "Please answer yes or no.";;
	esac
done

if ! type "stow" > /dev/null; then
	echo 'The stow exe does not exist. Either add config files to ~/.config/fish or install the executable.'
else
	while true; do
		read -p 'Install fish dotfiles with stow (y/n)? ' add_dotfiles
		case $add_dotfiles in
			[Yy]* ) stow fish; break;;
			[Nn]* ) break;;
			* ) echo "Please answer yes or no.";;
		esac
	done
fi

echo "Ending installation."
return 0
