return {
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                icons = true,
            })

            vim.keymap.set("n", "<leader>xt", function()
                require("trouble").toggle()
            end, { desc = "Trouble Toggle" })

            vim.keymap.set("n", "[t", function()
                require("trouble").next({skip_groups = true, jump = true});
            end, { desc = "Trouble Next" })

            vim.keymap.set("n", "]t", function()
                require("trouble").previous({skip_groups = true, jump = true});
            end, { desc = "Trouble Previous" })
        end
    },
}
