if functions#PluginExists('fugitive')
    nnoremap <silent> <Leader>ga :Git add %:p<CR><CR>
    nnoremap <silent> <Leader>gs :Gstatus<CR>
    nnoremap <silent> <Leader>gc :Gcommit -v -q<CR>
    nnoremap <silent> <Leader>gt :Gcommit -v -q %:p<CR>
    nnoremap <silent> <Leader>gd :Gdiff<CR>
    nnoremap <silent> <Leader>ge :Gedit<CR>
    nnoremap <silent> <Leader>gr :Gread<CR>
    nnoremap <silent> <Leader>gw :Gwrite<CR><CR>
    nnoremap <silent> <Leader>gl :silent! Glog<CR>:bot copen<CR>
    nnoremap <silent> <Leader>gp :Ggrep<Space>
    nnoremap <silent> <Leader>gm :Gmove<Space>
    nnoremap <silent> <Leader>gb :Git branch<Space>
    nnoremap <silent> <Leader>go :Git checkout<Space>
endif
