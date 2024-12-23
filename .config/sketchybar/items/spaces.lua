local colors = require("colors")
local icons = require("icons")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

local spaces = {}
local space_lut = {
	18,
	19,
	20,
	21,
	23,
	22,
	26,
	28,
	25,
	29,
}

for i = 1, 10, 1 do
	local space = sbar.add("space", "space." .. i, {
		space = i,
		icon = {
			font = { family = settings.font.numbers },
			string = i,
			padding_left = 10,
			padding_right = 8,
			color = colors.nord.ss3,
			highlight_color = colors.bar.black,
		},
		label = {
			padding_right = 10,
			highlight_color = colors.bar.black,
			--color = colors.with_alpha(colors.nord.ss3, 0.4),
			color = colors.nord.ss3,
			font = "sketchybar-app-font:Regular:16.0",
			y_offset = 0,
		},
		padding_right = 1,
		padding_left = 1,
		background = {
			color = colors.transparent,
			border_width = 0,
			height = 28,
			border_color = colors.transparent,
			padding_right = -1,
			--padding_left = -2,
		},
		popup = { background = { border_width = 5, border_color = colors.black } },
	})

	spaces[i] = space

	-- Padding space
	sbar.add("space", "space.padding." .. i, {
		space = i,
		script = "",
		width = settings.group_paddings,
	})

	local space_popup = sbar.add("item", {
		position = "popup." .. space.name,
		padding_left = 5,
		padding_right = 0,
		background = {
			drawing = true,
			image = {
				corner_radius = 9,
				scale = 0.2,
			},
		},
	})

	space:subscribe("space_change", function(env)
		local selected = env.SELECTED == "true"
		local color = selected and colors.grey or colors.bg2
		space:set({
			icon = { highlight = selected },
			label = { highlight = selected },
			background = {
				border_color = selected and colors.bar.black or colors.transparent,
				color = selected and colors.nord.ss3 or colors.transparent,
			},
		})
		space_bracket:set({
			--background = { border_color = selected and colors.grey or colors.bg2 },
		})
	end)

	space:subscribe("mouse.clicked", function(env)
		if env.BUTTON == "other" then
			space_popup:set({ background = { image = "space." .. env.SID } })
			space:set({ popup = { drawing = "toggle" } })
		else
			local op = (env.BUTTON == "right") and "--destroy" or "--focus"
			--sbar.exec("yabai -m space " .. op .. " " .. env.SID)
			sbar.exec(
				'osascript -e \'tell application "System Events" to key code ' .. space_lut[i] .. " using option down'"
			)
		end
	end)

	space:subscribe("mouse.exited", function(_)
		space:set({ popup = { drawing = false } })
	end)
end

--local space_bg = sbar.add("bracket", {
--	spaces_indicator.name,
--	spaces[1].name,
--	spaces[2].name,
--	spaces[3].name,
--	spaces[4].name,
--	spaces[5].name,
--	spaces[6].name,
--	spaces[7].name,
--	spaces[8].name,
--	spaces[9].name,
--	spaces[10].name,
--}, {
--	background = {
--		color = colors.nord.pn2,
--		border_color = colors.nord.pn4,
--		border_width = 1,
--	},
--})

local space_window_observer = sbar.add("item", {
	drawing = false,
	updates = true,
})

space_window_observer:subscribe("space_windows_change", function(env)
	local icon_line = ""
	local no_app = true
	for app, count in pairs(env.INFO.apps) do
		no_app = false
		local lookup = app_icons[app]
		local icon = ((lookup == nil) and app_icons["Default"] or lookup)
		icon_line = icon_line .. icon
	end

	if no_app then
		icon_line = " —"
	end
	sbar.animate("tanh", 10, function()
		spaces[env.INFO.space]:set({ label = icon_line })
	end)
end)

local spaces_indicator = sbar.add("item", {
	--padding_left = 2,
	--padding_right = 2,
	icon = {
		padding_left = 4,
		padding_right = 0,
		color = colors.nord.ss3,
		--color = colors.with_alpha(colors.nord.ss3, 0.4),
		string = icons.switch.on,
	},
})

spaces_indicator:subscribe("swap_menus_and_spaces", function(env)
	local currently_on = spaces_indicator:query().icon.value == icons.switch.on
	spaces_indicator:set({
		icon = currently_on and icons.switch.off or icons.switch.on,
		--label = currently_on and { string = "" } or { string = env.INFO },
	})
end)

--spaces_indicator:subscribe("mouse.entered", function(env)
--	sbar.animate("tanh", 30, function()
--		spaces_indicator:set({
--			background = {
--				color = { alpha = 1.0 },
--				border_color = { alpha = 1.0 },
--			},
--			icon = { color = colors.bg1 },
--			label = { width = "dynamic" },
--		})
--	end)
--end)

--spaces_indicator:subscribe("mouse.exited", function(env)
--	sbar.animate("tanh", 30, function()
--		spaces_indicator:set({
--			background = {
--				color = { alpha = 0.0 },
--				border_color = { alpha = 0.0 },
--			},
--			icon = { color = colors.grey },
--			label = { width = 0 },
--		})
--	end)
--end)

spaces_indicator:subscribe("mouse.clicked", function(env)
	sbar.trigger("swap_menus_and_spaces")
end)

--spaces_indicator:subscribe("front_app_switched", function(env)
--	spaces_indicator:set({ label = { string = env.INFO } })
--end)

--local switch_bg = sbar.add("bracket", {
--	spaces_indicator.name,
--}, {
--	background = {
--		color = colors.bg1,
--		border_color = colors.black,
--		border_width = 1,
--	},
--})
