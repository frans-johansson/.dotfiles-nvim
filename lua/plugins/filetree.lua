-- Nicer filetree than NetRW
return {
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v2.x",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- 	config = function()
	-- 		require("neo-tree").setup()
	-- 		require("helpers.keys").map(
	-- 			{ "n", "v" },
	-- 			"<leader>e",
	-- 			"<cmd>NeoTreeRevealToggle<cr>",
	-- 			"Toggle file explorer"
	-- 		)
	-- 	end,
	-- },
	-- {
	-- 	"stevearc/oil.nvim",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	config = function()
	-- 		require("oil").setup({})
	-- 	end,
	-- },
	{
		"echasnovski/mini.files",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		version = "*",
		config = function()
			local minifiles = require("mini.files")
			minifiles.setup({})
			require("helpers.keys").map({ "n", "v" }, "<leader>e", function()
				if minifiles.close() == nil then
					minifiles.open(vim.api.nvim_buf_get_name(0))
				end
			end, "Toggle file explorer")
		end,
	},
}
