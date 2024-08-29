return {
  'ThePrimeagen/harpoon',
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon.setup()
    -- REQUIRED

    -- Keybindings
    vim.keymap.set("n", "<leader>a", function() harpoon.mark.add_file() end)
    vim.keymap.set("n", "<C-e>", function() harpoon.ui.toggle_quick_menu() end)

    vim.keymap.set("n", "<leader>1", function() harpoon.ui.nav_file(1) end)
    vim.keymap.set("n", "<leader>2", function() harpoon.ui.nav_file(2) end)
    vim.keymap.set("n", "<leader>3", function() harpoon.ui.nav_file(3) end)
    vim.keymap.set("n", "<leader>4", function() harpoon.ui.nav_file(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<TAB>", function() harpoon.ui.nav_prev() end)
    vim.keymap.set("n", "<S-TAB>", function() harpoon.ui.nav_next() end)

    -- Uncomment if you want to use these as buffer navigation instead
    -- vim.keymap.set("n", "<TAB>", ":bnext<CR>", { noremap = true, silent = true })
    -- vim.keymap.set("n", "<S-TAB>", ":bprevious<CR>", { noremap = true, silent = true })
  end
}
