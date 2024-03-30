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
  use { "lewis6991/impatient.nvim" } --increase lua script loading time
  use { "goolord/alpha-nvim" }       --startup screen nvim
  --use { "ahmedkhalf/project.nvim" }
  use { "RRethy/vim-illuminate" }    --highlights word useage unde cursor
  --lsp
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    }
  }
  --Themes
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "ellisonleao/gruvbox.nvim" }
  use 'rose-pine/neovim'
  use 'navarasu/onedark.nvim'
  use 'shaunsingh/nord.nvim'
  use { 'akinsho/bufferline.nvim' }
  use { 'nvim-lualine/lualine.nvim', }
  use 'nvim-tree/nvim-web-devicons'
  use "folke/tokyonight.nvim"
  use 'fxn/vim-monochrome'
  use "oxfist/night-owl.nvim"
  --Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  --Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
  }

  --File tree
  use 'nvim-tree/nvim-tree.lua'
  --git
  use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  }
  use "tpope/vim-fugitive"
  use({
    "kdheepak/lazygit.nvim",
    requires = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").load_extension("lazygit")
    end,
  })
  --
  use "mbbill/undotree"

  use 'mfussenegger/nvim-dap'

  --DB
  use 'tpope/vim-dadbod'
  use 'kristijanhusak/vim-dadbod-ui'
  use 'kristijanhusak/vim-dadbod-completion'
  --Buffers management
  use 'kazhala/close-buffers.nvim'
  -- opew website vim
  use 'chrishrb/gx.nvim'
  use {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
  }
  use 'christoomey/vim-tmux-navigator'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
