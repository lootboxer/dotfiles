return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        ['ui-select'] = { require('telescope.themes').get_dropdown() },
      },
    }

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local builtin = require 'telescope.builtin'

    -- Find
    vim.keymap.set('n', '<leader><space>', builtin.find_files, { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>fc', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Find Config File' })
    vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Find Git Files' })
    vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Recent Files' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
    vim.keymap.set('n', '<leader>,', builtin.buffers, { desc = 'Buffers' })

    -- Grep
    vim.keymap.set('n', '<leader>/', builtin.live_grep, { desc = 'Grep' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Grep' })
    vim.keymap.set('n', '<leader>sb', function()
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { previewer = false })
    end, { desc = 'Buffer Lines' })
    vim.keymap.set('n', '<leader>sB', function()
      builtin.live_grep { grep_open_files = true }
    end, { desc = 'Grep Open Buffers' })
    vim.keymap.set({ 'n', 'x' }, '<leader>sw', builtin.grep_string, { desc = 'Grep Word' })

    -- Search
    vim.keymap.set('n', '<leader>:', builtin.command_history, { desc = 'Command History' })
    vim.keymap.set('n', '<leader>s"', builtin.registers, { desc = 'Registers' })
    vim.keymap.set('n', '<leader>s/', builtin.search_history, { desc = 'Search History' })
    vim.keymap.set('n', '<leader>sa', builtin.autocommands, { desc = 'Autocmds' })
    vim.keymap.set('n', '<leader>sc', builtin.command_history, { desc = 'Command History' })
    vim.keymap.set('n', '<leader>sC', builtin.commands, { desc = 'Commands' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Diagnostics' })
    vim.keymap.set('n', '<leader>sD', function()
      builtin.diagnostics { bufnr = 0 }
    end, { desc = 'Buffer Diagnostics' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Help Pages' })
    vim.keymap.set('n', '<leader>sH', builtin.highlights, { desc = 'Highlights' })
    vim.keymap.set('n', '<leader>sj', builtin.jumplist, { desc = 'Jumps' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Keymaps' })
    vim.keymap.set('n', '<leader>sl', builtin.loclist, { desc = 'Location List' })
    vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = 'Marks' })
    vim.keymap.set('n', '<leader>sM', builtin.man_pages, { desc = 'Man Pages' })
    vim.keymap.set('n', '<leader>sq', builtin.quickfix, { desc = 'Quickfix List' })
    vim.keymap.set('n', '<leader>s.', builtin.resume, { desc = 'Resume' })
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Search Neovim Files' })
    vim.keymap.set('n', '<leader>uC', builtin.colorscheme, { desc = 'Colorschemes' })

    -- Git
    vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = 'Git Branches' })
    vim.keymap.set('n', '<leader>gl', builtin.git_commits, { desc = 'Git Log' })
    vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Git Status' })
    vim.keymap.set('n', '<leader>gS', builtin.git_stash, { desc = 'Git Stash' })
    vim.keymap.set('n', '<leader>gf', builtin.git_bcommits, { desc = 'Git Log File' })
  end,
}
