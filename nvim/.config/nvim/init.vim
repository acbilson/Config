" # UNIVERSAL VARIABLES {
" ##################################
function! SetUniversalVariables()

  " Assigns the map leader to a comma
  let g:mapleader = ","

endfunction
" }
" # BASIC SETTINGS {
" ##################################
function! SetBasicSettings()

  " Uses lazy case matching
  set smartcase

  " Line numbers relative to cursor
  set number relativenumber

  " Shows matching parenthesis
  set showmatch

  " The characters before vim auto wraps the buffer
  set textwidth=0

  " Removes the auto line break feature
  set formatoptions-=t

  " Wraps lines in the screen, appending a break befor them to indicate
  " that they are on the same line, only wrapped
  set linebreak
  set showbreak=+++

  " Automatically change the working directory to the file location
  set autochdir

  " Allows Vim to auto-select syntax highlighting
  syntax enable

  " Reduces the number of redraws, speeding up actions
  set lazyredraw

  " sets tab width to 3 spaces but doesn't replace it
  set shiftwidth=3
  set tabstop=3

  " displays tabs as grey >
  set list

  " Removes all the options from the gui to make it smaller
  if has('gui_running')
    set guioptions=
  endif

  " **********************************
  " * BACKUPS
  " **********************************
  " No backups (the files ending in ~)
  set nobackup
  set noswapfile

endfunction
" }
" # BASIC MAPPINGS {
" ##################################
function! SetBasicMappings()

  " **********************************
  " * NAVIGATION
  " **********************************
  " Uses block movement by default
  nnoremap <silent> k gk
  nnoremap <silent> j gj

  " **********************************
  " * WINDOW
  " **********************************
  " Horizontal resizing as a fraction of the total
  nnoremap <Leader>< :exe 'vertical resize ' . (winwidth(0) * 3/2)<CR>
  nnoremap <Leader>> :exe 'vertical resize ' . (winwidth(0) * 2/3)<CR>

  " Vertical resizing as a fraction of the total
  nnoremap <Leader>+ :exe 'resize ' . (winheight(0) * 3/2)<CR>
  nnoremap <Leader>- :exe 'resize ' . (winheight(0) * 2/3)<CR>

  " **********************************
  " * TAGS
  " **********************************
  " moves forward on the current tag
  nnoremap <Leader>n <C-]>
  " moves backward to the previous tag
  nnoremap <Leader>p <C-T>

  " **********************************
  " * WINDOW
  " **********************************
  " Simplifies moving between windows
  nnoremap <Leader>h <C-w>h
  nnoremap <Leader>l <C-w>l
  nnoremap <Leader>k <C-w>k
  nnoremap <Leader>j <C-w>j

  " **********************************
  " * BUFFER
  " **********************************
  " moves to previous buffer and deletes old buffer
  nnoremap <Leader>x :bp<CR> :bd #<CR>

  " **********************************
  " * SPELLING
  " **********************************
  " Jump to the next misspelled word
  nnoremap <Leader>s ]s

  " Display possible modifications
  nnoremap <Leader>m z=

  " **********************************
  " * TERMINAL
  " **********************************

  " clears the search highlighting
  tnoremap <Esc> <C-\><C-n>

  " **********************************
  " * MISC
  " **********************************
  " clears the search highlighting
  nnoremap <Leader>/ <Cmd>nohlsearch<Bar>diffupdate<CR><C-L>

  " formats the current paragraph
  nnoremap <Leader>q gwap

  " selects the entire file
  nnoremap <Leader>a ggvG$

  " adds a new journal entry
  nnoremap <Leader>n :1,7y<ENTER>ggPjwww

  " experimental: switches the Escape key to df
  inoremap df <ESC>

endfunction
" }
" # ADD PATHS {
" ##################################
function! SetPaths()

  " **********************************
  " * NAVIGATION
  " **********************************
  " adds content path for navigation
  set path+=~/source/chaos-content

endfunction
" }
"" # ADD PROVIDERS {
" ##################################
function! SetProviders()

  " **********************************
  " * PYTHON
  " **********************************
  let g:python3_host_prog = '/usr/local/bin/python'

endfunction
" }

" # CLIPBOARD MAPPINGS {
" ##################################
function! SetClipboardMappings()

  " Changes autocomplete from the clunky Ctrl-P to tab
  "inoremap <TAB> <C-P>
  "
endfunction
" }
" # AUTOCOMMANDS (Event Handlers) {
" ##################################
function! SetAutocommands()
" Notes:
" ? - Skips if the buffer has no name (new file)
" silent - doesn't produce output.  The bang (!) silences errors too

  " **********************************
  " * ESSENTIAL AUTOCOMMANDS FOR ALL FILES
  " **********************************
  augroup vimrc_essential
    autocmd!

    " Removes the annoying error sound and the screen flash
    autocmd GUIEnter * set vb t_vb=

    " Strips trailing whitespace
    autocmd BufWritePre ?* :%s/\s\+$//e

    " Converts windows line breaks to unix
    autocmd BufWinEnter ?*.txt silent! :%s//\r/g
    autocmd BufWinEnter ?*.cs silent! :%s//\r/g
    autocmd BufWinEnter ?*.vb silent! :%s//\r/g

  augroup END

  " **********************************
  " * FOLDING AUTOCOMMANDS
  " **********************************
  augroup vimrc_folding
    autocmd!

    " Sets the fold method and marker for .vimrc files
    autocmd BufWinEnter .vim setlocal foldmarker={,}
    autocmd BufWinEnter .vim setlocal foldmethod=marker

  augroup END

  " **********************************
  " * MARKDOWN AUTOCOMMANDS
  " **********************************
  augroup vimrc_markdown
    autocmd!

    " Sets encoding to unicode when working with Markdown
    autocmd FileType markdown setlocal encoding=utf-8

    " adds Markdown suffix to navigate files that don't specify an ending
    autocmd FileType markdown setlocal suffixesadd=.md

    " if file is not found, remove leading slash and navigate again
    autocmd FileType markdown setlocal includeexpr=substitute(v:fname,'^\/','','g')

    " updates lastmod to today when the file is saved. 'norm' jumps back to origin with marker
    autocmd BufWritePre *.md exe "norm mz"|exe '%s/\(^lastmod = \"\).*\(\"\)/\1'.strftime("%Y-%m-%d %T").'\2/e'|norm 'z

  augroup END

endfunction
" }
" # MAC OPTIONS {
" ##################################
function! SetMacOptions()

  " **********************************
  " * MAC SETTINGS
  " **********************************

  " Set the font to something more pleasant
  set guifont=Courier:h16

  " Sets the color scheme
  set background=light
  colorscheme monokai

endfunction
" }
" # COMMON FUNCTIONS {
" ##################################
function! SetCommonFunctions()

" Opens a new window with notes about commands I want to learn
  function! ShowCommandList()

    6split ~/.vim/commands.md

  endfunction

  " Sets this to a simple map
  nnoremap <Leader>c :call ShowCommandList()<CR>

  " Adds a carriage return after closing HTML tags to make them easier to read
  function! ParseHTML()

    execute("s%/<\/[A-Za-z]*>/\0\r/g")

  endfunction

  " Converts the current content to HTML from Markdown and copies to the clipboard
  function! CopyMarkdownToHTML()

  if has("gui_macvim")
    execute("%w ! cat | pandoc -f markdown -t html | pbcopy")
  endif

  endfunction

endfunction
" }
" # PLUGIN OPTIONS {
" # NERDTREE OPTIONS {
" ##################################
function! SetNerdtreeOptions()

  " **********************************
  " * NERDTREE MAPPINGS
  " **********************************

  " simplify the way I open the directory tree
  nnoremap <Leader>t :NERDTreeToggle<CR>

endfunction
" }
" # EASY-MOTION OPTIONS {
" ##################################
function! SetEasyMotionOptions()

  " **********************************
  " * EASY MOTION MAPPINGS
  " **********************************
  " Jump to the next '_' which is super useful when editing test names
  " nnoremap <Leader>_ ,,f_

endfunction
" }
"" # COC OPTIONS {
" ##################################
function! SetCOCOptions()

	" Adds Prettier command to format the current code
	command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

endfunction
" }

" # VIM-AIRLINE OPTIONS {
" ##################################
function! SetVimAirlineOptions()

  " Causes the status bar to always appear
  set laststatus=2

endfunction
" }
" # Execute My Settings {
" ##################################
function! ExecuteSettings()

  call SetUniversalVariables()
  call SetBasicSettings()
  call SetBasicMappings()
  call SetClipboardMappings()
  call SetAutocommands()
  call SetCommonFunctions()
  call SetMacOptions()
  call SetPaths()
  call SetProviders()

  " adds package path to runtime
  " set packpath+=~/.vim
  packloadall

  " Set options for all my plugins
  call SetNerdtreeOptions()
  call SetEasyMotionOptions()
  call SetVimAirlineOptions()
  call SetCOCOptions()

endfunction
" }
call ExecuteSettings()
