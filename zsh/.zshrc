# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# appends history between sessions
setopt appendhistory 

# move to folder without appending 'cd'
setopt autocd 

# extends glob expansion, which makes navigation easier
setopt extendedglob

# sends error when no match occurs
setopt nomatch

# turns off beeping on error
unsetopt beep

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/abilson/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Begin custom configurations from optional files

# env file required to define config workdir
if [[ ! -f ~/.zsh_env ]]; then
  echo "No env vars detected at ~/.zsh_env; creating template..."
  echo "#!/bin/sh
export CONFIG_PATH=~/source/config/acbilson
" > ~/.zsh_env
fi

source ~/.zsh_env

if [[ ! -d "$CONFIG_PATH" ]]; then
  echo "\$CONFIG_PATH path: $CONFIG_PATH does not exist. Ending zsh customization..." && return 0
fi

if [[ ! -f "$CONFIG_PATH/.zsh_aliases" ]]; then
  echo "Aliases are not available. Skipping..."
fi

if [[ ! -f "$CONFIG_PATH/.zsh_functions" ]]; then
  echo "Functions are not available. Skipping..."
fi

# auto loads ssh keys (if keychain is available)
if [ -x "$(command -v keychain)" ]; then
	eval `keychain --agents ssh --eval git_rsa`
fi

# sets editor to vim (if vim exists)
if [ -x "$(command -v vim)" ]; then
	export EDITOR=/usr/bin/vim
fi
