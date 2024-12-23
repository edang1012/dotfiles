local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local wifi = sbar.add("alias", "Control Center,WiFi", {
	position = "right",
	background = {
		padding_left = -5,
		padding_right = -5,
	},
	click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 'Control Center,WiFi'",
})

local bluetooth = sbar.add("alias", "Control Center,Bluetooth", {
	position = "right",
	background = {
		padding_left = -5,
		padding_right = -10,
	},
	click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 'Control Center,Bluetooth'",
})

local focus = sbar.add("alias", "Control Center,FocusModes", {
	position = "right",
	background = {
		padding_left = -5,
		padding_right = -10,
	},
	click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 'Control Center,FocusModes'",
})

sbar.add("bracket", "widgets.wireless.bracket", { wifi.name, bluetooth.name, focus.name }, {
	background = { color = colors.nord.pn2 },
})

sbar.add("item", "widgets.wireless.padding", {
	position = "right",
	width = settings.group_paddings,
})
