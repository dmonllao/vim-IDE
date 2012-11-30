" Check PHP syntax of current file.
setlocal makeprg=php\ -l\ %
setlocal errorformat=%m\ in\ %f\ on\ line\ %l

" Show line number.
setlocal number
highlight LineNr ctermfg=white

" Pre save actions.
" Remove all trailing whitespace.
" autocmd BufWritePre *.php :%s/\s\+$//e

" Map <ctrl>+p to multi line mode documentation.
inoremap <buffer> <C-P> :call PhpDocRange()<CR>
nnoremap <buffer> <C-P> :call PhpDocRange()<CR>
vnoremap <buffer> <C-P> :call PhpDocRange()<CR>

" Update project tags.
let shreturn = system('sh ~/.vim/script/update_project_tags.sh')

" Cleaning the return
let $CSCOPE_DB = substitute(shreturn,"[^0-9a-zA-Z\/_\.\ \-\+]","","g") 

" Adding the tags
source ~/.vim/cscope_maps.vim

" Open tree navigation and place top directory to the cwd.
VSTreeExplore .
