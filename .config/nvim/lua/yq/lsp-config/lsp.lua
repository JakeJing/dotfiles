local on_attach = function()
	local function keymap(...)
		vim.api.nvim_buf_set_keymap(0, ...) -- set bufnr as 0
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(0, ...)
		-- disable update in insert and virtual text for all language servers
		vim.diagnostic.config({
			-- update_in_insert = false,
            -- hide underline and signs at the gutter
            underline = true,
            signs = false,
			virtual_text = false,
			float = { source = "always" },
			severity_sort = true,
		})
	end
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- enable diagonistic on save
	-- vim.api.nvim_create_autocmd("BufWritePost", {
	-- 	callback = function()
	-- 		vim.lsp.buf.format({ async = false })
	-- 	end,
	-- })

	local opts = { noremap = true, silent = true }

	keymap("n", "gd", "<CMD>lua vim.lsp.buf.definition()<CR>", opts)
	keymap("n", "K", "<CMD>lua vim.lsp.buf.hover()<CR>", opts)
	keymap("n", "gr", "<CMD>Lspsaga rename<cr>", opts)
	keymap("n", "<leader>gb", "<CMD>lua vim.diagnostic.goto_prev()<CR>", opts)
	keymap("n", "<leader>gn", "<CMD>lua vim.diagnostic.goto_next()<CR>", opts)
	keymap("n", "<leader>ld", "<CMD>lua vim.diagnostic.open_float()<CR>", opts)
	keymap("n", "<leader>lf", "<CMD>lua vim.lsp.buf.format({ timeout_ms = 9000 })<CR>", opts)
	keymap("n", "gi", "<CMD>lua vim.lsp.buf.implementation()<CR>", opts)
	-- keymap("n", "<leader>rn", ":lua vim.lsp.util.rename()<CR>", opts)
	keymap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
	keymap("n", "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", opts)
	-- keymap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
end

---@diagnostic disable-next-line: undefined-global
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("lspconfig")["r_language_server"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["pyright"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["cssls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["emmet_ls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["tsserver"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["lua_ls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
				-- update_in_insert = false, -- (not useful)
			},
			runtime = {
				version = "LuaJIT",
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				-- do not check the third party to avoid popup of luassert
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

require("lspconfig")["texlab"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["ltex"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["bashls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["hls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["clangd"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

require("lspconfig")["gopls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
