vim.g.mundo_width = 60
vim.g.mundo_preview_height = 20
-- vim.g.mundo_right = 1
vim.api.nvim_set_keymap("n", "<leader>u", ":MundoToggle<CR>", { noremap = true, silent = true })
