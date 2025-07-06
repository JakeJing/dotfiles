require("yq.base") -- General Settings (e.g., options and neovide)
require("yq.telescope") -- load setups for telescope (folder or lua script)
require("yq.maps") -- Keymaps
require("yq.plugins") -- Plugins
require("yq.toggleterm") -- load toggle term
-- require("yq.coc") -- load coc completion
require("yq.myfuncs") -- load my funcs
require("yq.lsp-config.lsp")
require("yq.lsp-config.lspsaga")
require("yq.lsp-config.completion")
-- require("yq.lsp-config.null-ls")
require("yq.lf") -- lf
require("yq.undo") -- undo
-- require("yq.quarto")
-- require("yq.nvim-r") -- no need to load, but autoload for rmd file

-- Suppress specific deprecation warnings
vim.deprecate = function() end

-- Used to set the shell (a bit problem of open terminal when you type ZZ)
-- vim.o.shell = 'kitty'

-- global Function to set up nvim-r keybindings for Rmd files
vim.cmd([[
  augroup nvimr_rmd_qmd_keybindings
    autocmd!
    autocmd BufRead,BufNewFile *.qmd set filetype=qmd
    autocmd FileType rmd,qmd lua require('yq.nvim-r.mappings').setup_keybindings()
  augroup END
]])

-- set the colorscheme
vim.cmd([[colorscheme desert]])

-- set vertical split as the default
-- vim.cmd([[autocmd WinNew * wincmd L]])

-- enable autosave
-- vim.cmd([[autocmd TextChanged,TextChangedI <buffer> silent write]])
vim.cmd([[
augroup autosave
  autocmd!
  autocmd TextChanged,TextChangedI * silent! write
augroup END
]])

-- wrap text
-- vim.cmd([[au BufRead,BufNewFile *.md setlocal textwidth=80]])

-- auto run prettier (add *md for autoformating markdown)
vim.cmd(
	[[autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.svelte,*.md,*.yaml,*.html PrettierAsync]]
)

vim.api.nvim_create_autocmd("FileType", {
	pattern = "sh",
	callback = function()
		vim.lsp.start({
			name = "bash-language-server",
			cmd = { "bash-language-server", "start" },
		})
	end,
})

-- global Function to set up nvim-r keybindings for Rmd files
-- vim.cmd([[
--   augroup nvimr_rmd_keybindings
--     autocmd!
--     autocmd FileType rmd,qmd lua require('yq.nvim-r.mappings').setup_keybindings()
--   augroup END
-- ]])
