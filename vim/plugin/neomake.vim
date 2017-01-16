if functions#PluginExists('neomake')
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
    " let g:neomake_typescript_tsc_maker={
    "             \ 'args': ['--noEmit'],
    "             \ 'errorformat':
    "             \ '%E%f %#(%l\,%c): error %m,' .
    "             \ '%E%f %#(%l\,%c): %m,' .
    "             \ '%Eerror %m,' .
    "             \ '%C%\s%\+%m'
    "             \ }

    let g:neomake_c_enabled_makers=['clang']

    let g:neomake_tex_enabled_makers=['chktex']

    let g:neomake_python_enabled_makers=['flake8']
    let g:neomake_python_flake8_args=['--format=default', '--ignore=F403,F401,W391', '--max-line-length=100']

    let g:neomake_cpp_enable_makers=['clang++']
    let g:neomake_cpp_clang_args=['-I../include', '-I./include', '-std=c++1y', '-fsyntax-only', '-Wall', '-Wextra']

    let g:neomake_sh_enable_makers=['shellcheck']
    let g:neomake_sh_shellcheck_args=['-x']
endif
