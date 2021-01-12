#!/bin/zsh

local ORIG=$(pwd)

local CONFIG_DIR=$HOME/source/config/vim
local SYM_DIR=$HOME
local OS=macos

[[ -d $CONFIG_DIR ]] || { echo "\$CONFIG_DIR path does not exist. Exiting..." && return 0 }
[[ -d $SYM_DIR ]] || { echo "\$SYM_DIR path does not exist. Exiting..." && return 0 }
[[ -d "$CONFIG_DIR/$OS" ]] || { echo "specific OS path does not exist. Exiting..." && return 0 }

echo 'makes vimfiles view folder if missing'
mkdir -p $SYM_DIR/.vim/vimfiles/view

echo 'makes bundle folder if missing'
mkdir -p $SYM_DIR/.vim/pack/bundle/{start,opt}

echo 'copies cheat sheet'
cp $CONFIG_DIR/commands.md $SYM_DIR/.vim/

echo 'symlinks vimrc'
file_dest="$SYM_DIR/.vimrc"
file_src="$CONFIG_DIR/$OS/vimrc"
if [[ -s $file_dest ]]; then
  echo "EXISTS: $file_dest -> $(readlink $file_dest)"
else
  ln -s $file_src $file_dest
    echo "CREATED: $file_dest -> $file_src"
fi


echo 'installs essential plugins'
repo_src="$CONFIG_DIR/$OS/start-repos.txt"
repo_dest="$SYM_DIR/.vim/pack/bundle/start"

cd $repo_dest > /dev/null

for repo in $(cat $repo_src); do
  git clone $repo
done

cd "$ORIG" > /dev/null

echo 'installs optional plugins'
repo_src="$CONFIG_DIR/$OS/opt-repos.txt"
repo_dest="$SYM_DIR/.vim/pack/bundle/opt"

cd $repo_dest > /dev/null

for repo in $(cat $repo_src); do
  git clone $repo
done

cd "$ORIG" > /dev/null

