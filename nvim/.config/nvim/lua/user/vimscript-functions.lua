vim.cmd([[
    function! SaveFormat()
        execute ':Format'
        redraw
        " Hack to make it work, run command twice (perhaps format is asynchronous)
        execute ':w'
        execute ':w'
    endfunction


    " source: https://stackoverflow.com/a/6171215/14316282
    " Escape special characters in a string for exact matching.
    " This is useful to copying strings from the file to the search tool
    " Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
    function! EscapeString (string)
        let string=a:string
        " Escape regex characters
        let string = escape(string, '^$.*\/~[]')
        " Escape the line endings
        let string = substitute(string, '\n', '\\n', 'g')
        return string
    endfunction

    " Get the current visual block for search and replaces
    " This function passed the visual block through a string escape function
    " Based on this - https://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
    function! GetVisual() range
        " Save the current register and clipboard
        let reg_save = getreg('"')
        let regtype_save = getregtype('"')
        let cb_save = &clipboard
        set clipboard&

        " Put the current visual selection in the " register
        normal! ""gvy
        let selection = getreg('"')

        " Put the saved registers and clipboards back
        call setreg('"', reg_save, regtype_save)
        let &clipboard = cb_save

        "Escape any special characters in the selection
        let escaped_selection = EscapeString(selection)

        return escaped_selection
    endfunction

]])
