local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local whitelist = { ["Spotify"] = true, ["Music"] = true, ["Swinsian"] = true }

sbar.add("item", "media.padding", {
	position = "right",
	width = settings.group_paddings,
})

local media_cover = sbar.add("item", {
	position = "right",
	background = {
		image = {
			string = "media.artwork",
			scale = 0.875,
			--corner_radius = 8,
			border_width = 0,
			border_color = colors.nord.pn4,
			--border_color = colors.bar.black,
		},
		border_width = 0,
		border_color = colors.transparent,
		color = colors.transparent,
	},
	padding_right = 0,
	label = { drawing = false },
	icon = {
		drawing = false,
	},
	drawing = false,
	updates = true,
	click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 'Control Center,NowPlaying'",
})

local media_artist = sbar.add("item", {
	position = "right",
	drawing = false,
	padding_left = 8,
	padding_right = 0,
	width = 0,
	icon = { drawing = false },
	label = {
		width = 0,
		font = { size = 9 },
		color = colors.with_alpha(colors.nord.ss3, 0.75),
		max_chars = 20,
		y_offset = -6,
	},
	click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 'Control Center,NowPlaying'",
})

local media_title = sbar.add("item", {
	position = "right",
	drawing = false,
	padding_left = 8,
	padding_right = 0,
	icon = { drawing = false },
	label = {
		font = { size = 11 },
		color = colors.nord.ss3,
		width = 0,
		max_chars = 20,
		y_offset = 5,
	},
	click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 'Control Center,NowPlaying'",
})

local function animate_detail(detail)
	sbar.animate("tanh", 30, function()
		media_artist:set({ label = { width = detail and "dynamic" or 0 } })
		media_title:set({ label = { width = detail and "dynamic" or 0 } })
	end)
end

media_cover:subscribe("media_change", function(env)
	if whitelist[env.INFO.app] then
		local drawing = (env.INFO.state == "playing" or env.INFO.state == "paused")
		media_artist:set({ drawing = drawing, label = env.INFO.artist })
		media_title:set({ drawing = drawing, label = env.INFO.title })
		media_cover:set({ drawing = drawing })

		if drawing then
			animate_detail(true)
		end
	end
end)

--local media_bg = sbar.add("bracket", {
--	media_cover.name,
--	media_title.name,
--	media_artist.name,
--}, {
--	background = {
--		color = colors.nord.pn2,
--		border_color = colors.nord.pn4,
--		border_width = 1,
--	},
--})
