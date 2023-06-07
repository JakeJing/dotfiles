-- Defaults
require("lf").setup({
	default_cmd = "lf", -- default `lf` command
	default_action = "edit", -- default action when `Lf` opens a file
	default_actions = {
		-- default action keybindings
		["<C-t>"] = "tabedit",
		["<C-x>"] = "split",
		["<C-v>"] = "vsplit",
		["<C-o>"] = "tab drop",
	},

	winblend = 1, -- transparency level
	dir = "", -- directory where `lf` starts ('gwd' is git-working-directory, ""/nil is CWD)
	direction = "float", -- window type: float horizontal vertical
	border = "curved", -- border kind: single double shadow curved
	height = 0.88, -- height of the *floating* window
	width = 0.9, -- width of the *floating* window
	escape_quit = true, -- map escape to the quit command (so it doesn't go into a meta normal mode)
	focus_on_open = false, -- focus the current file when opening Lf (experimental)
	mappings = true, -- whether terminal buffer mapping is enabled
	tmux = false, -- tmux statusline can be disabled on opening of Lf
	highlights = {
		-- highlights passed to toggleterm
		Normal = { guibg = "#819C3B" },
		NormalFloat = { link = "Normal" },
		FloatBorder = {
			link = "PMenu",
			--   guifg = <VALUE>,
			--   guibg = <VALUE>
		},
	},

	-- Layout configurations
	-- layout_mapping = "<A-u>", -- resize window with this key

	-- views = { -- window dimensions to rotate through
	-- 	{ width = 0.600, height = 0.600 },
	-- 	{
	-- 		width = 1.0 * fn.float2nr(fn.round(0.7 * o.columns)) / o.columns,
	-- 		height = 1.0 * fn.float2nr(fn.round(0.7 * o.lines)) / o.lines,
	-- 	},
	-- 	{ width = 0.800, height = 0.800 },
	-- 	{ width = 0.950, height = 0.950 },
	-- },
})

vim.keymap.set("n", "lf", "<cmd>lua require('lf').start()<CR>", { noremap = true })
