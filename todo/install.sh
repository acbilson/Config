#!/bin/zsh

local CONFIG_DIR=$HOME/source/config/todo
local SYM_DIR=$HOME
local OS=macos

[[ -d $CONFIG_DIR ]] || { echo "\$CONFIG_DIR path does not exist. Exiting..." && return 0 }
[[ -d $SYM_DIR ]] || { echo "\$SYM_DIR path does not exist. Exiting..." && return 0 }
[[ -d "$CONFIG_DIR/$OS" ]] || { echo "specific OS path does not exist. Exiting..." && return 0 }

echo 'makes config dir if missing'
mkdir -p $SYM_DIR/.todo

echo 'symlinks config file'
file_src="$CONFIG_DIR/$OS/config"
file_dest="$SYM_DIR/.todo/config"

if [[ -s $file_dest ]]; then
  echo "EXISTS: $file_dest -> $(readlink $file_dest)"
else
  ln -s $file_src $file_dest
    echo "CREATED: $file_dest -> $file_src"
fi

