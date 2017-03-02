if dein#tap('python-mode')
    let g:pymode_python='python3'
    let g:pymode_syntax_all=1
    let g:pymode_trim_whitespaces=1
    let g:pymode_indent=1
    let g:pymode_motion=1
    let g:pymode_doc=1
    let g:pymode_virtualenv=0
    let g:pymode_rope=0
    let g:pymode_rope_ropefolder='.ropeproject'
    let g:pymode_run=0
    let g:pymode_breakpoint=0
    let g:pymode_breakpoint_cmd=''
    let g:pymode_folding=0
    let g:pymode_lint=0
    let g:pymode_rope_completion=0
    let g:pymode_rope_lookup_project=0

    let g:pymode_rope_show_doc_bind          = ''
    let g:pymode_doc_bind                    = 'K'
    let g:pymode_rope_goto_definition_bind   = '<Leader>mg'
    let g:pymode_rope_autoimport_bind        = '<Leader>mi'
    let g:pymode_rope_organize_imports_bind  = '<Leader>mio'
    let g:pymode_rope_rename_bind            = '<Leader>mrr'
    let g:pymode_rope_rename_module_bind     = '<Leader>mrm'
    let g:pymode_rope_change_signature_bind  = '<Leader>mrs'
    let g:pymode_rope_module_to_package_bind = '<Leader>mrp'
    let g:pymode_rope_use_function_bind      = '<Leader>mru'
    let g:pymode_rope_move_bind              = '<Leader>mrv'
    let g:pymode_rope_extract_method_bind    = '<Leader>mem'
    let g:pymode_rope_extract_variable_bind  = '<Leader>mev'
    let g:pymode_run_bind                    = '<Leader>mr'
    let g:pymode_breakpoint_bind             = '<Leader>mb'
endif

if dein#tap('jedi')
    let g:jedi#completions_enabled=0
    let g:jedi#show_call_signatures=2
    let g:jedi#show_call_signatures_delay=0

    let g:jedi#completions_command=''
    let g:jedi#goto_command=''
    let g:jedi#goto_assignments_command=''
    let g:jedi#goto_definitions_command=''
    let g:jedi#documentation_command=''
    let g:jedi#rename_command=''
    let g:jedi#usages_command=''
endif

if dein#tap('pydocstring')
    nnoremap <buffer><silent> <Leader>md :Pydocstring<cr>
    let g:pydocstring_templates_dir=$EDITOR_ROOT . '/templates/'
    let g:pydocstring_enable_mapping=0
endif
