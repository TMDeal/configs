command! Ev e $MYVIMRC
command! Sv source $MYVIMRC
if executable('ctags')
    command! MakeTags !ctags -R .
endif
command! -nargs=1 -complete=customlist,functions#EditInCurrentDirCompletion E call functions#EditInCurrentDir(<f-args>)
