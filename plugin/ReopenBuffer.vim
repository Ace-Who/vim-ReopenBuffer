augroup ReopenBuffer
  autocmd!
  autocmd BufWinLeave * call ReopenBuffer#Save(expand('<abuf>'))
augroup END

command! -nargs=? ReopenBuffer call ReopenBuffer#Doit(<args>)
