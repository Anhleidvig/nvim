return {
	"nvim-treesitter/nvim-treesitter-context",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("treesitter-context").setup({
			enable = true,
			max_lines = 0, -- No limit
			min_window_height = 0, -- No limit
			patterns = {
				default = {
					"class",
					"function",
					"method",
					"for_statement",
					"while_statement",
					"if_statement",
				},
			},
			zindex = 20,
			mode = "cursor", -- "cursor" | "topline"
		})
	end,
}
