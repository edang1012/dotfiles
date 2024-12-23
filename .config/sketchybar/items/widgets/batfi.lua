local colors = require("colors")
local settings = require("settings")

local batfi = sbar.add("alias", "BatFi,Item-0", {
	position = "right",
	background = {
		padding_left = -2,
		padding_right = -5,
	},
	click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 'BatFi,Item-0'",
})

sbar.add("bracket", "widgets.batfi.bracket", { batfi.name }, {
	background = { color = colors.nord.pn2 },
})

sbar.add("item", "widgets.batfi.padding", {
	position = "right",
	width = settings.group_paddings,
})
