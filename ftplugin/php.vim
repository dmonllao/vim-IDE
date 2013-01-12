" Check PHP syntax of current file.
setlocal makeprg=php\ -l\ %
setlocal errorformat=%m\ in\ %f\ on\ line\ %l

" Show trailing whitespaces.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" phpDoc
" Map <ctrl>+p to multi line mode documentation.
inoremap <buffer> <C-P> :call PhpDocRange()<CR>
nnoremap <buffer> <C-P> :call PhpDocRange()<CR>
vnoremap <buffer> <C-P> :call PhpDocRange()<CR>

" Initialising IDE.
IDEInit
