" If IDEAlways open IDE mode.
if g:IDEAlways == 1
  autocmd vimenter * IDEOpen
endif

" Paste mode on demand (paste conflicts with mappings and abreviations).
exe 'set pastetoggle=<' . g:IDEPasteModeKey . '>'
" Go to insert mode when <ins> pressed in normal mode.
exe 'nnoremap <silent> <' . g:IDEPasteModeKey . '> :setlocal paste!<CR>i'
" Switch paste mode off whenever insert mode is left.
autocmd InsertLeave <buffer> se nopaste
