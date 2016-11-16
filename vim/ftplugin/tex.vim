setlocal wrap
setlocal spell
setlocal textwidth=80

augroup tex
    au!
    if functions#PluginExists('vimtex')
        au User VimtexEventQuit VimtexClean
    endif
augroup END
