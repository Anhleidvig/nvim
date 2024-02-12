return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },

        config = function()
            local harpoon = require("harpoon")

            harpoon:setup()

            vim.keymap.set("n", "<Tab>a", function() harpoon:list():append() end, {
                desc = "Append current buffer to Harpoon list",
            })
            vim.keymap.set("n", "<Tab>l", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {
                desc = "Toggle Harpoon list",
            })

            vim.keymap.set("n", "<Tab>1", function() harpoon:list():select(1) end, {
                desc = "Select Harpoon list 1",
            })
            vim.keymap.set("n", "<Tab>2", function() harpoon:list():select(2) end, {
                desc = "Select Harpoon list 2",
            })
            vim.keymap.set("n", "<Tab>3", function() harpoon:list():select(3) end, {
                desc = "Select Harpoon list 3",
            })
            vim.keymap.set("n", "<tab>4", function() harpoon:list():select(4) end, {
                desc = "Select Harpoon list 4",
            })

            -- Toggle previous & next buffers stored within Harpoon list
            vim.keymap.set("n", "<Tab>p", function() harpoon:list():prev() end, {
                desc = "Select previous buffer in Harpoon list",
            })
            vim.keymap.set("n", "<Tab>n", function() harpoon:list():next() end, {
                desc = "Select next buffer in Harpoon list",
            })
        end
    },
}
