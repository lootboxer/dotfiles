-- Explorer keybindings
vim.keymap.set('n', '<leader>e', function()
  Snacks.explorer()
end, { desc = 'File Explorer' })

-- Set up explorer buffer-local keymaps
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'snacks_explorer',
  callback = function(event)
    local opts = { buffer = event.buf, silent = true }
    
    -- Space to select and move to next item
    vim.keymap.set('n', '<Space>', function()
      -- Toggle selection on current item
      vim.cmd('normal! <CR>')
      -- Move to next item
      vim.cmd('normal! j')
    end, vim.tbl_extend('force', opts, { desc = 'Select and next' }))
  end,
})