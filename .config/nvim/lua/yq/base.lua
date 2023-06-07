local g = vim.g
local o = vim.o
local opt = vim.opt

if vim.g.neovide then
	-- Put anything you want to happen only in Neovide here
	vim.g.neovide_scale_factor = 1.5
	vim.g.neovide_padding_top = 0
	vim.g.neovide_padding_bottom = 0
	vim.g.neovide_padding_right = 0
	vim.g.neovide_padding_left = 0
	-- Helper function for transparency formatting
	local alpha = function()
		return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
	end
	-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
	vim.g.transparency = 0.9
	vim.g.neovide_background_color = "#0f1117" .. alpha()
	vim.g.neovide_floating_blur_amount_x = 2.0
	vim.g.neovide_floating_blur_amount_y = 2.0

	vim.g.neovide_transparency = 0.8
	vim.g.neovide_scroll_animation_length = 0.3
	vim.g.neovide_cursor_animation_length = 0.13
	vim.g.neovide_cursor_trail_size = 0.8
	vim.g.neovide_cursor_animate_in_insert_mode = false
	vim.g.neovide_cursor_animate_command_line = false
	vim.g.neovide_cursor_vfx_mode = "railgun"
end

-- g.terminal_emulator='kitty '
-- o.term = "kitty"
-- vim.g.R_external_term = 'kitty '

-- set the radian as the default for R (only work when you put these lines in base.lua)
g.R_app = "radian"
g.R_cmd = "R"
g.R_hl_term = 0
-- g.R_args = {}
g.R_bracketed_paste = 1
-- set the rcolsole width and min editor width (automatically enable vsplit as default)
g.R_rconsole_width = 38
g.R_min_editor_width = 18

-- change the vertical bars between splitted panels
opt.fillchars = {
	vert = "▕", -- alternatives │
	fold = " ",
	eob = " ", -- suppress ~ at EndOfBuffer
	diff = "╱", -- alternatives = ⣿ ░ ─
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}

o.termguicolors = true

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Better editor UI
o.number = true
o.numberwidth = 2
o.relativenumber = true
o.signcolumn = "yes"
o.cursorline = true

-- Better editing experience
o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = -1 -- If negative, shiftwidth value is used
o.list = false
-- o.listchars = "trail:·,nbsp:◇,extends:▸,precedes:◂"
-- o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = "unnamedplus"

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- follow the mouse
opt.mouse = "a"

-- vim session options
opt.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Map <leader> to space
g.mapleader = " "
g.maplocalleader = " "

-- remap jk to switch to normal mode
vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })

-- -- enable word count in airline bar
-- g.airline_extensions_tabline_enabled = 1
-- g.airline_extensions_wordcount_filetypes = '\vasciidoc|help|mail|markdown|markdown.pandoc|org|rst|tex|text|vimwiki'
