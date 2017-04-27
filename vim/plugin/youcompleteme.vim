if dein#is_sourced('YouCompleteMe')
    let g:ycm_global_ycm_extra_conf=$EDITOR_ROOT . '/.ycm_extra_conf.py'
    let g:ycm_add_preview_to_completeopt=0
    let g:ycm_allow_changing_updatetime=0
    let g:ycm_auto_trigger=1
    let g:ycm_autoclose_preview_window_after_insertion=1
    let g:ycm_autoclose_preview_window_after_completion=0
    let g:ycm_key_detailed_diagnostics=''
    let g:ycm_enable_diagnostic_signs=0
    let g:ycm_enable_diagnostic_highlighting=0
    let g:ycm_echo_current_diagnostic=0
    let g:ycm_python_binary_path='python'
    let g:ycm_collect_identifiers_from_tags_files=1
    let g:ycm_extra_conf_vim_data=[]

    let g:ycm_semantic_triggers =  {
                \   'c' : ['->', '.'],
                \   'ocaml' : ['.', '#'],
                \   'cpp' : ['->', '.', '::'],
                \   'perl' : ['->'],
                \   'php' : ['->', '::'],
                \   'cs,java,javascript,typescript,d,perl6,scala,vb,elixir,go' : ['.'],
                \   'python': ['.', 'from ', 'import '],
                \   'ruby' : ['.', '::'],
                \   'lua' : ['.', ':'],
                \   'erlang' : [':'],
                \ }
endif
