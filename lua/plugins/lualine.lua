-- Fancier statusline
return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"linrongbin16/lsp-progress.nvim",
			"SmiteshP/nvim-navic",
		},
		config = function()
			-- local colorscheme = require("helpers.colorscheme")
			-- local lualine_theme = colorscheme == "default" and "auto" or colorscheme
			local lualine_theme = "auto"
			local navic = require("nvim-navic")
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
					lualine_b = {
						{
							"filename",
							path = 1,
							file_status = false,
						},
						{ "branch" },
					},
					lualine_c = { "diff" },
					lualine_x = { "require('lsp-progress').progress()" },
					lualine_y = { "filetype", "diagnostics", "progress" },
				},
				winbar = {
					lualine_b = { "buffers" },
					lualine_x = {
						{
							"navic",
							color_correction = nil,
							navic_opts = nil,
							draw_empty = true,
						},
					},
					lualine_y = { {"searchcount", draw_empty = true} },
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
