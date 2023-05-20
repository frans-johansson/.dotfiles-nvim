-- Git related plugins
return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			local gs = require("gitsigns")
			gs.setup()

			local map = require("helpers.keys").map
			map("n", "<leader>ghs", gs.preview_hunk, "Show a preview of the current hunk")
			map("n", "<leader>ghn", gs.next_hunk, "Go to next hunk")
			map("n", "<leader>ghp", gs.prev_hunk, "Go to previous hunk")
			map("n", "<leader>gha", gs.stage_hunk, "Stage the current hunk")
			map("n", "<leader>ghr", gs.reset_hunk, "Reset the current hunk")
			map("n", "<leader>gB", gs.toggle_current_line_blame, "Toggle line blame")
			map("n", "<leader>gd", gs.diffthis, "Show the git diff")
		end,
	},
	{
		"akinsho/git-conflict.nvim",
		commit = "2957f74",
		config = function()
			require("git-conflict").setup({
				default_mappings = {
					ours = "co",
					theirs = "ct",
					none = "c0",
					both = "cb",
					next = "cn",
					prev = "cp",
				},
			})
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			local map = require("helpers.keys").map
			map("n", "<leader>gg", "<cmd>Git<cr>", "Status")
			map("n", "<leader>gL", "<cmd>Git log --oneline --graph --decorate --all<cr>", "Log")
			map("n", "<leader>gb", "<cmd>Git blame<cr>", "Blame")
		end
	}
}
