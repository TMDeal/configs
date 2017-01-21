if functions#PluginExists('tcomment')
    let g:tcommentMapLeader1=''
    let g:tcommentMapLeader2=''
endif

if functions#PluginExists('protodef')
    let g:protodefprotogetter=$EDITOR_ROOT . '/bundle/vim-protodef/pullproto.pl'
    let g:disable_protodef_mapping=1
    let g:disable_protodef_sorting=1
endif

if functions#PluginExists('taboo')
    let g:taboo_tabline=1
    let g:taboo_tab_format='[%N]%f%m'
endif

if functions#PluginExists('yankring')
    let g:yankring_history_dir=$EDITOR_ROOT . '/tmp'
    let g:yankring_history_file='yankring'
endif

if functions#PluginExists('slime')
    let g:slime_target="tmux"
    let g:slime_paste_file=$EDITOR_ROOT . '/.slime_paste'
    let g:slime_default_config={"socket_name": "default", "target_pane": "1.2"}
    let g:slime_python_ipython=1
endif

if functions#PluginExists('eunuch')
    nnoremap <silent> <Leader>Sw  :SudoWrite<cr>
    nnoremap <Leader>Se  :SudoEdit<space>
endif

if functions#PluginExists('grammarous')
    nmap ]g <Plug>(grammarous-move-to-next-error)
    nmap [g <Plug>(grammarous-move-to-previous-error)
endif
