return {
  "oxfist/night-owl.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("night-owl").setup({
      bold = true,
      italic = true,
      underline = true,
      undercurl = true,
      transparent_background = true,
    })
    vim.cmd.colorscheme("night-owl")
  end,
}
