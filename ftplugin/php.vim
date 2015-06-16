"""""""""" Mappings """""""""""""""""

" Initialising IDE mode by default.
autocmd vimenter * IDEOpen

" To allow F5 and F6 to prepend/append a var_dump('<cword>') to the cursor current word line.
let g:php_echo_pre = 'var_dump($'
let g:php_echo_post = ');'

" phpDoc mapping.
nnoremap <buffer> <C-l> :call PhpDocRange()<CR>

"""""""""" Completion """""""""""""""

" Overwrite the default omni-completion for the PHP one.
set omnifunc=phpcomplete#CompletePHP

"""""""""" Others """""""""""""""""""

" phpDocumentor values
let g:pdv_cfg_Type = "mixed"
let g:pdv_cfg_Package = ""
let g:pdv_cfg_Version = ""
let g:pdv_cfg_Copyright = "2013 David Monllaó"
let g:pdv_cfg_License = "http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later"
let g:pdv_cfg_Author = ""

" Check syntax of current file.
setlocal makeprg=php\ -l\ %
setlocal errorformat=%m\ in\ %f\ on\ line\ %l
