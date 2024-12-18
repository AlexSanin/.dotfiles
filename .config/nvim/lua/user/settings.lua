vim.g.loaded_netrw = 2
vim.g.loaded_netrwPlugin = 1
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.mouse = ""                              -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = false                        -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0                         -- always show tabs
vim.opt.smartcase = true                        -- smart case
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.smarttab = true
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.number = true                           -- set numbered lines
vim.opt.laststatus = 3
vim.opt.showcmd = false
vim.opt.ruler = true
vim.opt.numberwidth = 2       -- set number column width to 2 {default 4}
vim.opt.sidescrolloff = 8
vim.opt.guifont = "Fira Code" -- the font used in graphical neovim applications
vim.opt.fillchars.eob = " "
vim.opt.shortmess:append "c"
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")
vim.opt.autoindent = true --Good auto indent
vim.opt.smartindent = true
vim.opt.autoread = true   -- re-read file after changes in another place
vim.opt.showmatch = true

vim.opt.guicursor = ""

vim.opt.nu = true
--vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.g.markdown_recommended_style = 0

vim.opt.wrap = false
vim.opt.textwidth = 120
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

--watch on files changes
vim.o.autoread = true
--vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
--  command = "if mode() != 'c' | checktime | endif",
--  pattern = { "*" },
--})
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  callback = function()
    if vim.fn.getcmdwintype() == '' then
      vim.cmd('checktime')
    end
  end,
  pattern = { "*" },
})
vim.opt.updatetime = 50
--end of watch on files changes

--vim.opt.colorcolumn = "80"

--rainbow brackets
vim.g.rainbow_active = 1

--transparent bg
--vim.cmd [[
--  highlight Normal guibg=none
--  highlight NonText guibg=none
--  highlight Normal ctermbg=none
--  highlight NonText ctermbg=none
--]]
