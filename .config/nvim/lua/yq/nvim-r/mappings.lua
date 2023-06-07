-- set vertical split as the default
-- vim.cmd([[autocmd WinNew * wincmd L]])

-- set the help page as tab
vim.g.R_nvimpager = "tab"
-- disable backtick to trigger rmd code fence (conflict with autopairs)
vim.g.R_rmdchunk = 0
--  type two `_` to get them converted into `<-` to avoid _ directly mapping to arrow
vim.g.R_assign = 2
-- silent n in register search
vim.cmd([[ nnoremap <silent> <leader>n :silent! n<CR> ]])
-- autostart when a R file is opened (can cause problem when check source code, it will autostart)
-- vim.g.R_auto_start = 2

local M = {}

function M.setup_keybindings()
	local function keymap(...)
		vim.api.nvim_buf_set_keymap(0, ...) -- set bufnr as 0
	end
	local opts = { noremap = true, silent = true }

	-- start R (only in normal mode)
	keymap("n", "<Leader>r", "<CMD>call StartR('R')<CR>", opts)
	-- insert code chunk
	keymap("n", "ii", "<CMD>call RWriteRmdChunk()<CR>o", opts)
	keymap("i", "ii", "<Esc><CMD>call RWriteRmdChunk()<CR>o", opts)
	-- send line to R (add <CR> at the end, you can test at cmdline mode first)
	keymap("n", "<A-CR>", "<CMD>call SendLineToR('down')<CR>", opts)
	keymap("i", "<A-CR>", "<Esc><CMD>call SendLineToR('down')<CR>", opts)
	keymap("v", "<A-CR>", "<Esc><CMD>call SendSelectionToR('silent','stay','normal')<CR>", opts)
	keymap("n", "<A-CR>", "<CMD>call SendLineToR('down')<CR>", opts)
	keymap("x", "<A-CR>", "<Esc><CMD>call SendSelectionToR('echo','stay')<CR><Esc>", opts) -- visual line mode for selection
	-- send paragraph
	keymap("n", "<leader><CR>", "<CMD>call SendParagraphToR('echo', 'stay')<CR>", opts)
	keymap("i", "<leader><CR>", "<ESC><CMD>call SendParagraphToR('echo', 'stay')<CR>", opts)
	-- send chunk to R
	keymap("n", "<S-A-CR>", "<CMD>call b:SendChunkToR('echo','stay')<CR>zz", opts)
	keymap("i", "<S-A-CR>", "<Esc><CMD>call b:SendChunkToR('echo','stay')<CR>zz", opts)
	keymap("v", "<S-A-CR>", "<CMD>call b:SendChunkToR('echo','stay')<CR>zz", opts)
	-- send next chunk (shift+alt+N), actually it is just alt-N
	keymap("n", "˜", "<CMD>call b:NextRChunk()|call b:SendChunkToR('echo','stay')<CR>zz", opts)
	keymap("i", "˜", "<Esc><CMD>call b:NextRChunk()|call b:SendChunkToR('echo','stay')<CR>zz", opts)
	keymap("v", "˜", "<CMD>call b:NextRChunk()|call b:SendChunkToR('echo','stay')<CR>zz", opts)
	-- go to next chunk
	keymap("n", "<C-N>", "<CMD>call b:NextRChunk()<CR>zz", opts)
	keymap("i", "<C-N>", "<Esc><CMD>call b:NextRChunk()<CR>zz", opts)
	keymap("v", "<C-N>", "<CMD>call b:NextRChunk()<CR>zz", opts)
	-- go to previous chunk
	keymap("n", "<C-B>", "<CMD>call b:PreviousRChunk()<CR>zz", opts)
	keymap("i", "<C-B>", "<Esc><CMD>call b:PreviousRChunk()<CR>zz", opts)
	keymap("v", "<C-B>", "<CMD>call b:PreviousRChunk()<CR>zz", opts)
	-- insert (alt+p or i)
	keymap("i", "π", " %>%", opts)
	keymap("i", "ˆ", '%in% c("")<left><left>', opts) -- need to type alt+i and space to triger it
	-- print element at the cursor
	-- keymap("n", "<leader>p", "<CMD>call RAction('print')<CR>", opts)
	keymap("n", "<leader>gl", ":call RAction('dplyr::glimpse')<CR>", opts)
	keymap("n", "<leader>v", "<CMD>call RAction('viewobj')<CR>", opts)
	-- print the Head of a df as tibble
	keymap("n", "<Leader>H", ':call RAction("pillar:::print.tbl(tibble::as_tibble", ", NULL), n = 6")<CR>', opts)
	-- keymap("n", "<leades>vh", [[<CMD>call RAction("viewobj", ", nrows=6")<CR>]], opts)
	keymap("n", "<leader>h", "<CMD>call RAction('help')<CR>", opts)
	keymap("n", "<leader>e", "<CMD>call RAction('example')<CR>", opts)
	keymap("n", "<C-Q>", "<CMD>RKill<CR>", opts)
	-- go to the beginning and end of the chink
	keymap("n", "<C-K>", [[<CMD>setlocal nohlsearch|execute '/\%<'.line('.').'l^```{' |normal! N+1<CR>]], opts)
	keymap("n", "<C-J>", [[<CMD>setlocal nohlsearch|execute '/\%>'.line('.').'l^```$' |-1<CR>]], opts)
	keymap("v", "<C-K>", [[<CMD>setlocal nohlsearch|execute '/\%<'.line('.').'l^```{' |normal! N<down><CR>]], opts)
	keymap("v", "<C-J>", [[<CMD>setlocal nohlsearch|execute '/\%>'.line('.').'l^```$'|-1<CR>]], opts)
	-- execute from the current line till the end of the chunk
	keymap(
		"n",
		"<C-L>",
		[[:normal! V<CR><CMD>setlocal nohlsearch|execute '/\%>'.line('.').'l^```$'|-1<CR><Esc><CMD>call SendSelectionToR('echo','stay')<CR><Esc>]],
		opts
	)
	-- knit the doc
	keymap("n", "<C-A-K>", [[<CMD>call RKnit()<CR>]], opts)
end

return M
