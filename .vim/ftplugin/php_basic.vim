" Check PHP syntax of current file.
setlocal makeprg=php\ -l\ %
setlocal errorformat=%m\ in\ %f\ on\ line\ %l

" Show line number.
setlocal number
highlight LineNr ctermfg=white

" Pre save actions.
" TODO Transform into view trailing whitespace
" Remove all trailing whitespace.
" autocmd BufWritePre *.php :%s/\s\+$//e

"""""""""""" PHPDOC """"""""""""""""""""""
" Map <ctrl>+p to multi line mode documentation.
inoremap <buffer> <C-P> :call PhpDocRange()<CR>
nnoremap <buffer> <C-P> :call PhpDocRange()<CR>
vnoremap <buffer> <C-P> :call PhpDocRange()<CR>

"""""""""""" TAGS JUMPS """"""""""""""""""
" Update project tags.
let shreturn = system('sh ~/.vim/script/update_project_tags.sh')

" Cleaning the return
let $CSCOPE_DB = substitute(shreturn,"[^0-9a-zA-Z\/_\.\ \-\+]","","g") 

" Adding the tags
source ~/.vim/cscope_maps.vim

"""""""""""" TREE NAVIGATION """""""""""""
" Open tree navigation
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDChristmasTree = 1
let NERDTreeStatusline = 'Project explorer'

" Toggle the tree explorer
nnoremap <silent> <F7> :NERDTreeToggle<CR>

"""""""""""" OUTLINE """""""""""""""""""""
" Tag list config & init
let Tlist_Auto_Open = 1
let Tlist_Use_Right_Window = 1
let Tlist_Sort_Type = 'name'
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1
TlistOpen

" Toggle the tag list view.
nnoremap <silent> <F8> :TlistToggle<CR>
