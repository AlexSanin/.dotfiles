" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

  Plug 'neovim/nvim-lspconfig' "native lsp
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'morhetz/gruvbox'
  "Start screen
  Plug 'mhinz/vim-startify' 
  "Line in the bottom
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

call plug#end()

"set completeopt=menu,menuone,noselect
"
"lua <<EOF
"  -- Setup nvim-cmp.
"  local cmp = require'cmp'
"
"  cmp.setup({
"    snippet = {
"      expand = function(args)
"        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
"      end,
"    },
"    mapping = {
"      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
"      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
"      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
"      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
"      ['<C-e>'] = cmp.mapping({
"        i = cmp.mapping.abort(),
"        c = cmp.mapping.close(),
"      }),
"      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
"    },
"    sources = cmp.config.sources({
"      { name = 'nvim_lsp' },
"      { name = 'buffer' },
"    })
"  })
"
"  -- Set configuration for specific filetype.
"  cmp.setup.filetype('gitcommit', {
"    sources = cmp.config.sources({
"      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
"    }, {
"      { name = 'buffer' },
"    })
"  })
"
"  -- Setup lspconfig.
"  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
"  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
"  require('lspconfig')['tsserver'].setup {
"    capabilities = capabilities
"  }
"EOF
"
""vim.opt.completeopt={"menu","menuone","noselect"}
