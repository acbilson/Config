" Adds all the packages to the runtimepath, making them available
" for every instance of vim
execute pathogen#infect()

" **********************************
" * VIEW SETTINGS
" **********************************

" Sets the color scheme
colorscheme solarized

" Removes the annoying error sound and the screen flash
set noerrorbells
set visualbell
set t_vb=

" Converts tabs into spaces and define a tab as two spaces
" set smarttab
set expandtab
set tabstop=2
set shiftwidth=2

" Line numbers
set number
"
" Shows the last command in the bottom bar
set showcmd

" Shows matching parenthesis
set showmatch

" The characters before vim auto wraps the buffer
set textwidth=120

" Automatically indents the next line
set autoindent

" Wraps lines in the screen, appending a break befor them to indicate
" that they are on the same line, only wrapped
set linebreak
set showbreak=+++

" Automatically change the working directory to the file location
set autochdir

" Allows Vim to auto-select syntax highlighting
syntax enable
"
" Gives the x,y coordinates of the cursor
" set ruler

" **********************************
" * MAPPINGS
" **********************************

" Assigns the map leader to a comma (not set!)
let mapleader = ","

" Simplify -
" opens the directory tree
nmap <Leader>t :NERDTreeToggle<CR>

" opens the personalrepo in a NERDTree
nmap <Leader>h :NERDTreeFromBookmark PersonalRepo<CR>

" extends window width 10 chars to the left
nmap <Leader>< 10<C-W><
" extends window width 10 chars to the right
nmap <Leader>> 10<C-W>>
" extends window height 10 chars to the bottom
nmap <Leader>- 10<C-W>-
" extends window height 10 chars to the top
nmap <Leader>+ 10<C-W>+

" moves to the next buffer
nmap <Leader>n :bn<CR>
" moves to the previous buffer
nmap <Leader>p :bp<CR>
" moves to previous buffer and deletes old buffer
nmap <Leader>x :bp<CR> :bd #<CR>

nmap <Leader>/ :nohlsearch<CR>

" Format the selected table declaration into many rows
vmap <Leader>ft :s/, /,\r  /g<CR>

" Makes setting sql syntax (for .krs files) fast and easy
nmap <Leader>s :set syntax=sql<CR>

" Surround all instances of Bible verses at the end of lines with parentheses
nmap <Leader>sbv :%s/\w\+\s\d\+\:\d\+$/(\0)/g

" Custom settings for working with my compilation file
nmap <Leader>setup :set nowrap \| set nolinebreak \| set encoding=utf-8 \| set foldmethod=marker

" **********************************
" * SEARCH SETTINGS
" **********************************

" Searches in real-time, and highlights matches
set incsearch
set hlsearch

" Uses lazy case matching
set smartcase

" **********************************
" * MISC VIM SETTINGS
" **********************************

" No backups (the files ending in ~)
set nobackup
set noswapfile

" Reduces the number of redraws, speeding up actions
set lazyredraw

" Sets compatibility with vi to off
set nocompatible
