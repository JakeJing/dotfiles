-- define map function for key mappingold
local function map(m, k, v)
	vim.keymap.set(m, k, v, { noremap = true, silent = true })
end

-- fine cmdline
-- map('n', ':', '<cmd>FineCmdline<CR>') -- removed since the popup window is confusing for multiple panels

-- remap n to clear the highlight
map("n", "n", "<C-L>")

-- to save or overwrite a vim session via mksession! and quite
map("n", "ms", ":mks!<CR>ZZ")

-- find the help in the vertical splitted window (redundant since I set vsplit as the default in init.lua)
-- map("n", "vh", ":vert help ")

-- Mimic shell movements
-- map({"i", "n"}, "<C-E>", "<ESC>A")
-- map({"i", "n"}, "<C-A>", "<ESC>I")
map("n", "<C-E>", "$a")
map("n", "<C-A>", "0i")
map("i", "<C-E>", "<ESC>A")
map("i", "<C-A>", "<ESC>I")
map("v", "<C-E>", "$")
map("v", "<C-A>", "0")

-- map ctrl+K to clear to the end
map("i", "<C-K>", "<ESC>d$a")

-- map backspace to delete
map("n", "<BS>", "a<BS>")

-- command line mode mapping
vim.cmd([[cnoremap <C-A> <Home>]])
vim.cmd([[cnoremap <A-BS> <C-W>]])
vim.cmd([[cnoremap <A-left> <S-left>]])
vim.cmd([[cnoremap <A-right> <S-right>]])

-- map alt key + H/L to move forward and backward by words by using the real character generated
map("n", "˙", "B") -- alt-h map to one word start
map("n", "¬", "w") -- alt-l map to one word end
map("v", "˙", "B") -- alt-h map to one word start
map("v", "¬", "w") -- alt-l map to one word end
map("i", "˙", "<ESC>Bi") -- alt-h map to one word start <insert mode>
map("i", "¬", "<ESC>wa") -- alt-l map to one word end <insert mode>
map("i", "∆", "<ESC>i") -- alt-j map to one word end <insert mode>
map("i", "˚", "<ESC>la") -- alt-k map to one word end <insert mode>
-- map("n", "˙", "<S-B>") -- alt-h map to one word start
-- map("n", "¬", "<S-E>") -- alt-l map to one word end
-- map("i", "˙", "<ESC><S-B>i") -- alt-h map to one word start <insert mode>
-- map("i", "¬", "<ESC><S-E>a") -- alt-l map to one word end <insert mode>
-- map("i", "∆", "<Left>") -- alt-j map to move left
-- map("i", "˚", "<Right>") -- alt-k map to move right

-- map esc to exit the edit in terminal mode
-- map("t", "<ESC>", "<C-\\><C-N>") -- a bit problematic

-- remap the switch between files and delete current file in the buffer (note: it doesn't support dictionary mapping for differnet modes)
-- map("n", "<C-W><C-W>", "<C-6>")
map("n", "<C-W><C-W>", ":bnext<CR>")
map("t", "<C-W><C-W>", "<C-\\><C-N>:bnext<CR>") -- seem to be ok for vifm in terminal mode
map("n", "<C-X>", "<CMD>bd!<CR>") -- delete and force delete file from buffer if no new save

-- remap to resize the splitted window
-- map("n", "=", "<C-W>>")
-- map("n", "-", "<C-W><")
map("n", "=", "<CMD>vertical resize +10<CR>")
map("n", "-", "<CMD>vertical resize -5<CR>")

-- switch split windows from vert to horizontal or vice versa
map("n", "<leader>th", "<C-W>t<C-W>K<CMD>resize -10<CR>")
map("n", "<leader>tv", "<C-W>t<C-W>H<CMD>vertical resize +20<CR>")

-- delete around a word at the current location
map("n", "nn", "ww")
map("n", "dn", "daw")
map("n", "dw", "daw")
map("n", "da", "d0")
map("n", "de", "d$")
map("n", "cw", "caw")
map("n", "yw", "yaw")

-- tabvifm keymapping
map("n", "vf", "<CMD>Vifm<CR>")

-- key mapping for autoformating
map("n", "<leader>lf", "<CMD>lua vim.lsp.buf.formatting()<CR>")

-- press S is aliased to replace all
-- map("n", "<S-s>", ":%s//g<left><left>")
-- map("n", "S", ":%s//g<left><left>")
