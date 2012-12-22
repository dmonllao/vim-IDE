" General.
syntax enable
set fileformats=unix,dos
set ruler
set laststatus=2

" Show line number.
setlocal number

" Support QuickFix for Ggrep.
autocmd QuickFixCmdPost *grep* cwindow

" Open tree navigation
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDChristmasTree = 1
let g:NERDTreeStatusline = 'Project explorer'

" Toggle the tree explorer
nnoremap <silent> <F7> :NERDTreeToggle<CR>

" Focus to opened file window
autocmd vimenter * wincmd w

" Auto read when a file is changed from the outside.
set autoread

" Tab key produces 4 spaces, and tab characters are converted to spaces.
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" When you start searching text with /, search is performed at every new character insertion.
set incsearch
set hlsearch

" Turn on filetype detection and load the plugin files for specific file types.
filetype plugin on

" Paste mode ONLY with INSERT key (paste conflicts with mappings and abreviations).
set pastetoggle=<ins>
" Go to insert mode when <ins> pressed in normal mode.
nnoremap <silent> <ins> :setlocal paste!<CR>i
" Switch paste mode off whenever insert mode is left.
autocmd InsertLeave <buffer> se nopaste

" Pathogen to install plugins as git submodules.
call pathogen#infect()

color jellybeans
