""""""""" General Vim settings """""""""""""""""

syntax enable
set fileformats=unix,dos
set ruler
set laststatus=2

" Auto read when a file is changed from the outside.
set autoread

" Tab key produces 4 spaces, and tab characters are converted to spaces.
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" When you start searching text with /, search is performed at every
" new character insertion.
set incsearch
set hlsearch

" Turn on filetype detection and load the plugin files for
" specific file types.
filetype plugin on

" Pathogen to install plugins as git submodules.
call pathogen#infect()

" Styles.
color jellybeans
let g:airline_theme='hybrid'

" Yellow as selected whatever colour.
highlight Search ctermbg=3 ctermfg=Black
highlight Visual ctermbg=3 ctermfg=Black
highlight VisualNOS ctermbg=3 ctermfg=Black

" Fuzzy search.
set path=$PWD/**
let g:ctrlp_working_path_mode='a'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" Apply here IDE defaults.
" ToggleType and PrtCurStart extended to remove the duplicates once re-maped.
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<cr>', '<c-a>', '<2-LeftMouse>'],
    \ 'AcceptSelection("h")': ['<c-c>', '<c-RightMouse>'],
    \ 'AcceptSelection("v")': ['<c-f>', '<c-MiddleMouse>'],
    \ 'ToggleType(1)':        ['<c-up>'],
    \ 'PrtCurStart()':        ['<c-i>'],
\ }

" Show trailing whitespaces and tabs.
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * call clearmatches()
autocmd BufWinLeave * call clearmatches()
autocmd InsertLeave * call clearmatches()
autocmd InsertEnter * match ExtraWhitespace /\s\+$\| \+\ze\t\|\t/

" Loading user settings and overwrites.
if filereadable(expand("~/.vim/custom.vim"))
    source ~/.vim/custom.vim
endif
