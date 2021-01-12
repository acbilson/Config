## Vim Commands {
,c  | opens this split window
,w  | switches between window modes (coding, writing)
,n  | jumps to next tag
,p  | jumps to previous tag
,x  | jumps to next buffer and deletes the first
,/  | clears search highlighting
,f[char] | Jumps to any instance of [char]

### Coding
,t  | toggle NERDTree directory
,b  | toggle TagBar
,e  | jumps to next error in location-list (Syntastic)
,s  | runs syntastic check

### Writing
,q  | formats the current paragraph
,a  | selects the entire file
,s  | jumps to next misspelled word
,m  | displays possible modifications for the word

### Window
,+  | resizes window vertically
,-  | resizes window vertically
,<  | resizes window horizontally
,>  | resizes window horizontally
,h  | jumps to window on the left
,l  | jumps to window on the right

<c-b> | Enter visual block mode
<c-v> | Paste from computer clipboard
<c-c> | Copy to computer clipboard

<c-p> | SublimeText CTRL-P functionality
<c-o> | Select options for opening files with CTRL-P (split horizontal, vertical, etc)

:resize #           | resize the window horizontally
:vertical resize #  | resizes the window horizontally

:so $MYVIMRC        | reload .vimrc
}
## Plugin Commands {
:packadd <packagename> | adds a package from the opt/ folder in ~/Dropbox/.vim

:SyntaxInfo | Displays information about the available syntax tools for the current file
:SyntasticCheck <checker> | Runs the selected syntax checker/linter (or all if blank)

:Wordy <TAB>   | Checks for common grammar mistakes. Useful ones:
                 - business-jargon
                 - passive-voice
                 - weak
                 - weasel
}
## Emmet Notes {
Expansions happen by placing the cursor at the end of the command and pressing <Ctrl-P><Leader>

table>(thead>tr>th*5)+tbody>tr>td*5 | expands a table with header and five columns

Cheat sheet | https://docs.emmet.io/cheat-sheet/
}
## OmniSharp Notes {
gd         - go to definition
<Leader>fi - find implementations
<Leader>fu - find usages

<Leader>cc - full namespace type lookup

<C-j>      - move down by method
<C-k>      - move up by method

Cheat sheet | https://github.com/OmniSharp/Omnisharp-vim
}
