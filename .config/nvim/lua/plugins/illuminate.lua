return {
  'RRethy/vim-illuminate',
  config = function()
    -- Blacklist filetypes for illumination
    vim.g.Illuminate_ftblacklist = { 'alpha', 'NvimTree' }

    -- Key mappings for navigating between illuminated references
    vim.keymap.set('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', { noremap = true, silent = true })
    vim.keymap.set('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true, wrap=true}<cr>', { noremap = true, silent = true })
  end
}
