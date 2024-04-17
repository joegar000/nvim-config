vim.g.NERDCreateDefaultMappings = 0
return {
    'preservim/nerdcommenter',
    keys = {
        { '<leader>ncc', function() vim.cmd.call('<Plug>NERDCommenterComment("'..vim.cmd.mode()..'", "Comment")') end, mode = { 'n', 'x' }, desc = 'Comment' },
        { '<leader>ncn', function() vim.cmd.call('nerdcommenter#Comment("", "Nested")') end, mode = { 'n', 'x' }, desc = 'Comment with forced nesting' },
        { '<leader>nc<Space>', function() vim.cmd.call('nerdcommenter#Comment("", "Toggle")') end, mode = { 'n', 'x' }, desc = 'Toggle comments' },
        { '<leader>ncm', function() vim.cmd.call('nerdcommenter#Comment("", "Minimal")') end, mode = { 'n', 'x' }, desc = 'Comments the given lines using one set of delimiters' },
        { '<leader>nci', function() vim.cmd.call('nerdcommenter#Comment("", "Invert")') end, mode = { 'n', 'x' }, desc = 'Toggle line comment states individually' },
        { '<leader>ncs', function() vim.cmd.call('nerdcommenter#Comment("", "Sexy")') end, mode = { 'n', 'x' }, desc = 'Comment with a pretty block layout' },
        { '<leader>ncy', function() vim.cmd.call('nerdcommenter#Comment("", "Yank")') end, mode = { 'n', 'x' }, desc = 'Yank then comment' },
        { '<leader>nc$', function() vim.cmd.call('nerdcommenter#Comment("", "ToEOL")') end, mode = { 'n' }, desc = 'Comment from cursor to EOL' },
        { '<leader>ncA', function() vim.cmd.call('nerdcommenter#Comment("", "Append")') end, mode = { 'n' }, desc = 'Add comment delimiters to the EOL and go into insert mode' },
        { '<leader>nca', function() vim.cmd.call('nerdcommenter#Comment("", "AltDelims")') end, mode = { 'n' }, desc = 'Switches to alternative delimieters' },
        { '<leader>ncl', function() vim.cmd.call('nerdcommenter#Comment("", "AlignLeft")') end, mode = { 'n', 'x' }, desc = 'Comment except delimiters are aligned down the left side' },
        { '<leader>ncb', function() vim.cmd.call('nerdcommenter#Comment("", "AlignBoth")') end, mode = { 'n', 'x' }, desc = 'Comment except delimiters are aligned down both sides' },
        { '<leader>ncu', function() vim.cmd.call('nerdcommenter#Comment("", "Uncomment")') end, mode = { 'n', 'x' }, desc = 'Uncomment' }
    }
}
