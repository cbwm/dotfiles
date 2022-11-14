-- [[ plugins.lua ]]
-- reference: https://github.com/mikebarkmin/.dotfiles

-- packer installation
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- local use = require('packer').use
-- local map = vim.api.nvim_set_keymap
-- require('packer').startup(function()
return require('packer').startup(function(use)
    -- package manager
    use 'wbthomason/packer.nvim'

    -- LSP stuff
    use {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    }
    use {
        "williamboman/mason-lspconfig.nvim",
        config = [[ require('plugins/mason-lspconfig') ]],
    }
    use {
        "neovim/nvim-lspconfig",
        config = [[ require('plugins/lspconfig')  ]],
    }

    -- completion plugin
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",       -- nvim-cmp source for neovim builtin LSP client
            "hrsh7th/cmp-nvim-lua",       -- nvim-cmp source for nvim lua
            "hrsh7th/cmp-buffer",         -- nvim-cmp source for buffer words
            "hrsh7th/cmp-path",           -- nvim-cmp source for filesystem paths
            "saadparwaiz1/cmp_luasnip",   -- luasnip completion source for nvim-cmp
            "kdheepak/cmp-latex-symbols", -- support for latex symbols (i.e. in Julia)
        },
        config = [[ require('plugins/cmp') ]]
    }

    -- snippet engine
    use {
        "L3MON4D3/LuaSnip",
        requires = { "rafamadriz/friendly-snippets" },
        config = [[ require('plugins/luasnip') ]]
    }

    -- top bar / file tabs
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    -- file explorer
    use {
        "nvim-tree/nvim-tree.lua",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-tree").setup()
        end
    }

    -- statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function()
            require'lualine'.setup {
                options = {
                    theme = "catppuccin"
                }
            }
        end
    }

    -- catppuccin, the theme for cats! :3
    use {
        "catppuccin/nvim", as = "catppuccin",
        config = [[ require('plugins/catppuccin') ]]
    }

    -- better syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync=true })
            ts_update()
        end,
        config = [[ require('plugins/treesitter') ]]
    }

    -- terminal toggle
    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = [[ require('plugins/toggleterm') ]]
    }

    -- comment stuff out with gcc or gc
    use {
        'tpope/vim-commentary'
    }

    -- surround stuff with parens, brackets, quotes, etc. with cs and ys
    use {
        'tpope/vim-surround'
    }

    -- git indications in the gutter
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require'gitsigns'.setup()
        end,
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
end)

