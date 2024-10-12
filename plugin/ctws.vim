" Plugin name: ctws.vim
" Description: Removes unwanted tabs and trailing whitespace. Nothing more, nothing less. 
" https://google.github.io/styleguide/vimscriptguide.xml?showone=Fragile_commands#Fragile_commands
" https://google.github.io/styleguide/vimscriptguide.xml?showone=Dangerous_commands#Dangerous_commands

function! CleanTrailingWhitespaceAndTabs()
    " Save cursor position
    let l:cursor_pos = getpos('.')
    " Save last search
    let _s = @/
    " Save windows state
    let l:save_winview = winsaveview()

    " Clean trailing whitespace
    call CleanPattern('\s\+$')

    " Clean trailing tabs
    call CleanPattern('\t\+$')

    " Remove whitespace-only lines
    call CleanPattern('^\s\+$')

    " Remove tabs-only lines
    call CleanPattern('^\t\+$')

    " Restore cursor position
    call setpos('.', l:cursor_pos)
    " Restore last search
    let @/ = _s
    " Restore window state
    call winrestview(l:save_winview)
endfunction

" Helper function to clean lines matching a pattern
function! CleanPattern(pattern)
    " Start from the top of the buffer
    let l:line_num = 1
    while l:line_num <= line('$')
        let l:line = getline(l:line_num)
        if l:line =~ a:pattern
            " Replace the matching pattern in the line
            let l:cleaned_line = substitute(l:line, a:pattern, '', '')
            call setline(l:line_num, l:cleaned_line)
        endif
        let l:line_num += 1
    endwhile
endfunction

command! Ctws call CleanTrailingWhitespaceAndTabs()

" Optional: Automatically clean on file save
" autocmd BufWritePre *.c *.py *.sh *.vim call CleanTrailingWhitespaceAndTabs()

" Optional: Bind a shortcut (e.g., <Leader>ctws)
" nnoremap <Leader>ctws :Ctws<CR>
