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

nnoremap <silent> <Leader>qq  :q<cr>
nnoremap <silent> <Leader>qn  :q!<cr>
nnoremap <silent> <Leader>qa  :qa<cr>
nnoremap <silent> <Leader>qan :qa!<cr>
nnoremap <silent> <Leader>ww  :w<cr>
nnoremap <silent> <Leader>wn  :w!<cr>
nnoremap <silent> <Leader>wa  :wa<cr>
nnoremap <silent> <Leader>wan :wa!<cr>
nnoremap <silent> <Leader>wq  :wqa<cr>
nnoremap <silent> <Leader>wqn :wqa!<cr>

nnoremap <silent> <Leader>Sw  :SudoWrite<cr>
nnoremap <Leader>Se  :SudoEdit<space>

"delete trailing whitespace
nnoremap <silent> <Leader>dw :%s/\s\+$//<cr>

nnoremap <silent> <Leader>T :tabnew<cr>

nnoremap <silent> <Leader>ev :vsplit $MYVIMRC<cr>
nnoremap <silent> <Leader>sv :source $MYVIMRC<cr> :nohl<cr>
nnoremap <silent> <Leader>es :UltiSnipsEdit<cr>
nnoremap <silent> <Leader>p :CtrlP<cr>
nnoremap <silent> <Leader>b :BuffergatorToggle<cr>
