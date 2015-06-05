"""""""""" Mappings """""""""""""""""

" Initialising IDE mode by default.
autocmd vimenter * IDEOpen

" To allow F5 and F6 to prepend/append a echo '<cword>' to the cursor current word line.
" Not sure how useful it will be as we don't know the cword variable scope..
let g:vim_echo_pre = 'echo "'
let g:vim_echo_post = '"'
