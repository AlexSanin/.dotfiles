return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		-- REQUIRED
		harpoon:setup()
		-- REQUIRED
	end,
	keys = {
		{ "<leader>a", function() require("harpoon"):list():add() end, desc = "Mark file with harpoon" },
		{ "<leader>1", function() require("harpoon"):list():select(1) end, desc = "Navigate to harpoon file 1" },
		{ "<leader>2", function() require("harpoon"):list():select(2) end, desc = "Navigate to harpoon file 2" },
		{ "<leader>3", function() require("harpoon"):list():select(3) end, desc = "Navigate to harpoon file 3" },
		{ "<leader>4", function() require("harpoon"):list():select(4) end, desc = "Navigate to harpoon file 4" },
		{ "<leader>5", function() require("harpoon"):list():select(5) end, desc = "Navigate to harpoon file 5" },
		{ "<leader>6", function() require("harpoon"):list():select(6) end, desc = "Navigate to harpoon file 6" },
		{ "<leader><TAB>", function() require("harpoon"):list():next() end, desc = "Go to next harpoon mark" },
		{ "<leader><S-TAB>", function() require("harpoon"):list():prev() end, desc = "Go to previous harpoon mark" },
		{ "<leader>ha", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Show harpoon marks" },
	},
}
