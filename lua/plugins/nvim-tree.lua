return {
    'nvim-tree/nvim-tree.lua',
    keys = { { '<leader>e', '<cmd>NvimTreeFindFileToggle<CR>', desc = 'Open file explorer' } },
    lazy = false,
    config = function()
        local setup, nvimtree = pcall(require, "nvim-tree")
        local api = require("nvim-tree.api")
        local Event = api.events.Event

        local backdrop_win = nil
        local backdrop_buf = nil

        local Util = require('lazy.util')

        api.events.subscribe(Event.TreeClose, function()
            if backdrop_win ~= nil then
                vim.api.nvim_win_close(backdrop_win, true)
                backdrop_win = nil
            end
            if backdrop_buf ~= nil then
                vim.api.nvim_buf_delete(backdrop_buf, { force = true })
                backdrop_buf = nil
            end
        end)

        local WIDTH_RATIO = 0.8
        local HEIGHT_RATIO = 0.8

        nvimtree.setup({
            disable_netrw = true,
            hijack_netrw = true,
            respect_buf_cwd = true,
            sync_root_with_cwd = true,
            view = {
                -- relativenumber = true,
                float = {
                    enable = true,
                    open_win_config = function()

                        backdrop_buf = vim.api.nvim_create_buf(false, true)
                        backdrop_win = vim.api.nvim_open_win(backdrop_buf, false, {
                            relative = "editor",
                            width = vim.o.columns,
                            height = vim.o.lines,
                            row = 0,
                            col = 0,
                            style = "minimal",
                            focusable = false,
                            zindex = 49,
                        })
                        vim.api.nvim_set_hl(0, "TreeBackdrop", { bg = "#000000", default = true })
                        Util.wo(backdrop_win, "winhighlight", "Normal:TreeBackdrop")
                        Util.wo(backdrop_win, "winblend", 60)
                        vim.bo[backdrop_buf].buftype = "nofile"
                        vim.bo[backdrop_buf].filetype = "tree_backdrop"

                        local screen_w = vim.opt.columns:get()
                        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                        local window_w = screen_w * WIDTH_RATIO
                        local window_h = screen_h * HEIGHT_RATIO
                        local window_w_int = math.floor(window_w)
                        local window_h_int = math.floor(window_h)
                        local center_x = (screen_w - window_w) / 2
                        local center_y = ((vim.opt.lines:get() - window_h) / 2)
                        - vim.opt.cmdheight:get()

                        return {
                            border = "none",
                            relative = "editor",
                            row = center_y,
                            col = center_x,
                            width = window_w_int,
                            height = window_h_int,
                        }
                    end,
                },
                width = function()
                    return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
                end,
            }
        })
    end
}
