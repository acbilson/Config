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

## Alias definitions.

if [ -f ~/.zsh_aliases ]; then
    . ~/.zsh_aliases
fi

# Function definitions

if [ -f ~/.zsh_functions ]; then
    . ~/.zsh_functions
fi

# theme definitions
if [ -f ~/.theme ]; then
    . ~/.theme
fi

# End custom configurations from optional files
