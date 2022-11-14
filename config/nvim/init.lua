--[[ init.lua ]]

-- nvim-tree requires disabling netrw at the very start of the init
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
-- vim.g.mapleader = ","
-- vim.g.localleader = "\\"
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.localleader = "\\"

-- IMPORTS
require('vars')         -- Variables
require('plugins')      -- Plugins
require('options')      -- Options
require('keymaps')      -- Keymaps
