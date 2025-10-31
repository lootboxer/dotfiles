vim.keymap.set('n', '<leader>:', function()
  Snacks.picker.command_history()
end, { desc = 'Command History' })
vim.keymap.set('n', '<leader>cR', function()
  Snacks.rename.rename_file()
end, { desc = 'Rename File' })

vim.keymap.set('n', '<leader>z', function()
  Snacks.zen()
end, { desc = 'Toggle Zen Mode' })
vim.keymap.set('n', '<leader>Z', function()
  Snacks.zen.zoom()
end, { desc = 'Toggle Zoom' })

vim.keymap.set({ 'n', 't' }, ']]', function()
  Snacks.words.jump(vim.v.count1)
end, { desc = 'Next Reference' })
vim.keymap.set({ 'n', 't' }, '[[', function()
  Snacks.words.jump(-vim.v.count1)
end, { desc = 'Prev Reference' })

vim.keymap.set('n', '<leader>N', function()
  Snacks.win {
    file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
    width = 0.6,
    height = 0.6,
    wo = {
      spell = false,
      wrap = false,
      signcolumn = 'yes',
      statuscolumn = ' ',
      conceallevel = 3,
    },
  }
end, { desc = 'Neovim News' })

require 'keybindings.snacks.buffers'
require 'keybindings.snacks.grep'
require 'keybindings.snacks.lsp'
require 'keybindings.snacks.notifications'
require 'keybindings/snacks/find'
require 'keybindings/snacks/terminal'
require 'keybindings/snacks/git'
