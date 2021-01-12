#!/bin/zsh

local CONFIG_DIR=$HOME/source/config/zsh
local SYM_DIR=$HOME
local OS=macos

[[ -d $CONFIG_DIR ]] || { echo "\$CONFIG_DIR path does not exist. Exiting..." && return 0 }
[[ -d $SYM_DIR ]] || { echo "\$SYM_DIR path does not exist. Exiting..." && return 0 }
[[ -d "$CONFIG_DIR/$OS" ]] || { echo "specific OS path does not exist. Exiting..." && return 0 }

local INDICES=(1 2 3 4 5)
local FILES=(zshrc common/module $OS/theme $OS/module $OS/settings)
local SYMS=(.zshrc .zsh_common .zsh_theme .zsh_module .zsh_settings)

for i in $INDICES; do
  file_src="$CONFIG_DIR/$FILES[$i]"
  file_dest="$SYM_DIR/$SYMS[$i]"

  if [[ -s $file_dest ]]; then
    echo "EXISTS: $file_dest -> $(readlink $file_dest)"
  else
    ln -s $file_src $file_dest
    echo "CREATED: $file_dest -> $file_src"
  fi

done
