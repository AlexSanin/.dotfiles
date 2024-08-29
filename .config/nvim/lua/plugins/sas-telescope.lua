return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  config = function()
    local previewers = require('telescope.previewers')

    local new_maker = function(filepath, bufnr, opts)
      opts = opts or {}
      filepath = vim.fn.expand(filepath)
      vim.loop.fs_stat(filepath, function(_, stat)
        if not stat then return end
        if stat.size > 100000 then
          return
        else
          previewers.buffer_previewer_maker(filepath, bufnr, opts)
        end
      end)
    end

    require('telescope').setup {
      defaults = {
        previewer = true,
        prompt_prefix = "$ ",
        layout_strategy = "horizontal",
        layout_config = { width = 0.99, },
        buffer_previewer_maker = new_maker,
        hidden = true,
        find_command = { 'fd', '--type', 'f', '--no-ignore-vcs' },
        file_ignore_patterns = {
          'node_modules'
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        colorscheme = {
          enable_preview = true
        }
      },
    }

    require('telescope').load_extension('fzf')

    -- Key mappings
    local keymap = vim.keymap.set
    local opts = { silent = true, noremap = true }

    keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
    keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
    keymap("n", "<leader>fs", ":Telescope grep_string<CR>", opts)
    keymap("n", "<leader>gr", ":Telescope lsp_references<CR>", opts)
    keymap("n", "<leader>gd", ":Telescope lsp_definitions<CR>", opts)
    keymap('n', '<C-p>', ":Telescope git_files<CR>", opts)

    keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
    keymap("n", "<leader>vh", ":Telescope help_tags<CR>", opts)
    keymap("n", "<leader>sh", ":Telescope search_history<CR>", opts)
    keymap("n", "<leader>fm", ":Telescope marks<CR>", opts)
    keymap("n", "<leader>sw", ":Telescope diagnostics<CR>", opts)
    keymap("n", "<leader>ps", function()
      require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
    end)
  end
}
