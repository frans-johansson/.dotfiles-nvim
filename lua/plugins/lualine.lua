-- Fancier statusline
return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"linrongbin16/lsp-progress.nvim",
		},
		config = function()
			-- local colorscheme = require("helpers.colorscheme")
			-- local lualine_theme = colorscheme == "default" and "auto" or colorscheme
			local lualine_theme = "auto"
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
					lualine_x = { "require('lsp-progress').progress()" },
					lualine_y = { "filetype", "progress" },
					lualine_z = {
						{ "location", left_padding = 2 },
					},
				},
			})

			-- Listen to LSP progress to update lualine
			vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
			vim.api.nvim_create_autocmd("User LspProgressStatusUpdated", {
				group = "lualine_augroup",
				callback = require("lualine").refresh,
			})
		end,
	},
}
