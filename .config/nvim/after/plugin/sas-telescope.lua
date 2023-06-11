--TELESCOPE
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
    layout_config = { width = 0.99 },
    buffer_previewer_maker = new_maker,
    hidden = true
  },
  find_files = {
    hidden = true
  },
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
    },
  },
}

require('telescope').load_extension('fzf')
