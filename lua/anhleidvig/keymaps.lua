vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Escape" })
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Ex mode" })

-- save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Make it rain" })

-- Yaning to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Terminals
-- open lazygit in terminal 
vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { desc = "Open lazygit" })
-- Terminal Mappings
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
vim.keymap.set({"n", "t"}, "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
vim.keymap.set({"n", "t"}, "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
vim.keymap.set({"n", "t"}, "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
vim.keymap.set({"n", "t"}, "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
vim.keymap.set({"n", "t"}, "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
vim.keymap.set({"n", "t"}, "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })
-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
-- terminal delete and stop insert mode with leader space wd
vim.keymap.set("n", "<leader>wd", "<C-\\><C-n>:q<CR>", { desc = "Terminal delete and stop insert mode" })

vim.keymap.set('n', '<space>cd', vim.diagnostic.open_float, { desc = "Open diagnostic float" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
vim.keymap.set('n', '<space>cq', vim.diagnostic.setloclist, { desc = "Set loclist" })

-- Add undo break-points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })



-- This is going to get me cancelled
--
-- vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Escape" })
--
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Ex mode" })

-- Move lines
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })
-- vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

-- next greatest remap ever
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy to clipboard" })
-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete without affecting register" })

-- vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Ex mode" })
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.formatting, { desc = "Format current buffer" })

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix" })
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location" })
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location" })

-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "Make it rain" })
