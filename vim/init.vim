"init.vim
"Auther: Trent Deal
"Email: Trent.Deal@gmail.com
"GitHub: https://github.com/TMDeal
"Init======================================================================={{{
if !has('nvim')
    set nocompatible
    filetype plugin indent on
    syntax on
endif

nnoremap <SPACE> <NOP>
let g:mapleader="\<SPACE>"
let g:maplocalleader="\<SPACE>"

if has('nvim')
    let $EDITOR_ROOT=expand("$HOME/.config/nvim")
else
    let $EDITOR_ROOT=expand("$HOME/.vim")
endif

if !filereadable(expand($EDITOR_ROOT . '/autoload/plug.vim'))
    !curl -fLo $EDITOR_ROOT/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    call mkdir(expand($EDITOR_ROOT . '/bundle'), "p")
    au VimEnter * PlugInstall | source $MYVIMRC
endif

for dir in ['.tags', 'templates', '.cache', 'tmp/backup', 'tmp/undo', 'tmp/swap']
    if !isdirectory(expand($EDITOR_ROOT . '/' . dir))
        call mkdir(expand($EDITOR_ROOT . '/' . dir), "p")
    endif
endfor

"}}}
"Plugins===================================================================={{{

function! MaybeLoad(condition, ...) "{{{
  let opts = get(a:000, 0, {})
  return a:condition ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction
"}}}
function! BuildYCM(info) "{{{
    let install_command='python2 install.py'

    if executable('clang')
        if system("clang --version | grep 3.[8-9] >/dev/null && echo $?")==0 
            let install_command.=' --system-libclang'
        endif
        let install_command.=' --clang-completer'
    endif

    let args_list=''
    let args_info={
                \'--omnisharp-completer': ['mono'],
                \'--gocode-completer': ['go'],
                \'--tern-completer': ['node', 'npm'],
                \'--racer-completer': ['rustc', 'cargo'],
                \}

    for [completer, executables] in items(args_info)
        let can_install_completer=1
        for exe in executables
            if !executable(exe)
                let can_install_completer=0
                break 
            endif
        endfor
        if can_install_completer==1
            let args_list .= ' ' . completer
        endif
    endfor

    let install_command.=args_list

    if a:info.status == 'installed' || a:info.force
        execute "!" . install_command
    endif
endfunction "}}}

call g:plug#begin(expand('$EDITOR_ROOT/bundle'))
"Code======================================================================={{{

"python
Plug 'klen/python-mode', {'for': 'python'}
Plug 'davidhalter/jedi-vim', {'for': 'python', 'as': 'jedi'}
Plug 'heavenshell/vim-pydocstring', {'for': 'python', 'as': 'pydocstring'}
Plug 'tweekmonster/django-plus.vim', {'on': [], 'as': 'django-plus'}
Plug 'jmcomets/vim-pony', {'on': [], 'as': 'pony'}
" Plug 'tweekmonster/impsort.vim', {'as': 'impsort'}

"C/C++
Plug 'vim-scripts/DoxygenToolkit.vim', {'for': ['c', 'cpp'], 'as': 'DoxygenToolkit'}
Plug 'derekwyatt/vim-fswitch', {'for': ['c', 'cpp'], 'as': 'fswitch'}
Plug 'drmikehenry/vim-headerguard', {'for': ['c', 'cpp'], 'as': 'headerguard'}
Plug 'derekwyatt/vim-protodef', {'for': ['c', 'cpp'], 'as': 'protodef'}
Plug 'richq/vim-cmake-completion', {'for': 'cmake', 'as': 'cmake-completion'}

"TeX
Plug 'lervag/vimtex', {'for': 'tex'}

"Web
Plug 'vim-scripts/Emmet.vim', {'for': ['html', 'htmldjango', 'php', 'javascript', 'jinja'], 'as': 'Emmet'}
Plug 'alvan/vim-closetag', {'for': ['html', 'htmldjango', 'php', 'javascript', 'jinja'], 'as': 'closetag'}

"Lint
Plug 'neomake/neomake', {'on': 'Neomake'}

"filetypes
let g:polyglot_disabled=['jsx']
Plug 'sheerun/vim-polyglot', {'as': 'polyglot'}
Plug 'othree/javascript-libraries-syntax.vim', {'for': 'javascript', 'as': 'javascript-libraries-syntax'}

"}}}
"Utility===================================================================={{{

Plug 'Valloric/YouCompleteMe', MaybeLoad(has('python'), {'do': function('BuildYCM'), 'on': []})
Plug 'SirVer/ultisnips', MaybeLoad(has('python'))
Plug 'ludovicchabant/vim-gutentags', MaybeLoad(executable('ctags'), {'for': ['c', 'cpp'], 'as': 'gutentags'})
Plug 'majutsushi/tagbar', MaybeLoad(executable('ctags'), {'on': 'TagbarToggle'})
Plug 'jeetsukumaran/vim-buffergator', {'on': ['BuffergatorToggle', 'BuffergatorMruCycleNext', 'BuffergatorMruCyclePrev'], 'as': 'buffergator'}
Plug 'tpope/vim-vinegar', {'as': 'vinegar'}
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'ctrlpvim/ctrlp.vim', {'on': 'CtrlP', 'as': 'ctrlp'}
Plug 'vim-scripts/YankRing.vim', {'as': 'yankring'}
Plug 'christoomey/vim-tmux-navigator', {'as': 'tmux-navigator'}
Plug 'jpalardy/vim-slime', {'as': 'slime'}
Plug 'Valloric/ListToggle'

"}}}
"Extra======================================================================{{{
Plug 'dbakker/vim-projectroot', {'as': 'projectroot'}
Plug 'tpope/vim-eunuch', {'as': 'eunuch'}
Plug 'tomtom/tcomment_vim', {'as': 'tcomment'}
Plug 'henrik/vim-qargs', {'as': 'qargs'}
Plug 'embear/vim-localvimrc', {'as': 'localvimrc'}
Plug 'Raimondi/delimitMate'
Plug 'lilydjwg/colorizer'
Plug 'EinfachToll/DidYouMean'

"}}}
"Vim Stuff=================================================================={{{
Plug 'gcmt/taboo.vim', {'as': 'taboo'}
Plug 'tpope/vim-surround', {'as': 'surround'}
Plug 'tpope/vim-repeat', {'as': 'repeat'}
Plug 'edsono/vim-matchit', {'as': 'matchit'}
Plug 'wellle/targets.vim', {'as': 'targets'}

Plug 'kana/vim-textobj-user'
            \|Plug 'mjbrownie/django-template-textobjects', {'for': ['python', 'htmldjango', 'jinja']}

"}}}
"Git========================================================================{{{
Plug 'tpope/vim-fugitive', {'on': [], 'as': 'fugitive'}
Plug 'airblade/vim-gitgutter', {'on': [], 'as': 'gitgutter'}

"}}}
"Visuals===================================================================={{{
Plug 'nanotech/jellybeans.vim', {'as': 'jellybeans'}
Plug 'itchyny/lightline.vim', {'as': 'lightline'}

"}}}
call g:plug#end()

"}}}
"Settings==================================================================={{{

"Utils======================================================================{{{

"Root======================================================================={{{
let $PROJECT_ROOT=projectroot#guess()

augroup Reset_Root_DIR
    au!
    au BufReadPre * let $PROJECT_ROOT=projectroot#guess()
augroup END

"}}}
"Functions=================================================================={{{
"
function! TryToLoadDjango() "{{{
    if(filereadable(expand($PROJECT_ROOT . '/manage.py')))
        call plug#load('vim-pony', 'django-plus')
    endif
endfunction
"}}}
function! TryToLoadGit() "{{{
    if isdirectory(expand($PROJECT_ROOT . '/.git'))
        call plug#load('fugitive', 'gitgutter')
    endif
endfunction
"}}}
function! AutoCDtoProjectRoot() "{{{
    try
        if &ft != 'help'
            ProjectRootCD
        endif
    catch
        "silently ignore invalid buffers
    endtry
endfun
"}}}

"
"}}}
"Augroups==================================================================={{{

"Filetype Settings=========================================================={{{

augroup Git
    au!
    au Filetype gitcommit set textwidth=72
    au Filetype gitcommit set spell
augroup END

augroup Web
    au!
    au BufEnter *.html setlocal sw=2 sts=2 ts=2
    au BufEnter *.pug setlocal sw=2 sts=2 ts=2
augroup END

augroup Tex
    au!
    au BufEnter *.tex setfiletype tex
augroup END

augroup Django
    au!
    au BufEnter $PROJECT_ROOT/*/templates/* setfiletype htmldjango
    au FileType htmldjango let b:surround_{char2nr("v")} = "{{ \r }}"
    au FileType htmldjango let b:surround_{char2nr("{")} = "{{ \r }}"
    au FileType htmldjango let b:surround_{char2nr("%")} = "{% \r %}"
    au FileType htmldjango let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
    au FileType htmldjango let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
    au FileType htmldjango let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
    au FileType htmldjango let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
    au FileType htmldjango let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"
    au FileType htmldjango inoremap {% {%  %}<left><left><left>
    "}
    "The above bracket fixes syntax highlighting, annoyingly enough
augroup END
"}}}
"CDToProjectRoot============================================================{{{

augroup Auto_CD_To_Project_Root
    au!
    au BufEnter * call AutoCDtoProjectRoot()
augroup END

"}}}
"Lint======================================================================={{{

augroup lint
    au!
    au BufWritePost * Neomake
    au User NeomakeFinished call lightline#update()
augroup END

"}}}
"Line Return================================================================{{{

" Make sure Vim returns to the same line when you reopen a file.
function! LineReturn()
    if line("'\"") > 0 && line("'\"") <= line("$") |
        execute 'normal! g`"zvzz' |
    endif
endfunction

augroup line_return
    au!
    au BufReadPost * call LineReturn()
augroup END

"}}}
"AutoResize Windows========================================================={{{

augroup window
    au!
    au VimResized * :wincmd =
augroup END

"}}}
"Lazy-Load=================================================================={{{

augroup Load_YCM
  autocmd!
  autocmd InsertEnter * call plug#load('YouCompleteMe')
                     \| autocmd! Load_YCM
augroup END

augroup Lazy_Load_Plugins
    au!
    au BufReadPre * call TryToLoadGit()
    au BufReadPre * call TryToLoadDjango()
augroup END

"}}}

"}}}

"}}}
"Plugins===================================================================={{{

"Shorts====================================================================={{{

"vim-Protodef
let g:protodefprotogetter=$EDITOR_ROOT . '/bundle/vim-protodef/pullproto.pl'
let g:disable_protodef_mapping=1
let g:disable_protodef_sorting=1

"ListToggle
let g:lt_height=5
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

"vinegar
nmap <F2> <Plug>VinegarVerticalSplitUp
nmap <F3> <Plug>VinegarSplitUp

"ProjectRoot
let g:rootmarkers=['.projectroot', '.git', 'manage.py', 'package.json', 'CMakeLists.txt', 'Makefile']

"Pydocstring
let g:pydocstring_templates_dir=$EDITOR_ROOT . '/templates/'
let g:pydocstring_enable_mapping=0

"tcomment
let g:tcommentMapLeader1=''
let g:tcommentMapLeader2=''

"Colorizer
let g:colorizer_nomap=1

"Buffergator
let g:buffergator_suppress_keymaps=0
nnoremap <Leader>b :BuffergatorToggle<cr>
nnoremap <silent> ]b :BuffergatorMruCyclePrev<cr>
nnoremap <silent> [b :BuffergatorMruCycleNext<cr>

"Taboo
let g:taboo_tabline=1
let g:taboo_tab_format='[%N]%f%m'

"}}}
"Ctrlp======================================================================{{{

let g:ctrlp_map = ''
nnoremap <silent> <Leader>p :CtrlP<cr>

let g:ctrlp_cache_dir=$EDITOR_ROOT . '/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_regexp=0
let g:ctrlp_root_markers=['.projectroot', '.git', 'manage.py', 'package.json', 'CMakeLists.txt', 'Makefile']
let g:ctrlp_show_hidden=1
let g:ctrlp_max_files=10000
let g:ctrlp_max_depth=40
let g:ctrlp_open_new_file='v'
let g:ctrlp_arg_map=1
let g:ctrlp_follow_symlinks=1
let g:ctrlp_lazy_update=0

"}}}
"MatchTagAlways============================================================={{{

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'php' : 1,
    \ 'htmldjango' : 1,
    \}

"}}}
"Gutentags=================================================================={{{

let g:gutentags_project_root=['.projectroot', '.git', 'manage.py', 'package.json', 'CMakeLists.txt', 'Makefile']
let g:gutentags_exclude=[]
let g:gutentags_cache_dir=$EDITOR_ROOT . '/.tags'

augroup SET_TAGS
   au!
   au BufEnter * set tags+=$PROJECT_ROOT/tags
augroup END

"}}}
"Yankring==================================================================={{{

let g:yankring_history_dir=$EDITOR_ROOT
let g:yankring_history_file='yankring'
let g:yankring_replace_n_pkey='<C-p>'
let g:yankring_replace_n_nkey='<C-n>'

"}}}
"Slime======================================================================{{{
"
let g:slime_target="tmux"
let g:slime_paste_file=$EDITOR_ROOT . '/.slime_paste'
let g:slime_default_config={"socket_name": "default", "target_pane": "1.2"}
let g:slime_python_ipython=1

"}}}
"Localvimrc================================================================={{{

let g:localvimrc_name=".lvimrc.vim"
let g:localvimrc_persistent=2
let g:localvimrc_persistence_file=$EDITOR_ROOT . "/.localvimrc_persistent"

"}}}
"Neomake===================================================================={{{

" let g:neomake_open_list=2
let g:neomake_list_height=6
let g:neomake_place_signs=1
let g:neomake_verbose=1
let g:neomake_logfile=$EDITOR_ROOT . '/.neomake_log'

let g:neomake_error_sign = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '⚠', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

let g:neomake_javascript_enable_makers=['jshint']
let g:neomake_vim_enable_makers=['vint']
let g:neomake_c_enable_makers=['clang']

let g:neomake_python_enable_makers=['flake8']
let g:neomake_python_flake8_args=['--format=default', '--ignore=F403', '--max-line-length=100']

let g:neomake_cpp_enable_makers=['clang++']
let g:neomake_cpp_clang_args=['-I../include', '-I./include', '-std=c++1y', '-fsyntax-only', '-Wall', '-Wextra']

let g:neomake_sh_enable_makers=['shellcheck']
let g:neomake_sh_shellcheck_args=['-x']

"}}}
"Tagbar====================================================================={{{

let g:tagbar_autofocus=1
let g:tagbar_compact=1
let g:tagbar_show_linenumbers=1

nnoremap <silent> <F4> :TagbarToggle<cr>

augroup Tagbar
    au!
    au filetype tagbar setlocal nolist
    au filetype tagbar nnoremap <buffer> L :vertical resize -5<cr>
    au filetype tagbar nnoremap <buffer> H :vertical resize +5<cr>
augroup END

"}}}
"Ultisnips=================================================================={{{

let g:UltiSnipsExpandTrigger='<C-k>'
let g:UltiSnipsJumpForwardTrigger='<C-k>'
let g:UltiSnipsJumpBackwardTrigger='<C-j>'

"}}}
"YouCompleteMe=============================================================={{{

let g:ycm_global_ycm_extra_conf=$EDITOR_ROOT . '/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist=['~/my-workspace/*']
let g:ycm_add_preview_to_completeopt=0
let g:ycm_allow_changing_updatetime=0
let g:ycm_auto_trigger=1
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_key_detailed_diagnostics=''
let g:ycm_enable_diagnostic_signs=0
let g:ycm_enable_diagnostic_highlighting=0
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_collect_identifiers_from_tags_files=1

let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.'],
            \   'cpp' : ['->', '.', '::'],
            \   'java' : ['.'],
            \   'python' : ['.', 'from ', 'import '],
            \   'php' : ['.', '->', '::'],
            \   'javascript' : ['.'],
            \   'typescript' : ['.'],
            \   'css' : ['.'],
            \   'perl' : ['->'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \ }

"}}}
"Jedi======================================================================={{{

let g:jedi#completions_enabled=0
let g:jedi#show_call_signatures=2
let g:jedi#show_call_signatures_delay=0

let g:jedi#completions_command=''
let g:jedi#goto_command=''
let g:jedi#goto_assignments_command=''
let g:jedi#goto_definitions_command=''
let g:jedi#documentation_command=''
let g:jedi#rename_command=''
let g:jedi#usages_command=''

"}}}
"Python-Mode================================================================{{{

let g:pymode_python='python3'
let g:pymode_syntax=1
let g:pymode_syntax_all=1
let g:pymode_trim_whitespaces=1
let g:pymode_indent=1
let g:pymode_motion=1
let g:pymode_doc=1
let g:pymode_virtualenv=1
let g:pymode_rope=0
let g:pymode_rope_ropefolder='.ropeproject'
let g:pymode_run=1
let g:pymode_breakpoint=1
let g:pymode_breakpoint_cmd=''
let g:pymode_folding=0
let g:pymode_lint=0
let g:pymode_rope_completion=0
let g:pymode_rope_lookup_project=0

"}}}
"Delimitmate================================================================{{{

let g:delimitMate_matchpairs="(:),[:],{:}"
let g:delimitMate_quotes="\" ' `"
let g:delimitMate_nesting_quotes=['"']
let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1
let g:delimitMate_expand_inside_quotes = 1
let g:delimitMate_jump_expansion=1
let g:delimitMate_balance_matchpairs=1

"}}}
"Doxygen===================================================================={{{

let g:DoxygenToolkit_authorName='Trent Deal'
let g:DoxygenToolkit_licenseTag=''
let g:DoxygenToolkit_briefTag_pre="@Brief  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "

"}}}
"Git========================================================================{{{

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

"}}}

"}}}
"General===================================================================={{{

let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'

if !has('nvim')
    set encoding=utf-8
    set backspace=indent,eol,start
    set history=10000
    set autoread
    set laststatus=2
    set mouse=a
    set t_vb=
    set t_u7=
endif

set completeopt-=preview
set number
set relativenumber
set sidescroll=1
set showcmd
set title
set autowrite
set hidden
set nowrap
set cmdheight=1
set mousehide
set noerrorbells
set novisualbell
set splitbelow
set splitright
set foldmethod=marker
set foldnestmax=10
set ruler
set shortmess+=c
set pumheight=10
set showtabline=2
set list
set listchars=extends:>,precedes:<,trail:.,tab:▸\ ,eol:¬

if has_key(g:plugs, 'lightline')
    set noshowmode
endif
"}}}
"Timeout===================================================================={{{
set timeout
set ttimeout
set timeoutlen=600
set ttimeoutlen=0
"}}}
"Indentation================================================================{{{
if !has('nvim')
    set autoindent
    set smarttab
endif
set expandtab
set shiftround
set shiftwidth=4
set softtabstop=4
set tabstop=4
"}}}
"Search====================================================================={{{
if !has('nvim')
    set hlsearch
    set incsearch
endif
set ignorecase
set smartcase
set gdefault
set showmatch
"}}}
"Backup====================================================================={{{
set undofile
set undoreload=10000
set undodir=$EDITOR_ROOT/tmp/undo//
set backupdir=$EDITOR_ROOT/tmp/backup//
set directory=$EDITOR_ROOT/tmp/swap//
set backup
set noswapfile
"}}}
"Wildmenu==================================================================={{{
set wildmenu
set wildmode=list:longest
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.mp3,*.wav,*.wav
set wildignore+=*.class,*.o,*.pyc
"}}}
"Colors====================================================================={{{

set background=dark
set t_Co=256

if has($TMUX) && has('termguicolors')
    set termguicolors
endif

"Colorscheme================================================================{{{

let g:jellybeans_use_lowcolor_black=0
let g:jellybeans_use_term_italics=0
let g:jellybeans_use_gui_italics=0
colorscheme jellybeans

"}}}
"Highlighting==============================================================={{{

fun! Transparency()
    hi Normal ctermbg=NONE guibg=NONE
    hi SignColumn ctermbg=NONE guibg=NONE
    hi NonText ctermbg=NONE guibg=NONE
    hi LineNr ctermbg=NONE guibg=NONE
    hi Folded ctermbg=NONE ctermfg=7 guibg=NONE guifg=#888888
    hi SpecialKey ctermbg=NONE guibg=NONE
endfun

hi TabLine ctermbg=0 ctermfg=15 guibg=#373b37
hi TabLineFill ctermbg=0 guibg=#373b37
hi TabLineSel ctermbg=8 ctermfg=15 guibg=#989898 guifg=#ffffff

hi Error NONE
hi ErrorMsg NONE

if !has('gui_running')
    call Transparency()
endif

"}}}

"}}}
"Gui========================================================================{{{

if has('gui_running')
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guifont=Monospace\ 11
endif

"}}}
"KeyMappings================================================================{{{

"NOP========================================================================{{{
"
inoremap <F1> <nop>
nnoremap <F1> <nop>
vnoremap <F1> <nop>
nnoremap Q <nop>
nnoremap q: <nop>

"}}}
"Commands==================================================================={{{
command! PU PlugUpdate | PlugUpgrade
"}}}
"Leaders===================================================================={{{
"
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

"}}}
"Movement/Extras============================================================{{{
"
nnoremap H ^
vnoremap H ^
nnoremap L $
vnoremap L $
nnoremap j gj
nnoremap k gk

set pastetoggle=<F10>

"Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

"file search/replace template
nnoremap gs :%s//c<left><left>

if !has_key(g:plugs, 'buffergator')
    nnoremap gb :ls<CR>:buffer<Space>
endif

"removes highlighting.
nnoremap <silent> \ :nohl<cr>

nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j 
nnoremap <C-h> <C-w>h 
nnoremap <C-l> <C-w>l 

"indent in visual mode and maintain cursor position
vnoremap <silent> > md>`d:delm d<cr>gv
vnoremap <silent> < md<`d:delm d<cr>gv

nnoremap Y y$
nnoremap zo za
nnoremap <cr> o<esc>

"}}}
"Pairs======================================================================{{{

"loclist and quickfix windows
nnoremap <silent> ]l :lnext<cr>
nnoremap <silent> [l :lprevious<cr>
nnoremap <silent> ]q :cnext<cr>
nnoremap <silent> [q :cprevious<cr>

nnoremap <silent> ]t :tabnext<cr>
nnoremap <silent> [t :tabprevious<cr>
"}}}
"Filetype Mappings=========================================================={{{

augroup C_CPP_Mappings
    au!
    "generate doxygen docstrings
    au filetype cpp,c nnoremap <buffer><silent> <Leader>md :Dox<cr>
    "generate header gaurds
    au filetype cpp,c nnoremap <buffer><silent> <Leader>mg :HeaderguardAdd<cr>
    "open complimentary file here
    au filetype cpp,c nnoremap <buffer><silent> <Leader>mfh :FSHere<cr>
    "open complimentary file in right vertical split
    au filetype cpp,c nnoremap <buffer><silent> <Leader>mfr :FSSplitRight<cr>
    "open complimentary file in left vertical split
    au filetype cpp,c nnoremap <buffer><silent> <Leader>mfl :FSSplitLeft<cr>
    "generate implementation files
    au filetype cpp,c nnoremap <buffer><silent> <Leader>mpp :set paste<cr>i<c-r>=protodef#ReturnSkeletonsFromPrototypesForCurrentBuffer({'includeNS' : 0})<cr><esc>='[:set nopaste<cr>:retab<cr>
    au filetype cpp,c nnoremap <buffer><silent> <Leader>mpn :set paste<cr>i<c-r>=protodef#ReturnSkeletonsFromPrototypesForCurrentBuffer({})<cr><esc>='[:set nopaste<cr>:retab<cr>
augroup END


"Python Mode
let g:pymode_rope_show_doc_bind          = ''
let g:pymode_doc_bind                    = 'K'

let g:pymode_rope_goto_definition_bind   = '<Leader>mg'
let g:pymode_rope_autoimport_bind        = '<Leader>mi'
let g:pymode_rope_organize_imports_bind  = '<Leader>mio'
let g:pymode_rope_rename_bind            = '<Leader>mrr'
let g:pymode_rope_rename_module_bind     = '<Leader>mrm'
let g:pymode_rope_change_signature_bind  = '<Leader>mrs'
let g:pymode_rope_module_to_package_bind = '<Leader>mrp'
let g:pymode_rope_use_function_bind      = '<Leader>mru'
let g:pymode_rope_move_bind              = '<Leader>mrv'
let g:pymode_rope_extract_method_bind    = '<Leader>mem'
let g:pymode_rope_extract_variable_bind  = '<Leader>mev'
let g:pymode_run_bind                    = '<Leader>mr'
let g:pymode_breakpoint_bind             = '<Leader>mb'

augroup Python_Mappings
    au!
    au filetype python,htmldjango nnoremap <buffer><silent> <Leader>md :Pydocstring<cr>
augroup END

"}}}

"}}}
"Statusline================================================================={{{

set titlestring=%t

if !has_key(g:plugs, 'lightline')
    "set statusline colors
    hi statusline ctermfg=149 ctermbg=0 cterm=NONE
    hi statusline guifg=Black guibg=Grey guisp=NONE
    "statusline setup
    set statusline=
    "display buffer number, modified flag, and Read-only flag
    set statusline+=[%n]%m%r
    "display filename
    set statusline+=\ [%t]
    "display filetype
    set statusline+=\ %y
    "display encoding
    set statusline+=\ [%{strlen(&fenc)?&fenc:&enc}]
    "display git branch and current file commit
    set statusline+=\ %{fugitive#statusline()}
    "split statusline from left to right
    set statusline+=%=
    "display line number
    set statusline+=\ [Line:\ %l\/%L]
    "display colum number
    set statusline+=\ [Column:\ %c]
    "display percentage through file
    set statusline+=\ [%P]
    "display lint
    set statusline+=\ %#ErrorMsg#%{neomake#statusline#LoclistStatus()}
else
    let g:lightline = {
                \ 'colorscheme': 'jellybeans',
                \ 'active': {
                \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
                \   'right': [ [ 'neomake', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
                \ },
                \ 'component_function': {
                \   'fugitive': 'LightLineFugitive',
                \   'filename': 'LightLineFilename',
                \   'fileformat': 'LightLineFileformat',
                \   'filetype': 'LightLineFiletype',
                \   'fileencoding': 'LightLineFileencoding',
                \   'mode': 'LightLineMode',
                \   'ctrlpmark': 'CtrlPMark',
                \ },
                \ 'component_expand': {
                \   'neomake' : 'LightlineNeomake',
                \ },
                \ 'component_type': {
                \   'neomake' : 'error',
                \ },
                \ 'subseparator': { 'left': '|', 'right': '|' }
                \ }

"Functions=================================================================={{{

function! LightLineModified() "{{{
    return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfun "}}}
function! LightLineReadonly() "{{{
    return &ft !~? 'help' && &readonly ? 'RO' : ''
endfun "}}}
function! LightLineFileformat() "{{{
    return winwidth(0) > 70 ? &fileformat : ''
endfun "}}}
function! LightLineFiletype() "{{{
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfun "}}}
function! LightLineFileencoding() "{{{
    return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfun "}}}
function! LightLineFugitive() "{{{
    try
        if expand('%:t') !~? 'Tagbar\|NERD' && exists('*fugitive#head')
            let mark = ''
            let _ = fugitive#head()
            return strlen(_) ? mark._ : ''
        endif
    catch
    endtry
    return ''
endfun "}}}
function! LightLineFilename() "{{{
    let fname = expand('%:t')
    return fname == 'ControlP' ? g:lightline.ctrlp_item :
                \ fname == '__Tagbar__' ? '' :
                \ fname =~ 'NERD_tree\|undotree*\|diffpanel*' ? '' :
                \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
                \ ('' != fname ? fname : '[No Name]') .
                \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfun "}}}
function! LightLineMode() "{{{
    let fname = expand('%:t')
    return fname == '__Tagbar__' ? 'Tagbar' :
                \ fname == 'ControlP' ? 'CtrlP' :
                \ fname =~ 'undotree*' ? 'Undotree' :
                \ fname =~ 'diffpanel*' ? 'Diffpanel' :
                \ fname =~ 'NERD_tree' ? 'NERDTree' :
                \ winwidth(0) > 60 ? lightline#mode() : ''
endfun "}}}
function! CtrlPMark() "{{{
    if expand('%:t') =~ 'ControlP'
        call lightline#link('iR'[g:lightline.ctrlp_regex])
        return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
                    \ , g:lightline.ctrlp_next], 0)
    else
        return ''
    endif
endfun "}}}
function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked) "{{{
    let g:lightline.ctrlp_regex = a:regex
    let g:lightline.ctrlp_prev = a:prev
    let g:lightline.ctrlp_item = a:item
    let g:lightline.ctrlp_next = a:next
    return lightline#statusline(0)
endfun "}}}
function! CtrlPStatusFunc_2(str) "{{{
    return lightline#statusline(0)
endfun "}}}
function! LightlineNeomake() "{{{
    let errors = neomake#statusline#LoclistCounts()
    let output = ''

    if has_key(errors, 'E')
        let output .= '[E:'.errors['E'].']'
    endif
    if has_key(errors, 'W')
        let output .= '[W:'.errors['W'].']'
    endif
    if has_key(errors, 'x')
        let output .= '[x:'.errors['x'].']'
    endif

    return output

endfun "}}}
function! TagbarStatusFunc(current, sort, fname, ...) abort "{{{
    let g:lightline.fname = a:fname
    return lightline#statusline(0)
endfun "}}}

"}}}
    let g:tagbar_status_func = 'TagbarStatusFunc'
    let g:ctrlp_status_func = {
                \ 'main': 'CtrlPStatusFunc_1',
                \ 'prog': 'CtrlPStatusFunc_2',
                \ }
endif

"}}}

 "}}}
