"""""""""" Mappings """""""""""""""""

" Initialising IDE mode by default.
autocmd vimenter * IDEOpen

" To allow F5 and F6 to prepend/append a echo '<cword>' to the cursor current word line.
let g:sh_echo_pre = 'print "%s" ('
let g:sh_echo_post = ')'

" Use php omnicompletion here.
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
set completeopt=longest,menu

