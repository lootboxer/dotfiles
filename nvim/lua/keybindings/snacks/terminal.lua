-- Terminal compatibility: Many terminals translate Ctrl+/ differently. Some
-- terminals send <c-/> while others send <c-_> (ASCII 31) for the same key
-- combination. Having both ensures the terminal toggle works consistently
-- across different terminal emulators.
--
-- The <c-_> bindings use desc = 'which_key_ignore' to prevent them from showing
--  up in which-key menus, avoiding duplicate entries since they serve the same
-- function as the <c-/> bindings.
--

vim.keymap.set('n', '<c-/>', function()
  Snacks.terminal()
end, { desc = 'Open Terminal' })
vim.keymap.set('t', '<c-/>', function()
  Snacks.terminal()
end, { desc = 'Close Terminal' })
vim.keymap.set('n', '<c-_>', function()
  Snacks.terminal()
end, { desc = 'which_key_ignore' })
vim.keymap.set('t', '<c-_>', function()
  Snacks.terminal()
end, { desc = 'which_key_ignore' })
