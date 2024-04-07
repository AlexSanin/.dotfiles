local harpoon = require("harpoon")
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

-- Better window navigation
keymap("n", "<C-h>", ":wincmd h", opts)
keymap("n", "<C-j>", ":wincmd j", opts)
keymap("n", "<C-k>", ":wincmd k", opts)
keymap("n", "<C-l>", ":wincmd l", opts)

-- Resize with arrows
keymap("n", "<M-j>", ":resize -2<CR>", opts)
keymap("n", "<M-k>", ":resize +2<CR>", opts)
keymap("n", "<M-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-l>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
--keymap("n", "<TAB>", ":bnext<CR>", opts)
--keymap("n", "<S-TAB>", ":bprevious<CR>", opts)

-- Clear highlights
--keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Don't use arrows
keymap("n", "<Up>", "<NOP>")
keymap("n", "<Down>", "<NOP>")
keymap("n", "<Left>", "<NOP>")
keymap("n", "<Right>", "<NOP>")


-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Don't use arrows really, just dont
keymap("i", "<Up>", "<NOP>")
keymap("i", "<Down>", "<NOP>")
keymap("i", "<Left>", "<NOP>")
keymap("i", "<Right>", "<NOP>")

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)


-- NvimTree
keymap("n", "<leader>e", ":Oil --float<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fs", ":Telescope grep_string<CR>", opts)
keymap('n', '<C-p>', ":Telescope git_files<CR>", opts)

keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>sw", ":Telescope diagnostics<CR>", opts)
keymap("n", "<leader>ps", function()
  require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end)

-- Eslint
keymap("n", "<leader>;", ":EslintFixAll<CR>", opts)

-- Git
--" setup mapping to call :LazyGit
keymap("n", "<leader>gg", ":LazyGit<CR>")

keymap("n", "<leader>gs", ":Git<CR>", opts)
keymap('n', '<leader>gb', ':Git blame<CR>', opts)
keymap("v", "J", ":m '>+1<CR>gv=gv")

keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
--save file
keymap("n", "<c-s>", ":w<cr>")

keymap("n", "<leader>vwm", function()
  require("vim-with-me").StartVimWithMe()
end)
keymap("n", "<leader>svwm", function()
  require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
keymap("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

keymap({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
keymap("i", "<C-c>", "<Esc>")

keymap("n", "Q", "<nop>")
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
keymap("n", "<leader>f", vim.lsp.buf.format)

keymap("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap("n", "<leader>j", "<cmd>lprev<CR>zz")

keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--GIT fugitive
keymap("x", "<leader>p", [["_dP]])

-- Mapping gx to open URL under cursor
keymap('n', 'gx',
  ':lua (function() local url = vim.fn.expand("<cfile>"); local command = ""; if vim.fn.has("mac") == 1 then command = "open"; elseif vim.fn.has("unix") == 1 then command = "xdg-open"; elseif vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then command = "start"; end; if command ~= "" then vim.cmd("! " .. command .. " " .. url); else print("Unsupported OS for URL opening"); end end)()<CR>',
opts)

--vim-tmux-navigator
keymap('n', '<C-h>', ':TmuxNavigateLeft<CR>', opts)
keymap('n', '<C-j>', ':TmuxNavigateDown<CR>', opts)
keymap('n', '<C-k>', ':TmuxNavigateUp<CR>', opts)
keymap('n', '<C-l>', ':TmuxNavigateRight<CR>', opts)
keymap('n', '<c-\\>', ':TmuxNavigatePrevious<CR>',opts)
--harpoon
