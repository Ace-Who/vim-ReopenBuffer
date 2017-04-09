" Set the 'cpoptions' option to its Vim default value and restore it later.
" This is to enable line-continuation within this script.
" Refer to :help use-cpo-save.
let s:save_cpoptions = &cpoptions
set cpoptions&vim

unlet! g:buffpClosed g:bufnrClosed

augroup ReopenBuffer
  autocmd!
  autocmd BufWinLeave *
  \ unlockvar g:buffpClosed g:bufnrClosed |
  \ let g:buffpClosed = expand('<afile>:p') |
  \ let g:bufnrClosed = expand('<abuf>') |
  \ lockvar g:buffpClosed g:bufnrClosed
augroup END

command! ReopenBuffer
\ if exists('g:bufnrClosed') |
\ execute 'tabedit #' . g:bufnrClosed |
\ endif

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
