" Set the 'cpoptions' option to its Vim default value and restore it later.
" This is to enable line-continuation within this script.
" Refer to :help use-cpo-save.
let s:save_cpoptions = &cpoptions
set cpoptions&vim

if exists('g:ReopenBuffer_List') && (type(g:ReopenBuffer_List) != v:t_list)
  let g:ReopenBuffer_List = []
endif

function! ReopenBuffer#Doit(...)
  let l:index = get(a:000, 0, 0)
  if type(l:index) != v:t_number
    echohl Error
    echo 'The argument should be an integer.'
    echohl NONE
    return 0
  endif
  if !exists('g:ReopenBuffer_List[l:index]')
    echohl Error
    echo 'No such buffer saved.'
    echohl NONE
    return 0
  endif
  " Short name for internal use within this function.
  let l:bufs = g:ReopenBuffer_List
  unlockvar! l:bufs
  let l:buf = remove(l:bufs, l:index)
  lockvar! l:bufs
  execute 'tabedit #' . l:buf[0]
  return 1
endfunction

function! ReopenBuffer#Save(bufnr)
  if !exists('g:ReopenBuffer_List')
    let g:ReopenBuffer_List = []
  endif
  " Short name for internal use within this function.
  let l:bufs = g:ReopenBuffer_List
  let l:bufFP = expand('#' . a:bufnr . ':p')
  unlockvar! l:bufs
  call insert(l:bufs, [a:bufnr, l:bufFP])
  if len(l:bufs) > 100
    call remove(l:bufs, -1)
  endif
  lockvar! l:bufs
endfunction

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions

