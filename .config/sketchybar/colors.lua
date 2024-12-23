return {
	black = 0xff181819,
	white = 0xffe2e2e3,
	red = 0xfffc5d7c,
	green = 0xff9ed072,
	blue = 0xff76cce0,
	yellow = 0xffe7c664,
	orange = 0xfff39660,
	magenta = 0xffb39df3,
	grey = 0xff7f8490,
	transparent = 0x00000000,

	nord = {
		-- polar night
		pn1 = 0xff2e3440,
		pn2 = 0xff3b4252,
		pn3 = 0xff434c5e,
		pn4 = 0xff4c566a,

		-- snow storm
		ss1 = 0xffd8dee9,
		ss2 = 0xffe5e9f0,
		ss3 = 0xffeceff4,

		-- frost
		frost1 = 0xff8fbcbb,
		frost2 = 0xff88c0d0,
		frost3 = 0xff81a1c1,
		frost4 = 0xff5e81ac,

		-- aurora
		aurora1 = 0xffbf616a,
		aurora2 = 0xffd08770,
		aurora3 = 0xffebcb8b,
		aurora4 = 0xffa3be8c,
		aurora5 = 0xffb48ead,
	},

	bar = {
		bg = 0xf02c2e34,
		black = 0xff000000,
		white = 0xffffffff,
		clear = 0x00000000,
		border = 0xff2c2e34,
	},
	popup = {
		bg = 0xc02c2e34,
		border = 0xff7f8490,
	},
	bg1 = 0xff363944,
	bg2 = 0xff414550,

	with_alpha = function(color, alpha)
		if alpha > 1.0 or alpha < 0.0 then
			return color
		end
		return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
	end,
}
