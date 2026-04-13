return { -- Fuzzy Finder (files, lsp, etc)
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    require("telescope").setup {
      defaults = {
        borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
      },
    }

    pcall(require("telescope").load_extension, "fzf")

    local builtin = require "telescope.builtin"

    -- Find
    vim.keymap.set("n", "<leader><space>", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
    vim.keymap.set("n", "<leader>fc", function()
      builtin.find_files { cwd = vim.fn.stdpath "config" }
    end, { desc = "Find Config File" })
    vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Find Git Files" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent Files" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>,", builtin.buffers, { desc = "Buffers" })

    -- Grep
    vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Grep" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Grep" })
    vim.keymap.set("n", "<leader>sb", function()
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown { previewer = false })
    end, { desc = "Buffer Lines" })
    vim.keymap.set("n", "<leader>sB", function()
      builtin.live_grep { grep_open_files = true }
    end, { desc = "Grep Open Buffers" })
    vim.keymap.set({ "n", "x" }, "<leader>sw", builtin.grep_string, { desc = "Grep Word" })

    -- Search
    vim.keymap.set("n", "<leader>:", builtin.command_history, { desc = "Command History" })
    vim.keymap.set("n", '<leader>s"', builtin.registers, { desc = "Registers" })
    vim.keymap.set("n", "<leader>s/", builtin.search_history, { desc = "Search History" })
    vim.keymap.set("n", "<leader>sa", builtin.autocommands, { desc = "Autocmds" })
    vim.keymap.set("n", "<leader>sc", builtin.command_history, { desc = "Command History" })
    vim.keymap.set("n", "<leader>sC", builtin.commands, { desc = "Commands" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Diagnostics" })
    vim.keymap.set("n", "<leader>sD", function()
      builtin.diagnostics { bufnr = 0 }
    end, { desc = "Buffer Diagnostics" })
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Help Pages" })
    vim.keymap.set("n", "<leader>sH", builtin.highlights, { desc = "Highlights" })
    vim.keymap.set("n", "<leader>sj", builtin.jumplist, { desc = "Jumps" })
    vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Keymaps" })
    vim.keymap.set("n", "<leader>sl", builtin.loclist, { desc = "Location List" })
    vim.keymap.set("n", "<leader>sm", builtin.marks, { desc = "Marks" })
    vim.keymap.set("n", "<leader>smp", function()
      -- Show marks from all buffers in the current project
      local pickers = require "telescope.pickers"
      local finders = require "telescope.finders"
      local conf = require("telescope.config").values

      local all_marks = {}

      -- Get current project root (working directory)
      local project_root = vim.fn.getcwd()

      local git_check = vim.fn.system("git -C " .. vim.fn.shellescape(project_root) .. " rev-parse --git-dir 2>/dev/null")
      local is_git_repo = vim.v.shell_error == 0

      local function is_git_ignored(filepath)
        if not is_git_repo then
          return false
        end
        vim.fn.system("git -C " .. vim.fn.shellescape(project_root) .. " check-ignore -q " .. vim.fn.shellescape(filepath))
        return vim.v.shell_error == 0
      end

      -- Get all loaded buffers
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buf) then
          local bufname = vim.api.nvim_buf_get_name(buf)
          -- Only include buffers that belong to the current project and are not git-ignored
          if bufname ~= "" and vim.startswith(bufname, project_root) and not is_git_ignored(bufname) then
            -- Get marks for this buffer
            local marks = vim.fn.getmarklist(buf)
            for _, mark in ipairs(marks) do
              if mark.mark:match("^'[a-zA-Z]") then
                table.insert(all_marks, {
                  bufnr = buf,
                  lnum = mark.pos[2],
                  col = mark.pos[3],
                  text = mark.mark:sub(2, 2),
                  filename = bufname,
                })
              end
            end
          end
        end
      end

      -- Also get global marks that point to files in the current project
      local global_marks = vim.fn.getmarklist()
      for _, mark in ipairs(global_marks) do
        if mark.mark:match("^'[A-Z0-9]") and mark.file then
          -- Only include global marks that point to files in the current project and are not git-ignored
          if vim.startswith(mark.file, project_root) and not is_git_ignored(mark.file) then
            table.insert(all_marks, {
              bufnr = vim.fn.bufnr(mark.file),
              lnum = mark.pos[2],
              col = mark.pos[3],
              text = mark.mark:sub(2, 2),
              filename = mark.file,
            })
          end
        end
      end

      if #all_marks == 0 then
        vim.notify("No marks found in project: " .. vim.fn.fnamemodify(project_root, ":~"), vim.log.levels.INFO)
        return
      end

      pickers.new({}, {
        prompt_title = "Project Marks (" .. vim.fn.fnamemodify(project_root, ":~") .. ")",
        finder = finders.new_table {
          results = all_marks,
          entry_maker = function(entry)
            return {
              value = entry,
              display = string.format("[%s] %s:%d:%d", entry.text, vim.fn.fnamemodify(entry.filename, ":~:."), entry.lnum, entry.col),
              ordinal = entry.filename .. " " .. entry.text,
              filename = entry.filename,
              lnum = entry.lnum,
              col = entry.col,
            }
          end,
        },
        previewer = conf.grep_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end, { desc = "Project Marks" })
    vim.keymap.set("n", "<leader>smd", function()
      vim.ui.input({ prompt = "Delete marks (e.g., a, abc, a-z): " }, function(input)
        if input and input ~= "" then
          vim.cmd("delmarks " .. input)
          vim.notify("Deleted marks: " .. input, vim.log.levels.INFO)
        end
      end)
    end, { desc = "Delete Marks" })
    vim.keymap.set("n", "<leader>smD", function()
      vim.cmd("delmarks!")
      vim.notify("Deleted all marks in current buffer", vim.log.levels.INFO)
    end, { desc = "Delete All Buffer Marks" })
    vim.keymap.set("n", "<leader>smx", function()
      vim.cmd("delmarks A-Z0-9")
      vim.notify("Deleted all global marks", vim.log.levels.INFO)
    end, { desc = "Delete All Global Marks" })
    vim.keymap.set("n", "<leader>sM", builtin.man_pages, { desc = "Man Pages" })
    vim.keymap.set("n", "<leader>sq", builtin.quickfix, { desc = "Quickfix List" })
    vim.keymap.set("n", "<leader>s.", builtin.resume, { desc = "Resume" })
    vim.keymap.set("n", "<leader>sn", function()
      builtin.find_files { cwd = vim.fn.stdpath "config" }
    end, { desc = "Search Neovim Files" })
    vim.keymap.set("n", "<leader>uC", builtin.colorscheme, { desc = "Colorschemes" })

    -- Git
    vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Git Branches" })
    vim.keymap.set("n", "<leader>gl", builtin.git_commits, { desc = "Git Log" })
    vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git Status" })
    vim.keymap.set("n", "<leader>gS", builtin.git_stash, { desc = "Git Stash" })
    vim.keymap.set("n", "<leader>gf", builtin.git_bcommits, { desc = "Git Log File" })
  end,
}
