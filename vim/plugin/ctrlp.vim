if functions#PluginExists('ctrlp')
    nnoremap <silent> <Leader>p :CtrlP<cr>

    let g:ctrlp_map = ''
    let g:ctrlp_cache_dir=$EDITOR_ROOT . '/tmp/cache/ctrlp'
    let g:ctrlp_clear_cache_on_exit=0
    let g:ctrlp_regexp=0
    let g:ctrlp_root_markers=g:root_markers
    let g:ctrlp_show_hidden=1
    let g:ctrlp_max_files=10000
    let g:ctrlp_max_depth=40
    let g:ctrlp_open_new_file='v'
    let g:ctrlp_arg_map=1
    let g:ctrlp_follow_symlinks=1
    let g:ctrlp_lazy_update=0

    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
                \ }
endif
