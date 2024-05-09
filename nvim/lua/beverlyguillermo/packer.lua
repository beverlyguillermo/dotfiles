-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'nvim-lua/plenary.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function() 
		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		  ts_update()
	  end
  }

  use {
	'catppuccin/nvim',
	as = 'catppuccin',
	config = function()
		vim.cmd('colorscheme catppuccin-macchiato')
	end
  }

  -- buffer management
  use {
	  'theprimeagen/harpoon',
	  branch = 'harpoon2',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- undo management
  use 'mbbill/undotree'

  -- git
  use 'tpope/vim-fugitive'

  -- lsp
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment the two plugins below if you want to manage the language servers from neovim
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  {'neovim/nvim-lspconfig'},
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }

end)
