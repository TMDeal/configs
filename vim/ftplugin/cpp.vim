"generate doxygen docstrings
nnoremap <buffer><silent> <Leader>md :Dox<cr>

"generate header gaurds
nnoremap <buffer><silent> <Leader>mg :HeaderguardAdd<cr>

"open complimentary file here
nnoremap <buffer><silent> <Leader>mfh :FSHere<cr>

"open complimentary file in right vertical split
nnoremap <buffer><silent> <Leader>mfr :FSSplitRight<cr>

"open complimentary file in left vertical split
nnoremap <buffer><silent> <Leader>mfl :FSSplitLeft<cr>

"generate implementation files
nnoremap <buffer><silent> <Leader>mpp :set paste<cr>i<c-r>=protodef#ReturnSkeletonsFromPrototypesForCurrentBuffer({'includeNS' : 0})<cr><esc>='[:set nopaste<cr>:retab<cr>
nnoremap <buffer><silent> <Leader>mpn :set paste<cr>i<c-r>=protodef#ReturnSkeletonsFromPrototypesForCurrentBuffer({})<cr><esc>='[:set nopaste<cr>:retab<cr>
