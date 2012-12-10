" Check PHP syntax of current file.
setlocal makeprg=php\ -l\ %
setlocal errorformat=%m\ in\ %f\ on\ line\ %l

" Show line number.
setlocal number

" Show trailing whitespaces.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Is ctags available?.
let s:ctagsavailable = system('which ctags-exuberant 2> /dev/null')

"""""""""""" PHPDOC """"""""""""""""""""""
" Map <ctrl>+p to multi line mode documentation.
inoremap <buffer> <C-P> :call PhpDocRange()<CR>
nnoremap <buffer> <C-P> :call PhpDocRange()<CR>
vnoremap <buffer> <C-P> :call PhpDocRange()<CR>

"""""""""""" TAGS """"""""""""""""""""""""

" Only if ctags is available.
if s:ctagsavailable =~ '/'

  " Get project tags filename (the hash of the path)
  let s:shreturn = system('sh ~/.vim/script/get_project_hash.sh')
  let s:tagsfile = substitute(s:shreturn,"[^0-9a-zA-Z\/_\.\ \-\+]","","g")

  " Add project tags if they are not there yet.
  if &tags !~ s:tagsfile

    " Creating tags file if it doesn't exists.
    if filereadable(s:tagsfile) == 'FALSE'
      execute system("sh ~/.vim/script/update_project_tags.sh " . s:tagsfile)
    endif

    " Adding the tags.
    execute "set tags+=" . s:tagsfile

    " Adding mappings.
    nmap <C-PageUp> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
    nmap <C-PageDown> :sp <CR>:exec("tag ".expand("<cword>"))<CR>
  endif
endif

" Function to rebuild tags by request with mapping
function! s:RebuildTags()

  let l:shreturn = system('sh ~/.vim/script/get_project_hash.sh')
  let l:tagsfile = substitute(s:shreturn,"[^0-9a-zA-Z\/_\.\ \-\+]","","g")
  execute system("sh ~/.vim/script/update_project_tags.sh " . s:tagsfile)
endfunction
command! -nargs=0 -bar RebuildTags call s:RebuildTags()


"""""""""""" OUTLINE """""""""""""""""""""

" Only is ctags is available.
if s:ctagsavailable =~ '/'

  " Tag list config & init
  let g:Tlist_Auto_Open = 1
  let g:Tlist_Auto_Update = 1
  let g:Tlist_Use_Right_Window = 1
  let g:Tlist_Sort_Type = 'name'
  let g:Tlist_File_Fold_Auto_Close = 1
  let g:Tlist_Exit_OnlyWindow = 1
  let g:Tlist_GainFocus_On_ToggleOpen = 0
  autocmd vimenter * TlistOpen

  " Toggle the tag list view.
  nnoremap <silent> <F8> :TlistToggle<CR>
endif

"""""""""""" TREE NAVIGATION """""""""""""
" Open tree navigation
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDChristmasTree = 1
let g:NERDTreeStatusline = 'Project explorer'

" Toggle the tree explorer
nnoremap <silent> <F7> :NERDTreeToggle<CR>

"""""""""""" GENERAL """""""""""""""""""""
" Focus to opened file window
autocmd vimenter * wincmd w
