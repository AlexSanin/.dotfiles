return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  opts = {
    -- add any opts here
  },
  keys = {
    { "<leader>aa", function() require("avante.api").ask() end,     desc = "avante: ask",    mode = { "n", "v" } },
    { "<leader>ar", function() require("avante.api").refresh() end, desc = "avante: refresh" },
    { "<leader>ae", function() require("avante.api").edit() end,    desc = "avante: edit",   mode = "v" },
  },
  windows = {
    ---@alias AvantePosition "right" | "left" | "top" | "bottom"
    position = "right",
    wrap = false,        -- similar to vim.o.wrap
    width = 30,         -- default % based on available width in vertical layout
    height = 30,        -- default % based on available height in horizontal layout
    sidebar_header = {
      align = "center", -- left, center, right for title
      rounded = true,
    },
    input = {
      prefix = "> ",
    },
    edit = {
      border = "rounded",
    },
  },
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to setup it properly if you have lazy=true
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
