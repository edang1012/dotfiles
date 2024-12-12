return {
	{
		"AlexvZyl/nordic.nvim",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("nordic").setup({
				-- This callback can be used to override the colors used in the base palette.
				on_palette = function(palette)
					palette.gray2 = palette.gray5
					palette.gray4 = palette.gray5
				end,
				-- This callback can be used to override the colors used in the extended palette.
				--after_palette = function(palette) end,
				-- This callback can be used to override highlights before they are applied.
				--on_highlight = function(highlights, palette) end,
				-- Enable bold keywords.
				bold_keywords = true,
				-- Enable italic comments.
				italic_comments = true,
				-- Enable editor background transparency.
				transparent = {
					-- Enable transparent background.
					bg = true,
					-- Enable transparent background for floating windows.
					float = false,
				},
				-- Enable brighter float border.
				bright_border = false,
				-- Reduce the overall amount of blue in the theme (diverges from base Nord).
				reduced_blue = false,
				-- Swap the dark background with the normal one.
				swap_backgrounds = false,
				-- Cursorline options.  Also includes visual/selection.
				cursorline = {
					-- Bold font in cursorline.
					bold = true,
					-- Bold cursorline number.
					bold_number = true,
					-- Available styles: 'dark', 'light'.
					theme = "dark",
					-- Blending the cursorline bg with the buffer bg.
					blend = 0.85,
				},
				noice = {
					-- Available styles: `classic`, `flat`.
					style = "classic",
				},
				telescope = {
					-- Available styles: `classic`, `flat`.
					style = "flat",
				},
				leap = {
					-- Dims the backdrop when using leap.
					dim_backdrop = false,
				},
				ts_context = {
					-- Enables dark background for treesitter-context window
					dark_background = true,
				},
			})

			-- load the colorscheme here
			vim.cmd([[colorscheme nordic]])
		end,
	},
}