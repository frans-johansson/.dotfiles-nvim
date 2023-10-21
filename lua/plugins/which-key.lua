return {
	{
		"folke/which-key.nvim",
		config = function()
			local wk = require("which-key")
			wk.setup()
			wk.register(
				{
					["<leader>"] = {
						f = { name = "File" },
						d = { name = "Delete/Close" },
						q = { name = "Quit" },
						s = { name = "Search" },
						x = { name = "Diagnostics" },
						l = { name = "LSP" },
						u = { name = "UI" },
						g = { name = "Git" },
						gh = { name = "Hunks" },
						n = { name = "Notes" },
					}
				}
			)
		end
	}
}
