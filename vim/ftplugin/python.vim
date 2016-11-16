if functions#PluginExists('python-mode')
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

if functions#PluginExists('pydocstring')
    nnoremap <buffer><silent> <Leader>md :Pydocstring<cr>
endif
