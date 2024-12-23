local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local batfi = sbar.add("alias", "BatFi,Item-0", {
	position = "right",
	background = {
		padding_left = -7,
		padding_right = -5,
	},
	click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 'BatFi,Item-0'",
})

local soundsource = sbar.add("alias", "SoundSource,SSMainAppMenuIcon", {
	position = "right",
	background = {
		padding_left = -7,
		padding_right = -5,
	},
	click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 'SoundSource,SSMainAppMenuIcon'",
})

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

--sbar.add("bracket", "widgets.menuitem.bracket", { wifi.name, bluetooth.name, focus.name }, {
--	background = { color = colors.nord.pn2 },
--})

sbar.add("item", "widgets.menuitem.padding", {
	position = "right",
	width = settings.group_paddings,
})
