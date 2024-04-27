require('luasnip').filetype_extend("javascript", { "javascript" })
require('luasnip').filetype_extend("typescript", { "javascript" })
require('luasnip').filetype_extend("javascriptreact", { "javascript" })
require('luasnip').filetype_extend("typescriptreact", { "javascript" })
--require('luasnip').filetype_extend("javascript", { "javascriptreact" })
--require('luasnip').filetype_extend("typescript", { "typescriptreact" })

require("luasnip.loaders.from_vscode").lazy_load()
