augroup my_autocmds

    au!

    "Lint
    if functions#PluginExists('neomake')
        if functions#PluginExists('lightline')
            au User NeomakeFinished call lightline#update()
        endif
        au! VimLeave * let g:neomake_verbose=0
        au BufWritePost * Neomake
    endif
    if functions#PluginExists('ale')
        if functions#PluginExists('lightline')
            au User ALELint call lightline#update()
        endif
    endif


    "resize automatically
    au VimResized * execute "normal! \<c-w>="

    "Lazy load plugins
    au BufReadPre * call lazy#LoadGit()
    au BufReadPre * call lazy#LoadDjango()

    au BufReadPost * call functions#LineReturn()

    if functions#PluginExists('projectroot')
        au BufEnter * call functions#AutoCDtoProjectRoot()
    endif

augroup END
