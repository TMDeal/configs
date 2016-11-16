setlocal shiftwidth=2
setlocal softtabstop=2
setlocal tabstop=2

if functions#PluginExists('jsdoc')
    nnoremap <buffer><silent> <Leader>md :JsDoc<cr>
endif
