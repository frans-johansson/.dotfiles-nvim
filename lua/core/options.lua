-- General options
local opts = {
	shiftwidth = 4,
	tabstop = 4,
	expandtab = true,
	wrap = false,
	termguicolors = true,
	number = true,
	relativenumber = true,
	showmode = false,
	fillchars = "eob: ",
}

for opt, val in pairs(opts) do
	vim.o[opt] = val
end

-- Set other options
local colorscheme = require("helpers.colorscheme")
vim.cmd(":set formatoptions-=cro")

-- Enables transparency effects to pass through
vim.cmd[[
	augroup colorscheme
	  autocmd!
	  autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
	  autocmd ColorScheme * highlight NonText guibg=NONE ctermbg=NONE
	  autocmd ColorScheme * highlight SignColumn guibg=NONE ctermbg=NONE
	augroup END
]]

vim.cmd.colorscheme(colorscheme)
vim.opt.background = "dark"

-- Highlight yanked text for 200ms using the "IncSearch" highlight group
vim.cmd[[
	augroup highlight_yank
	autocmd!
	au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=100})
	augroup END
]]

-- Set up cool signs for diagnostics
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Diagnostic config
local config = {
	virtual_text = false,
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}
vim.diagnostic.config(config)
