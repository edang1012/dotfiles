local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local soundsource = sbar.add("alias", "SoundSource,SSMainAppMenuIcon", {
	position = "right",
	background = {
		padding_left = -2,
		padding_right = -5,
	},
	click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 'SoundSource,SSMainAppMenuIcon'",
})

sbar.add("bracket", "widgets.soundsource.bracket", { soundsource.name }, {
	background = { color = colors.nord.pn2 },
})

sbar.add("item", "widgets.soundsource.padding", {
	position = "right",
	width = settings.group_paddings,
})
