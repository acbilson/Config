" Adds all the packages to the runtimepath, making them available
" for every instance of vim
execute pathogen#infect()

" **********************************
" * VIEW SETTINGS
" **********************************

" Set the font to something more pleasant
set guifont=Courier_New:h12:cANSI

" Sets the color scheme
colorscheme solarized

" Removes the annoying error sound and the screen flash
set noerrorbells
set visualbell

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

" Sets the map leader to a comma
set mapleader = ","

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
"nmap <Leader>x :bp<CR> :bd #

" Format the selected table declaration into many rows
vmap <Leader>ft :s/, /,\r  /g<CR>

" Makes setting sql syntax (for .krs files) fast and easy
nmap <Leader>s :set syntax=sql<CR>

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

" Set the standard shell to Powershell
set shell=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe

" Reduces the number of redraws, speeding up actions
set lazyredraw

" Allows common windows function to work, esp. <C-c> for copy and <C-v> for paste
behave mswin
source $VIMRUNTIME/mswin.vim

" Sets compatibility with vi to off
set nocompatible

" Sets the diff functionality
set diffexpr=MyDiff()

function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
