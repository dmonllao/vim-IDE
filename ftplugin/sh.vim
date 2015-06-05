"""""""""" Mappings """""""""""""""""

" Initialising IDE mode by default.
autocmd vimenter * IDEOpen

" Show a column when lines are longer than 80.
setlocal colorcolumn=80

" To allow F5 and F6 to prepend/append a echo '<cword>' to the cursor current word line.
let g:sh_echo_pre = 'echo "$'
let g:sh_echo_post = '"'


