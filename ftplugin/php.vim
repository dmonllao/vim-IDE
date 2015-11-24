"""""""""" Mappings """""""""""""""""

" Initialising IDE mode by default.
autocmd vimenter * IDEOpen

" To allow F5 and F6 to prepend/append a var_dump('<cword>') to the cursor current word line.
let g:php_echo_pre = 'var_dump($'
let g:php_echo_post = ');'

" phpDoc mapping.
nnoremap <buffer> <C-l> :call PhpDocRange()<CR>

"""""""""" Completion """""""""""""""

" Use php omnicompletion here.
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
set omnifunc=phpcomplete#CompletePHP
set completeopt=longest,menuone
let g:phpcomplete_complete_for_unknown_classes = 1
let g:phpcomplete_parse_docblock_comments = 1
let g:phpcomplete_mappings = {
  \ 'jump_to_def': '<c-a>',
  \ 'jump_to_def_split': '<c-c>',
  \ 'jump_to_def_vsplit': '<c-f>',
\}

"""""""""" Others """""""""""""""""""

" phpDocumentor values
let g:pdv_cfg_Type = "mixed"
let g:pdv_cfg_Package = ""
let g:pdv_cfg_Version = ""
let g:pdv_cfg_Copyright = "2015 David Monllaó"
let g:pdv_cfg_License = "http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later"
let g:pdv_cfg_Author = ""

" Check syntax of current file.
setlocal makeprg=php\ -l\ %
setlocal errorformat=%m\ in\ %f\ on\ line\ %l
