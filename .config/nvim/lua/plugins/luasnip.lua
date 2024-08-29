return {
  'L3MON4D3/LuaSnip',
  config = function()
    local luasnip = require('luasnip')

    -- Extend filetypes
    luasnip.filetype_extend("javascript", { "javascript" })
    luasnip.filetype_extend("typescript", { "javascript" })
    luasnip.filetype_extend("javascriptreact", { "javascript" })
    luasnip.filetype_extend("typescriptreact", { "javascript" })
    luasnip.filetype_extend("javascript", { "javascriptreact" })
    luasnip.filetype_extend("typescript", { "typescriptreact" })

    -- Load VSCode-style snippets
    require("luasnip.loaders.from_vscode").lazy_load()
  end
}
