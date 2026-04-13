return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    })

    vim.api.nvim_create_autocmd({ "BufEnter", "QuitPre" }, {
      nested = false,
      callback = function(e)
        local tree = require("nvim-tree.api").tree

        if not tree.is_visible() then
          return
        end

        local winCount = 0
        for _, winId in ipairs(vim.api.nvim_list_wins()) do
          local cfg = vim.api.nvim_win_get_config(winId)
          if cfg.focusable and cfg.relative == "" then
            winCount = winCount + 1
          end
        end

        if e.event == "QuitPre" and winCount == 2 then
          vim.api.nvim_cmd({ cmd = "qall" }, {})
        end

        if e.event == "BufEnter" and winCount == 1 then
          vim.defer_fn(function()
            tree.toggle({ find_file = true, focus = true })
            tree.toggle({ find_file = true, focus = false })
          end, 10)
        end
      end,
    })
  end,
}
