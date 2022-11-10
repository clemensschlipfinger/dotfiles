"
" ~/.vimrc
"

"Set the Background Color of visual selection
"hi Visual cterm=NONE ctermfg=NONE ctermbg=238 guibg=#3a3a3a

"Syntax Highlighting
syntax on

"Instead of tabs use spaces
set tabstop=4
set shiftwidth=4
set expandtab

"Auto indent
set autoindent

"Set Theme
colorscheme peachpuff

"Add helix like jumps

"jump to start of line
nmap gh 0
vmap gh 0

"jump to end of line
nmap gl $
vmap gl $

"set relative lines 
set relativenumber
