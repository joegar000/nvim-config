return {
    'linrongbin16/colorbox.nvim',
    lazy = false,
    priority = 3000,
    filter = false,
    build = function()
        require("colorbox").update()
    end,
    config = function()
        require("colorbox").setup({
            timing = "filetype",
            fallback = "tokyonight",
            empty = "catppuccin",
            policy = {
                mapping = {
                    javascript = "vscode",
                    typescript = "vscode",
                    javascriptreact = "vscode",
                    typescriptreact = "vscode",
                    html = "vscode",
                    htmldjango = "vscode",
                    json = "vscode",
                    lua = "catppuccin",
                    markdown = "catppuccin",
                    python = "everforest",
                    sql = "kanagawa",
                    php = "embark",
                    dashboard = "catppuccin",
                }
            },
            -- post_hook = function(color, spec)
            --     print(color)
            -- end
        })
    end,
}
