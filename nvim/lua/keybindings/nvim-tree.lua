local api = require("nvim-tree.api")

-- custom mappings
vim.keymap.set("n", "<leader>e", function() 
end, { desc = "File Explorer" })
vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
