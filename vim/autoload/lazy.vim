function! lazy#LoadDjango()
    if(filereadable(expand(projectroot#guess() . '/manage.py')))
        call plug#load('pony')
    endif
endfunction

function! lazy#LoadGit()
    if isdirectory(expand(projectroot#guess() . '/.git'))
        call plug#load('fugitive', 'gitgutter')
    endif
endfunction
