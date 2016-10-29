augroup my_autocmds

    au!

    "Lint
    au! VimLeave * let g:neomake_verbose=0
    au BufWritePost * Neomake
    au User NeomakeFinished call lightline#update()

    "resize automatically
    au VimResized * execute "normal! \<c-w>="

    "Lazy load plugins
    au BufReadPre * call lazy#LoadGit()
    au BufReadPre * call lazy#LoadDjango()

    au BufReadPost * call functions#LineReturn()
    au BufEnter * call functions#AutoCDtoProjectRoot()

augroup END
