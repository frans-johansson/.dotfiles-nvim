-- Fancier statusline
return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			local colorscheme = require("helpers.colorscheme")
			local lualine_theme = colorscheme == "default" and "auto" or colorscheme
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = lualine_theme,
					component_separators = "|",
					section_separators = "",
				},
				sections = {
					lualine_a = {
						{ "mode", right_padding = 2 },
					},
					lualine_b = { "filename", "branch" },
					lualine_c = { "fileformat" },
					lualine_x = {},
					lualine_y = { "filetype", "progress" },
					lualine_z = {
						{ "location", left_padding = 2 },
					},
				},
			})
		end,
	},
}
