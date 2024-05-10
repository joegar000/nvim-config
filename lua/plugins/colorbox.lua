return {
    'linrongbin16/colorbox.nvim',
    lazy = false,
    priority = 3000,
    background = "dark",
    filter = false,
    build = function()
        require("colorbox").update()
    end,
    config = function()
        require("colorbox").setup({
            timing = "filetype",
            policy = {
                mapping = {
                    javascript = "vscode",
                    typescript = "vscode",
                    javascriptreact = "vscode",
                    typescriptreact = "vscode",
                    json = "vscode",
                    lua = "nightfox",
                    markdown = "tokyonight",
                    python = "melange",
                    php = "embark",
                    dashboard = "tokyonight",
                }
            },
        })
    end,
}
