local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

-- Padding item required because of bracket
--sbar.add("item", { width = 5 })

local apple = sbar.add("item", {
	icon = {
		font = { size = 16.0 },
		string = icons.apple,
		padding_right = 8,
		padding_left = 9,
		color = colors.nord.ss3,
	},
	label = { drawing = false },
	background = {
		drawing = false,
		--color = colors.nord.pn2,
		--border_color = colors.nord.pn4,
		--border_width = 1,
	},
	padding_left = 1,
	padding_right = 1,
	click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 0",
})

-- Padding item required because of bracket
sbar.add("item", { width = settings.group_paddings })
