nnoremap H ^
nnoremap L $
nnoremap j gj
nnoremap k gk

set pastetoggle=<F10>

"Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <silent> - :silent edit <C-R>=empty(expand('%')) ? '.' : fnameescape(expand('%:p:h'))<CR><CR>

"file search/replace template
nnoremap gs :%s//c<left><left>

"removes highlighting.
nnoremap <silent> \ :nohl<cr>

nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j 
nnoremap <C-h> <C-w>h 
nnoremap <C-l> <C-w>l 

nnoremap Y y$
nnoremap zo za
nnoremap <cr> o<esc>

nnoremap <silent> ]l :lnext<cr>
nnoremap <silent> [l :lprevious<cr>
nnoremap <silent> ]q :cnext<cr>
nnoremap <silent> [q :cprevious<cr>

nnoremap <silent> ]t :tabnext<cr>
nnoremap <silent> [t :tabprevious<cr>
