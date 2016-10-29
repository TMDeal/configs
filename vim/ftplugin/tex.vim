setlocal wrap
setlocal spell
setlocal textwidth=80

augroup tex
    au!
    au User VimtexEventQuit VimtexClean
augroup END
