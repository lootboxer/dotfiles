return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    require('mini.ai').setup()
    require('mini.surround').setup()
    -- snacked: require('mini.starter').setup()
    -- snacked: require('mini.bufremove').setup()
    -- snacked: require('mini.statusline').setup { use_icons = vim.g.have_nerd_font }
  end,
}
