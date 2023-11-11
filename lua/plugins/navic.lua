-- Attaches to LSP client and displays information in the windowbar
return {
	{
		"SmiteshP/nvim-navic",
		config = function()
			require("nvim-navic").setup({
				lsp = { auto_attach = true },
			})
		end,
	},
}
