if functions#PluginExists('YouCompleteMe')
    let g:ycm_global_ycm_extra_conf=$EDITOR_ROOT . '/.ycm_extra_conf.py'
    let g:ycm_extra_conf_globlist=['~/my-workspace/*']
    let g:ycm_add_preview_to_completeopt=0
    let g:ycm_allow_changing_updatetime=0
    let g:ycm_auto_trigger=1
    let g:ycm_autoclose_preview_window_after_insertion=1
    let g:ycm_autoclose_preview_window_after_completion=0
    let g:ycm_key_detailed_diagnostics=''
    let g:ycm_enable_diagnostic_signs=0
    let g:ycm_enable_diagnostic_highlighting=0
    let g:ycm_python_binary_path = '/usr/bin/python3'
    let g:ycm_collect_identifiers_from_tags_files=1

    let g:ycm_semantic_triggers =  {
                \   'c' : ['->', '.'],
                \   'cpp' : ['->', '.', '::'],
                \   'java' : ['.'],
                \   'python' : ['.', 'from ', 'import '],
                \   'php' : ['.', '->', '::'],
                \   'javascript' : ['.'],
                \   'typescript' : ['.'],
                \   'css' : ['.'],
                \   'perl' : ['->'],
                \   'ruby' : ['.', '::'],
                \   'lua' : ['.', ':'],
                \ }
endif
