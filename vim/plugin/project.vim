if functions#PluginExists('projectroot')
    let g:rootmarkers=g:root_markers
endif

if functions#PluginExists('localvimrc')
    let g:localvimrc_name=".lvimrc"
    let g:localvimrc_event=['BufWinEnter', 'BufNewFile', 'BufRead']
    let g:localvimrc_persistent=2
    let g:localvimrc_persistence_file=$EDITOR_ROOT . "/.localvimrc_persistent"
endif

if functions#PluginExists('editorconfig')
    let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
endif
