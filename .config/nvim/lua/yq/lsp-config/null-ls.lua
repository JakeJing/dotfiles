-- Important: you can find the code_actions, completions, diagnoistics, formating and hover in https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins
-- local null_ls = require("none-ls")
local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	--[[ formatting ]]
	formatting.format_r, -- r, rmd
	formatting.black, -- python
	formatting.autopep8, -- python
	formatting.stylua, --- lua
	formatting.eslint_d, -- javascript
	formatting.stylelint, -- css, scss
	formatting.latexindent, -- latex
	formatting.bibclean, -- bib
	formatting.prettier, -- js, css, json, html, yaml, markdown
	formatting.fish_indent, -- fish
	formatting.beautysh, -- sh, zsh, csh, ksh

	--[[ code actions ]]
	code_actions.eslint_d,

	--[[ diagnostics ]]
	diagnostics.eslint_d,
	diagnostics.flake8,
	diagnostics.fish,
}

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
		timeout_ms = 9000, -- increase the timeout
		-- async = false, -- disable async and make the diagnostic on save (not useful)
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", { -- set it as BufWritePre (not relavant for the error warning)
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
		-- Important: diable diagnostic in insert and hide the virtual text in null-ls diagnostics
		vim.diagnostic.config({
			-- update_in_insert = false, -- (not useful)
			virtual_text = false,
			float = { source = "always" },
			severity_sort = true,
		})
	end
end

null_ls.setup({
	sources = sources,
	on_attach = on_attach,
})
