local M = {}

-- Treesitter, syntax highlighting etc.
M.grammars = { "c", "cpp", "lua", "python", "rust", "vim" }

-- LSP configs 
M.servers = {
	-- Lua
	lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	},

	-- Python
	-- pylsp = {
	-- 	settings = {
	-- 		pylsp = {
	-- 			plugins = {
	-- 				flake8 = {
	-- 					enabled = true,
	-- 					maxLineLength = 88, -- Black's line length
	-- 				},
	-- 				-- Disable plugins overlapping with flake8
	-- 				pycodestyle = {
	-- 					enabled = false,
	-- 				},
	-- 				mccabe = {
	-- 					enabled = false,
	-- 				},
	-- 				pyflakes = {
	-- 					enabled = false,
	-- 				},
	-- 				-- Use Black as the formatter
	-- 				autopep8 = {
	-- 					enabled = false,
	-- 				},
	-- 			},
	-- 		},
	-- 	},
	-- },
    pyright = {},

	-- C/C++
	clangd = {},

	-- Rust
	rust_analyzer = {
		settings = {
			rust_analyzer = {
				cargo_watch = {
					enabled = true,
				},
			},
		},
	},
}

return M
