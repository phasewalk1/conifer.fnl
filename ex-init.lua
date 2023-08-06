sakura = require("sakura")

local open_tree_bind = "<leader>op"
local open_tree_cmd = "<cmd>lua sakura['open-tree']()<CR>"
local sakura_map_opts = { noremap = true, silent = true }


vim.g.mapleader = ' '
vim.api.nvim_set_keymap("n", open_tree_bind, open_tree_cmd, sakura_map_opts)
