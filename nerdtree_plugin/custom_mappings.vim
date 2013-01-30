" NERDTree plugin to use the same key mappings used in IDE plugin for tag
" jumps.

call NERDTreeAddKeyMap({'key': g:IDEVSplitWindowKey, 'scope': "FileNode", 'callback': "IDENERDTreeOpenVSplit"})
call NERDTreeAddKeyMap({'key': g:IDESplitWindowKey, 'scope': "FileNode", 'callback': "IDENERDTreeOpenHSplit"})
call NERDTreeAddKeyMap({'key': g:IDEOpenCurrentWindowKey, 'scope': "FileNode", 'callback': "IDENERDTreeOpenCurrent"})

function! IDENERDTreeOpenCurrent(target)
    call a:target.activate({'reuse': 1, 'where': 'p'})
endfunction

function! IDENERDTreeOpenVSplit(target)
    call a:target.activate({'where': 'v'})
endfunction

function! IDENERDTreeOpenHSplit(target)
    call a:target.activate({'where': 'h'})
endfunction
