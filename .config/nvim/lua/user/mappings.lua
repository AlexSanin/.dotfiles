-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true, noremap = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
--   LSP
keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)

-- Resize with arrows
keymap("n", "<M-j>", ":resize -2<CR>", opts)
keymap("n", "<M-k>", ":resize +2<CR>", opts)
keymap("n", "<M-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-l>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
--keymap("n", "<TAB>", ":bnext<CR>", opts)
--keymap("n", "<S-TAB>", ":bprevious<CR>", opts)
-- Close buffer in split and open next
--
keymap("n", "<leader>wc", ":bnext | bd #<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Don't use arrows really, just dont
keymap("i", "<Up>", "<NOP>")
keymap("i", "<Down>", "<NOP>")
keymap("i", "<Left>", "<NOP>")
keymap("i", "<Right>", "<NOP>")

keymap("n", "<Up>", "<NOP>")
keymap("n", "<Down>", "<NOP>")
keymap("n", "<Left>", "<NOP>")
keymap("n", "<Right>", "<NOP>")

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Eslint
keymap("n", "<leader>;", ":EslintFixAll<CR>", opts)

-- Git
--" setup mapping to call :LazyGit
keymap("n", "<leader>gg", ":LazyGit<CR>")

--swap lines
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

--move line below to the current
keymap("n", "J", "mzJ`z")

--scroll down
keymap("n", "<C-d>", "<C-d>zz")
--scroll up
keymap("n", "<C-u>", "<C-u>zz")

keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
--save file
keymap("n", "<c-s>", ":w<cr>")

--replace all row with yanked data
keymap("x", "<leader>p", [["_dP]])

--copy to the system clipboard
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

keymap({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
keymap("i", "<C-c>", "<Esc>")

keymap("n", "Q", "<nop>")
--keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
keymap("n", "<leader>f", vim.lsp.buf.format)


--replace word under cursor
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--make bash script executable
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Mapping gx to open URL under cursor
keymap('n', 'gx',
  ':lua (function() local url = vim.fn.expand("<cfile>"); local command = ""; if vim.fn.has("mac") == 1 then command = "open"; elseif vim.fn.has("unix") == 1 then command = "xdg-open"; elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then command = "start"; end; if command ~= "" then vim.cmd("! " .. command .. " " .. url); else print("Unsupported OS for URL opening"); end end)()<CR>',
  opts)

keymap('n', '<leader>bd', "<cmd>:w <bar> %bd <bar> e# <bar> bd# <CR>", opts)

--vim-tmux-navigator
keymap('n', '<C-h>', ':TmuxNavigateLeft<CR>', opts)
keymap('n', '<C-j>', ':TmuxNavigateDown<CR>', opts)
keymap('n', '<C-k>', ':TmuxNavigateUp<CR>', opts)
keymap('n', '<C-l>', ':TmuxNavigateRight<CR>', opts)
keymap('n', '<c-\\>', ':TmuxNavigatePrevious<CR>', opts)
--COPILOT
--keymap('i', '<C-r>', 'copilot#Accept("<CR>")', {
--  expr = true,
--  replace_keycodes = false,
--})
keymap('n', '<leader>d', vim.diagnostic.open_float, { noremap = true, silent = true })
keymap('n', '[d', vim.diagnostic.goto_prev, { noremap = true, silent = true })
keymap('n', ']d', vim.diagnostic.goto_next, { noremap = true, silent = true })
keymap('n', '<leader>q', vim.diagnostic.setloclist, { noremap = true, silent = true })

keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { silent = true, noremap = true })
keymap("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { silent = true, noremap = true })
keymap("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { silent = true, noremap = true })
keymap("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { silent = true, noremap = true })
keymap("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { silent = true, noremap = true })

keymap('n', '<leader>m', ':marks<CR>', opts)


--OBSIDIAN

keymap("n", "<leader>ot", "<cmd>:ObsidianNewFromTemplate<cr>", opts)
keymap("n", "<leader>oi", "<cmd>:ObsidianTemplate<cr>", opts)

--Quickfix
--got to the previus lsp suggestions
keymap("n", "<leader>k", "<cmd>cnext<CR>zz")
--got to the next lsp suggestions
keymap("n", "<leader>j", "<cmd>cprev<CR>zz")
