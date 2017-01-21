if functions#PluginExists('deoplete')
    let g:deoplete#omni_patterns={}
    let g:deoplete#omni#input_patterns={}
    let g:deoplete#omni#functions={}
    let g:deoplete#sources={}

    let g:deoplete#enable_at_startup=1
    let g:deoplete#enable_smart_case=0
    let g:deoplete#max_menu_width=80

    let g:tern_request_timeout=1
    let g:tern_show_signature_in_pum=0
    let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
    let g:tern#command=["tern"]
    let g:tern#arguments=["--persistent"]

    let g:deoplete#sources#clang#libclang_path='/usr/lib/libclang.so'
    let g:deoplete#sources#clang#clang_header='/usr/lib/clang'
    let g:deoplete#sources#clang#std#cpp='c++1y'
    let g:deoplete#sources#clang#flags=['-I./include', '-I../include']

    call deoplete#custom#set('_', 'matchers', 
                \['matcher_full_fuzzy', 'matcher_length'])
    call deoplete#custom#set('_', 'converters',
                \['converter_remove_overlap', 'converter_truncate_abbr', 'converter_truncate_menu', 'converter_remove_paren'])

    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    inoremap <expr><S-tab> pumvisible() ? "\<c-p>" : "\<S-tab>"
    inoremap <expr><C-g> deoplete#undo_completion()
    inoremap <expr><C-l> deoplete#refresh()
    " inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
    " inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"
    "
    let g:deoplete#omni#functions.javascript=[
                \ 'tern#Complete',
                \ 'jspc#omni'
                \]

    let g:deoplete#omni#input_patterns.php='\w+|[^. \t]->\w*|\w+::\w*'
    let g:deoplete#omni#input_patterns.tex = '\\(?:'
                \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
                \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
                \ . '|hyperref\s*\[[^]]*'
                \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
                \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
                \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
                \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
                \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
                \ .')'

    if has("gui_running")
        inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
    else
        inoremap <silent><expr><C-@> deoplete#mappings#manual_complete()
    endif
endif

if functions#PluginExists('YouCompleteMe')
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
    let g:ycm_seed_identifiers_with_syntax=1
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

if functions#PluginExists('ultisnips')
    nnoremap <silent> <Leader>es :UltiSnipsEdit<cr>

    let g:UltiSnipsExpandTrigger='<C-k>'
    let g:UltiSnipsJumpForwardTrigger='<C-k>'
    let g:UltiSnipsJumpBackwardTrigger='<C-j>'
    let g:UltiSnipsSnippetDirectories=['ultisnips']
endif

if functions#PluginExists('delimitMate')
    let g:delimitMate_matchpairs="(:),[:],{:}"
    let g:delimitMate_quotes="\" ' `"
    let g:delimitMate_nesting_quotes=['"']
    let g:delimitMate_expand_cr=1
    let g:delimitMate_expand_space=1
    let g:delimitMate_expand_inside_quotes = 1
    let g:delimitMate_jump_expansion=1
    let g:delimitMate_balance_matchpairs=1
endif
