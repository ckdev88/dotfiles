vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use{
          'nvim-lualine/lualine.nvim',
          requires={'nvim-tree/nvim-web-devicons',opt=true}
  }
  use('nvim-treesitter/nvim-treesitter', {run='TSUpdate'}) -- changed plug into use, Plug instead of Packer
  use('nvim-treesitter/playground')
  use{
          'VonHeikemen/lsp-zero.nvim',
          branch='v2.x',
          requires={
                  {'neovim/nvim-lspconfig'},
                  {'williamboman/mason.nvim'},
                  {'williamboman/mason-lspconfig.nvim'},
                  {'hrsh7th/nvim-cmp'},
                  {'hrsh7th/cmp-nvim-lsp'},
                  {'L3MON4D3/LuaSnip'}
          }
  }

end)
