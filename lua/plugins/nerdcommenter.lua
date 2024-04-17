vim.g.NERDCreateDefaultMappings = 0
return {
    'preservim/nerdcommenter',
    keys = {
        { '<leader>ncc', '<Plug>NERDCommenterComment("n", "Comment")', mode = 'n', desc = 'Comment' },
        { '<leader>ncc', '<Plug>NERDCommenterComment("x", "Comment")', mode = 'x', desc = 'Comment' },
        { '<leader>ncn', '<Plug>NERDCommenterNested("n", "Nested")', mode = 'n', desc = 'Comment with forced nesting' },
        { '<leader>ncn', '<Plug>NERDCommenterNested("x", "Nested")', mode = 'x', desc = 'Comment with forced nesting' },
        { '<leader>nc<Space>', '<Plug>NERDCommenterToggle("n", "Toggle")', mode = 'n', desc = 'Toggle comments' },
        { '<leader>nc<Space>', '<Plug>NERDCommenterToggle("x", "Toggle")', mode = 'x', desc = 'Toggle comments' },
        { '<leader>ncm', '<Plug>NERDCommenterMinimal("n", "Minimal")', mode = 'n', desc = 'Comments the given lines using one set of delimiters' },
        { '<leader>ncm', '<Plug>NERDCommenterMinimal("x", "Minimal")', mode = 'x', desc = 'Comments the given lines using one set of delimiters' },
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
