function! lazy#LoadDjango()
    if(filereadable(expand(projectroot#guess() . '/manage.py')))
        call plug#load('pony')
    endif
endfunction

function! lazy#LoadGit()
    if isdirectory(expand(projectroot#guess() . '/.git'))
        call plug#load('fugitive', 'gitgutter', 'nerdtree-git')
    endif
endfunction

function! lazy#LoadAngular()
    if filereadable(expand(projectroot#guess() . '/angular-cli.json'))
        call plug#load('angular-cli')
    endif
endfunction

function! lazy#LoadLvimrc()
    if filereadable(expand(projectroot#guess() . '/.lvimrc'))
        call plug#load('localvimrc')
    endif
endfunction

function! lazy#LoadEditorconfig()
    if filereadable(expand(projectroot#guess() . '/.editorconfig'))
        call plug#load('editorconfig')
    endif
endfunction

function! lazy#LoadNERDTree()
    if isdirectory(expand('<amatch>'))
        call plug#load('nerdtree')
    endif
endfunction
