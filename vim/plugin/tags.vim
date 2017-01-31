if functions#PluginExists('tagbar')
    nnoremap <silent> <F3> :TagbarToggle<cr>

    let g:tagbar_autofocus=1
    let g:tagbar_compact=1
    let g:tagbar_show_linenumbers=1
endif

if functions#PluginExists('gutentags')
    let g:gutentags_project_root=g:root_markers
    let g:gutentags_cache_dir=$EDITOR_ROOT . "/tmp/tags"
endif