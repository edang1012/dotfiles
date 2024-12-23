local settings = require("settings")
local colors = require("colors")
local icons = require("icons")

-- Padding item required because of bracket
--sbar.add("item", { position = "right", width = settings.group_paddings })

local cal = sbar.add("item", {
	icon = {
		color = colors.nord.ss3,
		padding_left = 4,
		padding_right = -2,
		font = {
			--style = settings.font.style_map["Black"],
			size = 13.0,
		},
	},
	label = {
		color = colors.nord.ss3,
		padding_right = 10,
		width = 80,
		align = "right",
		--font = { family = settings.font.numbers },
	},
	position = "right",
	update_freq = 1,
	padding_left = 1,
	padding_right = 1,
	background = {
		drawing = false,
		--color = colors.nord.pn2,
		--border_color = colors.nord.pn4,
		--border_width = 1,
	},
	--click_script = "open -a 'Calendar'",
	click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 'Control Center,Clock'",
	--click_script = 'osascript -e \'tell application "System Events" to tell process "Control Center" to perform action "AXPress" of menu bar item 2 of menu bar 1\'',
})

local control_center = sbar.add("item", "widgets.control_center", {
	position = "right",
	icon = {
		--font = { size = settings.font.sizes.icons },
		string = icons.control_center,
		color = colors.white,
		drawing = true,
		--padding_left = settings.item_padding,
		--padding_right = settings.item_padding,
	},
	label = {
		drawing = false,
	},
	click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 'Control Center,BentoBox'",
})

-- Padding item required because of bracket
sbar.add("item", { position = "right", width = settings.group_paddings })

cal:subscribe({ "forced", "routine", "system_woke" }, function(env)
	cal:set({ icon = os.date("%a, %b. %d"), label = os.date("%I:%M %p") })
end)
