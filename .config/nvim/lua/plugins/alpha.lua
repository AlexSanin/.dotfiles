return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")

      -- Header
      dashboard.section.header.val = {
        [[                               __                ]],
        [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
      }

      -- Buttons
      dashboard.section.buttons.val = {
        dashboard.button("f", "󰈞 " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        -- dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", " " .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }

      -- Footer
      local function footer()
        return "sas config"
      end
      dashboard.section.footer.val = footer()

      -- Highlighting options
      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "Include"
      dashboard.section.buttons.opts.hl = "Keyword"

      -- Set noautocmd
      dashboard.opts.opts.noautocmd = true

      -- Apply the setup
      alpha.setup(dashboard.opts)
    end,
  }
}
