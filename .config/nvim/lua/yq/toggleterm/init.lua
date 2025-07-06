require("yq.toggleterm.mappings")
-- global setting for terminal
require("toggleterm").setup({
	-- on_create = function() require('toggleterm').exec("Vifm $PWD") end, -- run vifm whenever terminal is created
	-- on_create = function() require('toggleterm').exec("vf") end, -- run vifm whenever terminal is created
	open_mapping = [[<C-s>]], -- you can open and toggle terminal via ctrl+\
	direction = "float",
	float_opts = {
		width = 115, -- use :echo winwidth('%') to get the window width
		height = 32, -- use :echo winheight('%') to get the window height
		border = "double",
		winblend = 1, -- adjust the transparency
	},
	shell = vim.o.shell,
})

-- lazygit toggle
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	on_open = function(_)
		vim.cmd("startinsert!")
		vim.cmd("set laststatus=0")
	end,
	on_close = function(_)
		vim.cmd("set laststatus=3")
	end,
})
function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

-- python3 toggle
local python = Terminal:new({ cmd = "python3", hidden = true })
function _PYTHON_TOGGLE()
	python:toggle()
end

-- R toggle via radian
local R = Terminal:new({ cmd = "r", hidden = true })
function _R_TOGGLE()
	R:toggle()
end

-- vifm toggle (removed, better to use :Vifm directly to enable Ctrl+W window switch)
-- local vifm = Terminal:new { cmd = "vifm $PWD", hidden = true}
-- function _VIFM_TOGGLE()
--   vifm:toggle()
-- end
