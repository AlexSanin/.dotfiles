require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  --lsp
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
 -- use 'hrsh7th/cmp-nvim-lsp'
 -- use 'hrsh7th/cmp-buffer'
  --use 'hrsh7th/cmp-path'
end)
