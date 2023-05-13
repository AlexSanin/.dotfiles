require("nvim-tree").setup({
    update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {},
    },
    filters = {
        dotfiles = false
    },
    git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 400,
    },
})
