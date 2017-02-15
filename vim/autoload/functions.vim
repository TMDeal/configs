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

function! functions#MaybeLoad(condition, ...)
    let opts = get(a:000, 0, {})
    return a:condition ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

function! functions#PluginExists(name)
    let dir = $EDITOR_ROOT . '/bundle/' . a:name
    return isdirectory(dir) && has_key(g:plugs, a:name)
endfunction

function! functions#EditInCurrentDir(file)
    let curDir = expand('%:h') . '/'
    execute 'e ' . curDir . a:file
endfunction

function! functions#EditInCurrentDirCompletion(ArgLead, CmdLine, CursorPos)
    let curDir = expand('%:h')
    return map(split(globpath(curDir, a:ArgLead . '*'),"\n"), 'v:val[strlen(curDir)+1: -1]')
endfunction

function! functions#BuildYCM(info)
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
endfunction
