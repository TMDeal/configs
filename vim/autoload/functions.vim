" Make sure Vim returns to the same line when you reopen a file.
function! functions#LineReturn()
    if line("'\"") > 0 && line("'\"") <= line("$") |
        execute 'normal! g`"zvzz' |
    endif
endfunction

function! functions#StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction

function! functions#AutoCDtoProjectRoot()
    try
        if &ft != 'help'
            ProjectRootCD
        endif
    catch
        "silently ignore invalid buffers
    endtry
endfun

function! functions#LocNext()
    try
        lnext
    catch
        try | lfirst | catch | endtry
    endtry
endfunction

function! functions#LocPrev()
    try
        lprev
    catch
        try | llast | catch | endtry
    endtry
endfunction

function! functions#YCMBuildCommand()
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

    return install_command
endfunction
