if dein#tap('ale')
    let g:ale_lint_delay=200
    let g:ale_lint_on_text_changed=1
    let g:ale_lint_on_enter=1
    let g:ale_set_highlights=0
    let g:ale_lint_on_save=0
    let g:ale_set_loclist=1
    let g:ale_set_signs=1
    let g:ale_sign_column_always=0
    let g:ale_echo_cursor=1

    " let g:ale_sign_error='>>'
    " let g:ale_sign_warning='--'
    let g:ale_sign_error='✖'
    let g:ale_sign_warning='⚠'

    let g:ale_statusline_format=['✖ %d', '⚠ %d', '⬥ OK']

    let g:ale_echo_msg_error_str='E'
    let g:ale_echo_msg_warning_str='W'
    let g:ale_echo_msg_format='[%linter%] %s [%severity%]'

    let g:ale_linters={
                \   'c': ['gcc'],
                \   'cpp': ['g++'],
                \   'tex': ['chktex'],
                \   'python': ['flake8'],
                \   'javascript': ['eslint']
                \}

    let g:ale_python_flake8_args='--format=default --ignore=F403,F401,W391,E125 --max-line-length=100'
    let g:ale_cpp_gcc_options='-I../include -I./include -std=c++1y -fsyntax-only -Wall -Wextra'
    let g:ale_c_gcc_options='-I../include -I./include -std=c11 -fsyntax-only -Wall -Wextra'
endif

if dein#tap('neomake')
    let g:neomake_list_height=5
    let g:neomake_open_list=0
    let g:neomake_place_signs=1
    let g:neomake_echo_current_error=1
    let g:neomake_verbose=1
    let g:neomake_logfile=$EDITOR_ROOT . '/.neomake_log'

    let g:neomake_error_sign = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
    let g:neomake_warning_sign = {'text': '⚠', 'texthl': 'NeomakeWarningSign'}
    let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
    let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}

    let g:neomake_javascript_enabled_makers=['eslint']

    let g:neomake_typescript_enabled_makers=['tsc']
    let g:neomake_c_enabled_makers=['clang']

    let g:neomake_tex_enabled_makers=['chktex']

    let g:neomake_python_enabled_makers=['flake8']
    let g:neomake_python_flake8_args=['--format=default', '--ignore=F403,F401,W391', '--max-line-length=100']

    let g:neomake_cpp_enable_makers=['clang++']
    let g:neomake_cpp_clang_args=['-I../include', '-I./include', '-std=c++1y', '-fsyntax-only', '-Wall', '-Wextra']

    let g:neomake_sh_enable_makers=['shellcheck']
    let g:neomake_sh_shellcheck_args=['-x']
endif
