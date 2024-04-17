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

        { '<leader>nci', '<Plug>NERDCommenterInvert("n", "Invert")', mode = 'n', desc = 'Toggle line comment states individually' },
        { '<leader>nci', '<Plug>NERDCommenterInvert("x", "Invert")', mode = 'x', desc = 'Toggle line comment states individually' },

        { '<leader>ncs', '<Plug>NERDCommenterSexy("n", "Sexy")', mode = 'n', desc = 'Comment with a pretty block layout' },
        { '<leader>ncs', '<Plug>NERDCommenterSexy("x", "Sexy")', mode = 'x', desc = 'Comment with a pretty block layout' },

        { '<leader>ncy', '<Plug>NERDCommenterYank("n", "Yank")', mode = 'n', desc = 'Yank then comment' },
        { '<leader>ncy', '<Plug>NERDCommenterYank("x", "Yank")', mode = 'x', desc = 'Yank then comment' },

        { '<leader>nc$', '<Plug>NERDCommenterToEOL("n", "ToEOL")', mode = 'n', desc = 'Comment from cursor to EOL' },

        { '<leader>ncA', '<Plug>NERDCommenterAppend("n", "Append")', mode = 'n', desc = 'Add comment delimiters to the EOL and go into insert mode' },

        { '<leader>nca', '<Plug>NERDCommenterAltDelims("n", "AltDelims")', mode = 'n', desc = 'Switches to alternative delimieters' },

        { '<leader>ncl', '<Plug>NERDCommenterAlignLeft("n", "AlignLeft")', mode = 'n', desc = 'Comment except delimiters are aligned down the left side' },
        { '<leader>ncl', '<Plug>NERDCommenterAlignLeft("x", "AlignLeft")', mode = 'x', desc = 'Comment except delimiters are aligned down the left side' },

        { '<leader>ncb', '<Plug>NERDCommenterAlignBoth("n", "AlignBoth")', mode = 'n', desc = 'Comment except delimiters are aligned down both sides' },
        { '<leader>ncb', '<Plug>NERDCommenterAlignBoth("x", "AlignBoth")', mode = 'x', desc = 'Comment except delimiters are aligned down both sides' },

        { '<leader>ncu', '<Plug>NERDCommenterUncomment("n", "Uncomment")', mode = 'n', desc = 'Uncomment' },
        { '<leader>ncu', '<Plug>NERDCommenterUncomment("x", "Uncomment")', mode = 'x', desc = 'Uncomment' }
    }
}
