if has('nvim')
    :tnoremap <Esc> <C-\><C-n>
    nnoremap <Leader>o :below 10sp term://$SHELL<cr>i
endif

"delete without saving to default register
nnoremap <Leader>dd "_d
nnoremap <Leader>dc "_c
nnoremap <Leader>dD "_D
nnoremap <Leader>dC "_C
nnoremap <Leader>dx "_x

nnoremap <silent> <Leader>- :split<cr>
nnoremap <silent> <Leader>\ :vsplit<cr>

"delete trailing whitespace
nnoremap <silent> <Leader>dw :%s/\s\+$//<cr>

nnoremap <silent> <Leader>T :tabnew<cr>

nnoremap <silent> <Leader>ev :vsplit $MYVIMRC<cr>
nnoremap <silent> <Leader>sv :source $MYVIMRC<cr> :nohl<cr>
