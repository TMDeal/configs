function! functions#LineReturn()
    " Make sure Vim returns to the same line when you reopen a file.
    if line("'\"") > 0 && line("'\"") <= line("$") |
        execute 'normal! g`"zvzz' |
    endif
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

function! functions#MaybeLoad(condition, ...)
  let opts = get(a:000, 0, {})
  return a:condition ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction
