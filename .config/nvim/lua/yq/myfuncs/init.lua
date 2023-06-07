-- word count function and set a command wc for it
function WordCount()
  local line_count = vim.fn.line('$')
  local word_count = vim.fn.wordcount().words
  local char_count = vim.fn.line2byte('$') - 1
  local result = string.format("Lines: %d   Words: %d   Characters: %d", line_count, word_count, char_count)
  print(result)
end
vim.api.nvim_set_keymap('n', '<Leader>wc', ':lua WordCount()<CR>', {noremap = true, silent = true})
vim.cmd("command! -nargs=0 WC lua WordCount()")

-- insert cmdline output at the current cursor
function InlineCommand()
    local cmd = vim.fn.input('Command: ')
    local handle = io.popen(cmd)
    local output = handle:read('*a')
    handle:close()
    output = output:gsub('\n', '')
    vim.api.nvim_command('normal! i' .. output)
end
vim.api.nvim_set_keymap('n', '<Leader>ic', ':lua InlineCommand()<CR>', {noremap = true, silent = true})
vim.cmd("command! -nargs=0 IC lua InlineCommand()")
