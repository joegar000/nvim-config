return {
    'preservim/nerdcommenter',
    keys = {
        { '<leader>cc', desc = 'Comment out the current line or text selected in visual mode' },
        { '<leader>ci', desc = 'Toggles comment state of selected line(s) individually' },
        { '<leader>cs', desc = 'Comments out the selected lines with a pretty block layout' },
        { '<leader>cy', desc = 'Same a cc except that the commented line(s) are yanked first' },
        { '<leader>c$', desc = 'Comments the current line from the cursor to end of line' },
        { '<leader>cA', desc = 'Adds comments delimiters to the end of line and goes into insert mode between them' },
        { '<leader>ca', desc = 'Switches to the alternative set of delimieters' },
        { '<leader>cl', desc = 'Same as cc except delimiters are aligned down the left side' },
        { '<leader>cb', desc = 'Same as cc except delimiters are aligned down both sides' },
        { '<leader>cu', desc = 'Uncomment selected lines' }
    }
}
