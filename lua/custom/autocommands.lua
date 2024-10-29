-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local CustomGroup = augroup("CustomGroup", {})
local YankGroup = augroup("HighlightYank", {
	clear = true,
})

autocmd({ "BufWritePre" }, {
	desc = "Remove trailing whitespace before writing",
	group = CustomGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = YankGroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25
