local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- using packer.nvim
  use 'wbthomason/packer.nvim'
  -- My plugins here
  use { "lewis6991/impatient.nvim" }
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "goolord/alpha-nvim" }
  use { "ahmedkhalf/project.nvim" }
  --lsp
  use 'neovim/nvim-lspconfig' --native lsp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use { "hrsh7th/cmp-nvim-lua" }
  use 'L3MON4D3/LuaSnip'
  use { "RRethy/vim-illuminate" }
  --Themes
  use { "kyazdani42/nvim-web-devicons", opt = true }
  use { "akinsho/bufferline.nvim" }
  use { "nvim-lualine/lualine.nvim" }
  -- Colorschemes
  use 'morhetz/gruvbox'
  use 'shaunsingh/solarized.nvim'
  use 'NLKNguyen/papercolor-theme'
  use "folke/tokyonight.nvim" 
  use "lunarvim/darkplus.nvim" 
  --Start screen
  --use 'mhinz/vim-startify' 
  --Line in the bottom
  --use 'vim-airline/vim-airline'
  --use 'vim-airline/vim-airline-themes'
  --Telescope
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  -- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  --Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  --File tree 
  use 'kyazdani42/nvim-tree.lua'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
