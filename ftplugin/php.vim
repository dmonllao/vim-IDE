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
highlight BadForm ctermbg=red guibg=red
autocmd BufWinEnter * call clearmatches()
autocmd BufWinEnter * let w:m1=matchadd('BadForm', '\t', -1)
autocmd BufWinEnter * let w:m1=matchadd('BadForm', '\s\+$', -1)
autocmd BufWinEnter * let w:m2=matchadd('BadForm', '^[^\/]*\n[^\:]*\/\/\s*[a-z].*$', -1)
autocmd BufWinEnter * let w:m3=matchadd('BadForm', '\(^\|[^:]\)\/\/.*[^.?!]\n\w*\([^\/ ]\|$\)', -1)
autocmd InsertEnter * call clearmatches()
autocmd InsertEnter * let w:m3=matchadd('BadForm', '\(^\|[^:]\)\/\/.*[^.?!]\%#\@<!\n\w*\([^\/ ]\|$\)', -1)
autocmd InsertEnter * let w:m2=matchadd('BadForm', '^[^\/]*\n[^\:]*\/\/\s*[a-z].*\%#\@<!$', -1)
autocmd InsertEnter * let w:m1=matchadd('BadForm', '\s\+\%#\@<!$', -1)
autocmd InsertLeave * call clearmatches()
autocmd InsertLeave * let w:m3=matchadd('BadForm', '\(^\|[^:]\)\/\/.*[^.?!]\n\w*\([^\/ ]\|$\)', -1)
autocmd InsertLeave * let w:m2=matchadd('BadForm', '^[^\/]*\n[^\:]*\/\/\s*[a-z].*$', -1)
autocmd InsertLeave * let w:m1=matchadd('BadForm', '\t', -1)
autocmd InsertLeave * let w:m1=matchadd('BadForm', '\s\+$', -1)
autocmd BufWinLeave * call clearmatches()

