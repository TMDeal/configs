command! Ev e $MYVIMRC
command! Sv source $MYVIMRC
command! DeinClean call map(dein#check_clean(), "delete(v:val, 'rf')")
if executable('ctags')
    command! MakeTags !ctags -R .
endif
