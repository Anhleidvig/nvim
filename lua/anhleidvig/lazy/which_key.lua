return {
    "folke/which-key.nvim",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function()
        local wk = require("which-key")

        wk.register({
            ["g"] = { name = "+goto" },
            ["<tab>"] = { name = "+harpoon" },
            ["<leader>b"] = { name = "+buffer" },
            ["<leader>c"] = { name = "+code" },
            ["<leader>f"] = { name = "+file/find" },
            ["<leader>g"] = { name = "+git" },
            ["<leader>gh"] = { name = "+hunks" },
            ["<leader>q"] = { name = "+quit/session" },
            ["<leader>s"] = { name = "+search" },
            ["<leader>u"] = { name = "+ui" },
            ["<leader>w"] = { name = "+windows" },
            ["<leader>x"] = { name = "+diagnostics/quickfix" },
       })

        wk.setup {
            plugins = {
                marks = true, -- shows a list of your marks on ' and `
                registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                spelling = {
                    enabled = false, -- enabling this will show WhichKey for every misspelled word
                    suggestions = 20, -- how many suggestions should be shown in the list?
                },
                presets = {
                    operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                    motions = true, -- adds help for motions
                    text_objects = true, -- help for text objects triggered after entering an operator
                    windows = true, -- default bindings on <c-w>
                    nav = true, -- misc bindings to work with windows
                    z = true, -- bindings for folds, spelling and others prefixed with z
                    g = true, -- bindings for prefixed with g
                },
            },
            operators = { gc = "Comments" },
            motions = {
                count = true,
            },
            icons = {
                breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
                separator = "➜", -- symbol used between a key and it's label
                group = "+", -- symbol prepended to a group
            },
            window = {
                border = "none", -- none, single, double, shadow
                position = "bottom", -- bottom, top
                margin = { 0, 0, 0, 0 }, -- extra window margin [top, right, bottom, left]
                padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
            },
            layout = {
                height = { min = 4, max = 25 }, -- min and max height of the columns
                width = { min = 20, max = 50 }, -- min and max width of the columns
                spacing = 3, -- spacing between columns
            },
            hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
            show_help = true, -- show help message on the command line when the popup is visible
        }
    end,
    opts = {}
}
