return {
  --{
  --  "sainnhe/everforest",
  --  lazy = false,
  --  priority = 1001,
  --  config = function()
  --    vim.g.everforest_background = 'soft'
  --    vim.g.everforest_better_performance = 1
  --    vim.cmd.colorscheme("everforest")
  --  end,
  --},
  -- Keep your other themes here, but they won't override this one due to priority
  --{
  --  "phha/zenburn.nvim",
  --  lazy = false,
  --  priority = 1001,
  --  config = function()
  --    require("zenburn").setup()
  --    vim.cmd.colorscheme("zenburn")
  --  end,
  --}
  --{
  --  'shaunsingh/nord.nvim',
  --  config = function()
  --    vim.o.background = "dark"
  --    vim.cmd.colorscheme("nord")
  --  end,
  --}
   {
     "oxfist/night-owl.nvim",
     lazy = false,
     priority = 1000,
     config = function()
       require("night-owl").setup({
         bold = true,
         italic = true,
         underline = true,
         undercurl = true,
         --transparent_background = true,
       })
       vim.cmd.colorscheme("night-owl")
       vim.o.background = "dark"
     end,
   },

  --- -- GitHub Light theme
  --- {
  ---   "projekt0n/github-nvim-theme",
  ---   lazy = false,
  ---   priority = 999,
  --- },

  --- -- Solarized Light theme
  --- {
  ---   "craftzdog/solarized-osaka.nvim",
  ---   lazy = false,
  ---   priority = 998,
  --- },

  --- -- Gruvbox theme (already has light mode)
  --- {
  ---   "ellisonleao/gruvbox.nvim",
  ---   lazy = false,
  ---   priority = 997,
  --- },

  --- -- Catppuccin theme (with Latte light variant)
  --- {
  ---   "catppuccin/nvim",
  ---   name = "catppuccin",
  ---   lazy = false,
  ---   priority = 996,
  --- },

  --- -- Rose Pine theme (with Dawn light variant)
  --- {
  ---   "rose-pine/neovim",
  ---   name = "rose-pine",
  ---   lazy = false,
  ---   priority = 995,
  --- }
} ---
