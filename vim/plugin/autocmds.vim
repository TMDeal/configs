augroup my_autocmds

    au!

    "Lint
    if dein#tap('neomake')
        if dein#tap('lightline')
            au User NeomakeFinished call lightline#update()
        endif
        au! VimLeave * let g:neomake_verbose=0
        au BufWritePost * Neomake
    endif
    if dein#tap('ale')
        if dein#tap('lightline')
            au User ALELint call lightline#update()
        endif
    endif

    "resize automatically
    au VimResized * execute "normal! \<c-w>="

    au VimEnter * silent! au! FileExplorer

    au BufReadPost * call functions#LineReturn()

    if dein#tap('projectroot')
        au BufEnter * call functions#AutoCDtoProjectRoot()
    endif

augroup END
