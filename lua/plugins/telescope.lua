-- Telescope fuzzy finding (all the things)
return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-u>"] = false,
							["<C-d>"] = false,
						},
					},
				},
			})

			-- Enable telescope fzf native, if installed
			pcall(require("telescope").load_extension, "fzf")

			local map = require("helpers.keys").map
			local builtin = require("telescope.builtin")
			map("n", "<leader>fr", builtin.oldfiles, "Recently opened")
			map("n", "<leader><space>", builtin.buffers, "Open buffers")
			map("n", "<leader>/", function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, "Search in current buffer")

			map("n", "<leader>sf", builtin.find_files, "Files")
			map("n", "<leader>sh", builtin.help_tags, "Help")
			map("n", "<leader>sw", builtin.grep_string, "Current word")
			map("n", "<leader>sg", builtin.live_grep, "Grep")
			map("n", "<leader>gb", builtin.git_branches, "Show branches")
			map("n", "<leader>gl", builtin.git_branches, "Search the log")

			map("n", "<C-p>", builtin.keymaps, "Search keymaps")
		end,
	},
}
