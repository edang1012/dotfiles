local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

-- Execute the event provider binary which provides the event "cpu_update" for
-- the cpu load data, which is fired every 2.0 seconds.
sbar.exec("killall cpu_load >/dev/null; $CONFIG_DIR/helpers/event_providers/cpu_load/bin/cpu_load cpu_update 2.0")

local cpu = sbar.add("graph", "widgets.cpu", 42, {
	position = "right",
	graph = { color = colors.nord.frost2 },
	background = {
		height = 22,
		color = { alpha = 0 },
		border_color = { alpha = 0 },
		drawing = true,
	},
	icon = { string = icons.cpu },
	label = {
		string = "CPU ??%",
		font = {
			family = settings.font.numbers,
			style = settings.font.style_map["Bold"],
			size = 9.0,
		},
		align = "right",
		padding_right = -1,
		width = 0,
		y_offset = 4,
	},
	padding_right = settings.paddings + 6,
})

cpu:subscribe("cpu_update", function(env)
	-- Also available: env.user_load, env.sys_load
	local load = tonumber(env.total_load)
	cpu:push({ load / 100. })

	local color = colors.nord.frost2
	if load > 30 then
		if load < 60 then
			color = colors.nord.aurora3
		elseif load < 80 then
			color = colors.nord.aurora2
		else
			color = colors.nord.aurora1
		end
	end

	cpu:set({
		graph = { color = color },
		label = "CPU " .. env.total_load .. "%",
	})
end)

cpu:subscribe("mouse.clicked", function(env)
	sbar.exec("open -a 'Activity Monitor'")
end)

-- Background around the cpu item
--sbar.add("bracket", "widgets.cpu.bracket", { cpu.name }, {
--	background = { color = colors.nord.pn2, border_color = colors.nord.pn4 },
--})

-- Background around the cpu item
sbar.add("item", "widgets.cpu.padding", {
	position = "right",
	width = settings.group_paddings,
})
