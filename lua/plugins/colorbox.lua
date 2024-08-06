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
            empty = "tokyonight",
            policy = {
                mapping = {
                    javascript = "vscode",
                    typescript = "vscode",
                    javascriptreact = "vscode",
                    typescriptreact = "vscode",
                    json = "vscode",
                    lua = "catppuccin",
                    markdown = "nord",
                    python = "melange",
                    php = "embark",
                    dashboard = "tokyonight",
                }
            },
        })
    end,
}
