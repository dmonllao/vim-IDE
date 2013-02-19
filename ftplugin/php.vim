"""""""""" Mappings """""""""""""""""

" Initialising IDE mode by default.
autocmd vimenter * IDEOpen

" phpDoc mapping.
nnoremap <buffer> <C-p> :call PhpDocRange()<CR>


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

" Show trailing whitespaces and tabs.
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * call clearmatches()
autocmd BufWinLeave * call clearmatches()
autocmd InsertLeave * call clearmatches()
autocmd InsertEnter * match ExtraWhitespace /\s\+$\| \+\ze\t\|\t/

