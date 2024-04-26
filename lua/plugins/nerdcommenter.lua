vim.g.NERDCreateDefaultMappings = 0
return {
    'preservim/nerdcommenter',
    keys = {
        { '<leader>zc', '<Plug>NERDCommenterComment("n", "Comment")', mode = 'n', desc = 'Comment' },
        { '<leader>zc', '<Plug>NERDCommenterComment("x", "Comment")', mode = 'x', desc = 'Comment' },

        { '<leader>zn', '<Plug>NERDCommenterNested("n", "Nested")', mode = 'n', desc = 'Comment with forced nesting' },
        { '<leader>zn', '<Plug>NERDCommenterNested("x", "Nested")', mode = 'x', desc = 'Comment with forced nesting' },

        { '<leader>z<Space>', '<Plug>NERDCommenterToggle("n", "Toggle")', mode = 'n', desc = 'Toggle comments' },
        { '<leader>z<Space>', '<Plug>NERDCommenterToggle("x", "Toggle")', mode = 'x', desc = 'Toggle comments' },

        { '<leader>zm', '<Plug>NERDCommenterMinimal("n", "Minimal")', mode = 'n', desc = 'Comments the given lines using one set of delimiters' },
        { '<leader>zm', '<Plug>NERDCommenterMinimal("x", "Minimal")', mode = 'x', desc = 'Comments the given lines using one set of delimiters' },

        { '<leader>zi', '<Plug>NERDCommenterInvert("n", "Invert")', mode = 'n', desc = 'Toggle line comment states individually' },
        { '<leader>zi', '<Plug>NERDCommenterInvert("x", "Invert")', mode = 'x', desc = 'Toggle line comment states individually' },

        { '<leader>zs', '<Plug>NERDCommenterSexy("n", "Sexy")', mode = 'n', desc = 'Comment with a pretty block layout' },
        { '<leader>zs', '<Plug>NERDCommenterSexy("x", "Sexy")', mode = 'x', desc = 'Comment with a pretty block layout' },

        { '<leader>zy', '<Plug>NERDCommenterYank("n", "Yank")', mode = 'n', desc = 'Yank then comment' },
        { '<leader>zy', '<Plug>NERDCommenterYank("x", "Yank")', mode = 'x', desc = 'Yank then comment' },

        { '<leader>z$', '<Plug>NERDCommenterToEOL("n", "ToEOL")', mode = 'n', desc = 'Comment from cursor to EOL' },

        { '<leader>zA', '<Plug>NERDCommenterAppend("n", "Append")', mode = 'n', desc = 'Add comment delimiters to the EOL and go into insert mode' },

        { '<leader>za', '<Plug>NERDCommenterAltDelims("n", "AltDelims")', mode = 'n', desc = 'Switches to alternative delimieters' },

        { '<leader>zl', '<Plug>NERDCommenterAlignLeft("n", "AlignLeft")', mode = 'n', desc = 'Comment except delimiters are aligned down the left side' },
        { '<leader>zl', '<Plug>NERDCommenterAlignLeft("x", "AlignLeft")', mode = 'x', desc = 'Comment except delimiters are aligned down the left side' },

        { '<leader>zb', '<Plug>NERDCommenterAlignBoth("n", "AlignBoth")', mode = 'n', desc = 'Comment except delimiters are aligned down both sides' },
        { '<leader>zb', '<Plug>NERDCommenterAlignBoth("x", "AlignBoth")', mode = 'x', desc = 'Comment except delimiters are aligned down both sides' },

        { '<leader>zu', '<Plug>NERDCommenterUncomment("n", "Uncomment")', mode = 'n', desc = 'Uncomment' },
        { '<leader>zu', '<Plug>NERDCommenterUncomment("x", "Uncomment")', mode = 'x', desc = 'Uncomment' }
    }
}
