" Set the 'cpoptions' option to its Vim default value and restore it later.
" This is to enable line-continuation within this script.
" Refer to :help use-cpo-save.
let s:save_cpoptions = &cpoptions
set cpoptions&vim

augroup ReopenBuffer
  autocmd!
  autocmd BufWinLeave *
  \ echo 'BufWinleave' |
  \ let g:bufnameClosed = expand('<afile>') |
  \ let g:bufnrClosed = expand('<abuf>')
augroup END

command! ReopenBuffer
\ if exists('g:bufnrClosed') |
\ execute 'tabedit #' . g:bufnrClosed |
\ endif

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
