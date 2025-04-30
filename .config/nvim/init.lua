-- Set leader key before lazy loading
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Load user settings first
require("user.settings")
--require("user.themes")

-- Then load lazy
require("config.lazy")

-- Finally load the rest of user config
require("user.mappings")
