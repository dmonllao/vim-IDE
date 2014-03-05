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



""""""""" IDE COMMANDS """"""""""""""""""""""""""""""""""""""""""""""
"
" :IDEOpen               Starts IDE mode.
" :IDEClose              Stops IDE mode.
" :IDERebuildTags        Rebuilds the project tags of the current
"                        buffer filetype.
"
"
""""""""" VARS """"""""""""""""""""""""""""""""""""""""""""""""""""""
"
"let g:IDEAlways = 1     Always open Vim in IDE mode, without
"                        considering the file type.
"
"let g:IDEOnlyEditor = 1 Open Vim in IDE mode but only displaying
"                        the editor window.
"
""""""""" KEY MAPPINGS (CHANGE THEM AS YOU WISH) """"""""""""""""""""
"
" These are the default keys mappings, uncomment and replace the
" values with your mappings using the Vim <KEY> format.
"
""""""""""""""""""
"
" Mappings used when opening files both through the project project
" explorer and when jumping to functions/classes definitions.
"
" Note that to jump to functions/classes you must press CTRL + KEY,
" where KEY is the key specified in "g:IDE....Key" vars.
"
"let g:IDESplitWindowKey = 'c'
"let g:IDEVSplitWindowKey = 'f'
"let g:IDEOpenCurrentWindowKey = 'a'
"
""""""""""""""""""
"
" Mappings used to hide/show the lateral windows.
"
"let g:IDENERDTreeToggleKey = 'F7'
"let g:IDETagListToggleKey = 'F8'
"
""""""""""""""""""
"
" Other mappings
"
"let g:IDEPasteModeKey = 'F9'
"
"
""""""""" ADD YOUR OWN VIM SETTING/MAPPINGS """""
"
" Add here your own Vim setting and overwrites
"
