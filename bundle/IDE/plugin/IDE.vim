
" Public access
command! -nargs=0 -bar IDEOpenProject call s:IDEOpenProject()
command! -nargs=0 -bar IDEInitProject call s:IDEInitProject()
command! -nargs=0 -bar IDERebuildTags call s:IDERebuildTags()

" Function to open the project UI
function! s:IDEOpenProject()

  " Show line numbers.
  setlocal number

  " Get file type.
  let l:language = s:IDEGetFileLanguage()

  " Support QuickFix for Ggrep.
  autocmd QuickFixCmdPost *grep* cwindow

  " Project explorer load and display.
  call s:IDELoadNERDTree()

  " Tags and file output.
  call s:IDELoadTags(l:language)

  if exists("w:IDESetLanguageMake")
    call w:IDESetLanguageMake()
  endif

  if exists("w:IDESetLanguageExtra")
    call w:IDESetLanguageExtra()
  endif

  " Focus to opened file window.
  wincmd w

endfunction


" Function to rebuild tags by request with mapping
function! s:IDERebuildTags()

  let l:language = s:IDEGetFileLanguage()
  let l:tags_command_path = s:IDEGetCtagsScript(l:language)
  let l:tags_file = s:IDEGetProjectTagsFileName(l:language)

  call s:IDERunCtagsCommand(l:tags_command_path, l:tags_file);

endfunction


" Load the tags of the specified language inside the project scope
function! s:IDELoadTags(language)

  " Is ctags available?.
  let l:ctags_available = system('which ctags 2> /dev/null')
  let l:tags_command_path = s:IDEGetCtagsScript(a:language)

  " Only if ctags is available and if there is a tags command for this language.
  if l:ctags_available =~ '/' && filereadable(expand(l:tags_command_path))

    " Get project tags filename (the hash of the pwd + filetype).
    let l:tags_file = s:IDEGetProjectTagsFileName(a:language)

    " Add project tags if they are not there yet.
    if &tags !~ l:tags_file

      " Creating tags file if it doesn't exists.
      if filereadable(expand(l:tags_file)) == 'FALSE'
        call s:IDERunCtagsCommand(l:tags_command_path, l:tags_file)
      endif

      " Adding the tags.
      execute "set tags+=" . l:tags_file

      " Adding mappings.
      nmap <C-PageUp> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
      nmap <C-PageDown> :sp <CR>:exec("tag ".expand("<cword>"))<CR>
    endif

    " File outline (Tag list config & init).
    let g:Tlist_Auto_Open = 1
    let g:Tlist_Auto_Update = 1
    let g:Tlist_Use_Right_Window = 1
    let g:Tlist_Sort_Type = 'name'
    let g:Tlist_File_Fold_Auto_Close = 1
    let g:Tlist_Exit_OnlyWindow = 1
    let g:Tlist_GainFocus_On_ToggleOpen = 0
    TlistOpen

    " It seems that taglist ignores g:Tlist_GainFocus_On_ToggleOpen.
    wincmd w

    " Toggle the tag list view.
    nnoremap <silent> <F8> :TlistToggle<CR>

  endif
endfunction

" Adds NERDTree
function! s:IDELoadNERDTree()

  let g:NERDChristmasTree = 1
  let g:NERDTreeStatusline = 'Project explorer'

  " Open tree navigation.
  NERDTree

  " Close vim if it's the last window.
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

  " Toggle the tree explorer.
  nnoremap <silent> <F7> :NERDTreeToggle<CR>

endfunction


" Returns the current buffer file type
function! s:IDEGetFileLanguage()
  return &filetype
endfunction

" Runs the ctags command
function! s:IDERunCtagsCommand(command_path, tags_file)
  execute system('sh ' . a:command_path . ' ' . a:tags_file)
endfunction

" Returns the path to the language ctags script
function! s:IDEGetCtagsScript(language)
  return '~/.vim/fttags/' . a:language . '.sh'
endfunction

" Gets the tags filename ([pwd + language] unique)
function! s:IDEGetProjectTagsFileName(language)
  let l:shreturn = system('sh ~/.vim/script/get_project_hash.sh ' . a:language)
  return substitute(l:shreturn,"[^0-9a-zA-Z\/_\.\ \-\+]","","g")
endfunction

