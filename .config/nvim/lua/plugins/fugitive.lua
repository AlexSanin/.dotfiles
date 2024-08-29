return {
  "tpope/vim-fugitive",
  lazy = false,
  config = function()
    local keymap = vim.keymap.set
    -- Silent keymap option
    local opts = { silent = true, noremap = true }

    keymap("n", "<leader>gs", ":Git<CR>", opts)
    keymap('n', '<leader>gb', ':Git blame<CR>', opts)
  end,
}
