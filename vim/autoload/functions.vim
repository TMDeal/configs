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

function! functions#EditInCurrentDir(file)
    let curDir = expand('%:h') . '/'
    execute 'e ' . curDir . a:file
endfunction

function! functions#EditInCurrentDirCompletion(ArgLead, CmdLine, CursorPos)
    let curDir = expand('%:h')
    return map(split(globpath(curDir, a:ArgLead . '*'),"\n"), 'v:val[strlen(curDir)+1: -1]')
endfunction
