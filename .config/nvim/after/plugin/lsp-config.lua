local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()


--show diagnostic
vim.diagnostic.config({
  virtual_text = true,
})
