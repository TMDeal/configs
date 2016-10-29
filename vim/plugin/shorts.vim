"Web{{{
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"
"}}}
"latex-live-preview{{{
let g:livepreview_previewer='zathura'
"}}}
"ListToggle{{{
let g:lt_location_list_toggle_map='<leader>l'
let g:lt_quickfix_list_toggle_map='<leader>q'
"}}}
"Ultisnips{{{
let g:UltiSnipsExpandTrigger='<C-k>'
let g:UltiSnipsJumpForwardTrigger='<C-k>'
let g:UltiSnipsJumpBackwardTrigger='<C-j>'
let g:UltiSnipsSnippetDirectories=['ultisnips']
"}}}
"closetag{{{
let g:closetag_filenames="*.html,*.php,*.xhtml,*.xml,*.jsx,*.js,*.hbs,*.handlebars"
"}}}
"autotag{{{
let g:autotagCtagsCmd='ctags'
"}}}
"vim-Protodef{{{
let g:protodefprotogetter=$EDITOR_ROOT . '/bundle/vim-protodef/pullproto.pl'
let g:disable_protodef_mapping=1
let g:disable_protodef_sorting=1
"}}}
"ListToggle{{{
let g:lt_height=5
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
"}}}
"ProjectRoot{{{
let g:rootmarkers=g:root_markers
"}}}
"Pydocstring{{{
let g:pydocstring_templates_dir=$EDITOR_ROOT . '/templates/'
let g:pydocstring_enable_mapping=0
"}}}
"tcomment{{{
let g:tcommentMapLeader1=''
let g:tcommentMapLeader2=''
"}}}
"Colorizer{{{
let g:colorizer_nomap=1
"}}}
"Buffergator{{{
let g:buffergator_suppress_keymaps=0
"}}}
"Taboo{{{
let g:taboo_tabline=1
let g:taboo_tab_format='[%N]%f%m'
"}}}
"Yankring{{{
let g:yankring_history_dir=$EDITOR_ROOT . '/tmp'
let g:yankring_history_file='yankring'
" let g:yankring_replace_n_pkey='<C-p>'
" let g:yankring_replace_n_nkey='<C-n>'
"}}}
"Slime{{{
let g:slime_target="tmux"
let g:slime_paste_file=$EDITOR_ROOT . '/.slime_paste'
let g:slime_default_config={"socket_name": "default", "target_pane": "1.2"}
let g:slime_python_ipython=1
"}}}
"Localvimrc{{{
let g:localvimrc_name=".lvimrc"
let g:localvimrc_persistent=2
let g:localvimrc_persistence_file=$EDITOR_ROOT . "/.localvimrc_persistent"
"}}}
"Doxygen{{{
let g:DoxygenToolkit_authorName='Trent Deal'
let g:DoxygenToolkit_licenseTag=''
let g:DoxygenToolkit_briefTag_pre="@Brief  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
"}}}
"vimtex{{{
let g:vimtex_enabled=1
let g:vimtex_fold_enabled=0
let g:vimtex_indent_enabled=1
let g:vimtex_indent_bib_enabled=1
let g:vimtex_mappings_enabled=0
let g:vimtex_view_general_viewer='zathura'
let g:tex_flavor='latex'
"}}}
"MatchTagAlways{{{
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'php' : 1,
    \ 'htmldjango' : 1,
    \}
"}}}
"JSDoc{{{
let g:jsdoc_allow_input_prompt=1
let g:jsdoc_input_description=1
let g:jsdoc_enable_es6=1
"}}}
"Delimitmate{{{
let g:delimitMate_matchpairs="(:),[:],{:}"
let g:delimitMate_quotes="\" ' `"
let g:delimitMate_nesting_quotes=['"']
let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1
let g:delimitMate_expand_inside_quotes = 1
let g:delimitMate_jump_expansion=1
let g:delimitMate_balance_matchpairs=1
"}}}
