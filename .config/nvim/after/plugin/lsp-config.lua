local lsp = require('lsp-zero').preset({})

require 'lspconfig'.sqlls.setup {
  cmd = { "/Users/sas/.local/share/nvim/mason/bin/sql-language-server", "up", "--method", "stdio" },
  filetypes = { "sql", "mysql" },
  root_dir = function(fname)
    return require 'lspconfig'.util.path.dirname(fname)
  end,
  settings = {},
}

require'lspconfig'.solargraph.setup {
  settings = {
    solargraph = {
      diagnostics = true
    }
  }
}

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  'tsserver',
  'eslint',
  'rust_analyzer',
  'sqlls'
})


lsp.setup()

--show diagnostic
vim.diagnostic.config({
  virtual_text = true,
})
