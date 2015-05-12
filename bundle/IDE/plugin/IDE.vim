"""""""""" Public """""""""""""""""""

" Starts IDE mode.
command! -nargs=0 -bar IDEOpen call s:IDEOpen()

" Stops IDE mode.
command! -nargs=0 -bar IDEClose call s:IDEClose()

" Rebuild the tags of the current buffer.
command! -nargs=0 -bar IDERebuildTags call s:IDEBuildTags(0)

" Output console results in a new buffer.
command! -complete=shellcmd -nargs=+ IDES call s:IDERunShellCommand(<q-args>)

" To make Vim init in IDE mode with all kind of files.
if !exists("g:IDEAlways")
  let g:IDEAlways = 0
endif

" To open in IDE mode but displaying only the editor window.
if !exists("g:IDEOnlyEditor")
    let g:IDEOnlyEditor = 0
endif

" Default key mappings
if !exists("g:IDESplitWindowKey")
  let g:IDESplitWindowKey = 'c'
endif

if !exists("g:IDEVSplitWindowKey")
  let g:IDEVSplitWindowKey = 'f'
endif

if !exists("g:IDEOpenCurrentWindowKey")
  let g:IDEOpenCurrentWindowKey = 'a'
endif

if !exists("g:IDEFindUsesKey")
  let g:IDEFindUsesKey = 'v'
endif

if !exists("g:IDENERDTreeToggleKey")
  let g:IDENERDTreeToggleKey = 'F7'
endif

if !exists("g:IDETagListToggleKey")
  let g:IDETagListToggleKey = 'F8'
endif

if !exists("g:IDEPasteModeKey")
  let g:IDEPasteModeKey = 'F9'
endif

"""""""""" Internals """"""""""""""""

let s:IDEModeOn = 0

" Open the IDE windows
function! s:IDEOpen()

  if s:IDEModeOn == 1
    return 0
  endif

  " Show line numbers.
  set number

  " Add key mappings.
  call s:IDEAddKeyMappings()

  " Support QuickFix for Ggrep.
  autocmd QuickFixCmdPost *grep* cwindow

  " Set the default Vim omni-completion.
  if (&omnifunc == "")
    set omnifunc=syntaxcomplete#Complete
  endif

  " When completing we don't want to open windows.
  set completeopt=menuone

  " SuperTab opening omni-completion by default.
  let g:SuperTabDefaultCompletionType = "<c-n>"

  " Tags and file output.
  call s:IDEBuildTags(1)

  " Project explorer load and display.
  call s:IDEAddNERDTree()

  " Focus to opened file window.
  wincmd w

  let s:IDEModeOn = 1

  " Hide explorer and tag list if required.
  if g:IDEOnlyEditor != 0
    NERDTreeClose
    if bufwinnr(g:TagList_title) != -1
        TlistClose
    endif
  endif

  " StatusLine stuff up to date with the theme and all.
  AirlineRefresh

endfunction


" Closes the IDE windows
function! s:IDEClose()

  " Get file type.
  let l:language = s:IDEGetFileLanguage()

  set nonumber

  NERDTreeClose

  if bufwinnr(g:TagList_title) != -1
    TlistClose
  endif

  let s:IDEModeOn = 0

endfunction


" Function to build tags
function! s:IDEBuildTags(check_previous_file)

  let l:language = s:IDEGetFileLanguage()

  " Is ctags available?.
  let l:ctags_available = system('which ctags 2> /dev/null')
  let l:tags_command_path = s:IDEGetCtagsScript(l:language)

  " Only if ctags is available and if there is a tags command for this language.
  if l:ctags_available =~ '/' && filereadable(expand(l:tags_command_path))

    " Get project tags filename (the hash of the pwd + filetype).
    let l:tags_file = s:IDEGetProjectHashFilePath(l:language) . '_tags'

    " Add project tags if they are not there yet.
    if a:check_previous_file == 0 || &tags !~ l:tags_file

      " Creating tags file if it doesn't exists.
      if a:check_previous_file == 0 || !filereadable(expand(l:tags_file))
        echom "Generating tags file... It can take a while depending on how big your project is."
        call s:IDERunCtagsCommand(l:tags_command_path, l:tags_file)
        echo "Tags file successfully created."
      endif

      " Adding the tags.
      execute "set tags+=" . l:tags_file

      " Init taglist if it was not already initialised.
      if a:check_previous_file == 1
        call s:IDEAddTaglist()
      endif
    endif

    " Load cscope mappings if cscope is available.
    if has('cscope')
      let l:cscope_file = s:IDEGetProjectHashFilePath(l:language) . '_cscope'
      if filereadable(l:cscope_file)
        let l:cscope_already_set = 1
      endif

      " Only the first time or if the user explicitly requests it.
      if a:check_previous_file == 0 || !exists('l:cscope_already_set')

        " Clean old stuff.
        if exists('l:cscope_already_set')
            exe system('rm ' . l:cscope_file)
            set nocscopeverbose
            exe "cs kill " . l:cscope_file
            set cscopeverbose
        endif

        exe system('find . -name "*.' . l:language . '" > cscope.files')

        " It may be the first file in the folder.
        if getfsize(expand('cscope.files')) > 0
          echom "Generating cscope file... It can take a while depending on how big your project is."
          exe system('cscope -R -b &> /dev/null')
          exe system('rm cscope.files')
          exe system('mv cscope.out ' . l:cscope_file)
          echo "Cscope file successfully created."
        else
          exe system('rm cscope.files')
        endif
      endif

      if filereadable(l:cscope_file)
        call s:IDELoadCscope(l:cscope_file)
      endif
    endif

  endif

  echo "Project tags successfully loaded."
endfunction


" Adds Taglist
function! s:IDEAddTaglist()

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

endfunction


" Loads cscope file.
function! s:IDELoadCscope(cscope_file)
  set nocscopeverbose
  exe "cs add " . a:cscope_file
  set cscopeverbose
endfunction


" Adds the key mappings depening on the provided values.
function! s:IDEAddKeyMappings()

  " Copy & paste from system clipboard (only available if vim was compiled with clipboard support).
  if has('clipboard')
    exe 'map <C-c> "+y<CR>'
    set mouse=a
  endif

  " Jump to definitions mappings.
  exe 'nmap <C-' . g:IDEVSplitWindowKey . '> :vsp <CR>:exec("tjump ".expand("<cword>"))<CR>'
  exe 'nmap <C-' . g:IDESplitWindowKey . '> :sp <CR>:exec("tjump ".expand("<cword>"))<CR>'
  exe 'nmap <C-' . g:IDEOpenCurrentWindowKey . '> :exec("tjump ".expand("<cword>"))<CR>'

  " Finds uses of the current tag.
  exe 'nmap <C-' . g:IDEFindUsesKey . '> :scs find s <C-R>=expand("<cword>")<CR><CR><Tab>'

  " File outline window mapping.
  exe 'nmap <silent> <' . g:IDETagListToggleKey . '> :TlistToggle<CR>'

  " Project explorer window mapping.
  exe 'nmap <silent> <' . g:IDENERDTreeToggleKey . '> :NERDTreeToggle<CR>'

  " Left mouse click to open the definition in the same window.
  exe 'nmap <C-LeftMouse> <LeftMouse> :exec("tjump ".expand("<cword>"))<CR>'

  " Right mouse click to open the definition in a new :sp window.
  exe 'nmap <C-RightMouse> <LeftMouse> :sp <CR>:exec("tjump ".expand("<cword>"))<CR>'

  " Middle mouse click to open the definition in a new :vsp window.
  exe 'nmap <C-MiddleMouse> <LeftMouse> :vsp <CR>:exec("tjump ".expand("<cword>"))<CR>'

endfunction


" Adds NERDTree
function! s:IDEAddNERDTree()

  let g:NERDChristmasTree = 1
  let g:NERDTreeStatusline = 'Project explorer'

  " Open tree navigation.
  NERDTree

  " Close vim if it's the last window.
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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
function! s:IDEGetProjectHashFilePath(language)
  let l:shreturn = system('sh ~/.vim/script/get_project_hash.sh ' . a:language)
  return substitute(l:shreturn,"[^0-9a-zA-Z\/_\.\ \-\+]","","g")
endfunction

" Opens the terminal output in a new window
" http://vim.wikia.com/wiki/Display_output_of_shell_commands_in_new_window
function! s:IDERunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
  call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction
