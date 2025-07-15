return {
	{
		"sainnhe/everforest",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- Configure everforest for better terminal visibility
			vim.g.everforest_background = "soft"
			vim.g.everforest_better_performance = 1
			vim.g.everforest_enable_italic = 1
			vim.g.everforest_transparent_background = 0

			vim.cmd("colorscheme everforest")

			-- Terminal color overrides for better zsh autosuggestion visibility
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "everforest",
				callback = function()
					-- Set terminal colors for better contrast and visibility
					local colors = {
						-- Dark colors (0-7)
						terminal_color_0 = "#2d353b", -- black
						terminal_color_1 = "#e67e80", -- red
						terminal_color_2 = "#a7c080", -- green
						terminal_color_3 = "#dbbc7f", -- yellow
						terminal_color_4 = "#7fbbb3", -- blue
						terminal_color_5 = "#d699b6", -- magenta
						terminal_color_6 = "#83c092", -- cyan
						terminal_color_7 = "#d3c6aa", -- white

						-- Bright colors (8-15)
						terminal_color_8 = "#859289", -- bright black (for suggestions)
						terminal_color_9 = "#e67e80", -- bright red
						terminal_color_10 = "#a7c080", -- bright green
						terminal_color_11 = "#dbbc7f", -- bright yellow
						terminal_color_12 = "#7fbbb3", -- bright blue
						terminal_color_13 = "#d699b6", -- bright magenta
						terminal_color_14 = "#83c092", -- bright cyan
						terminal_color_15 = "#d3c6aa", -- bright white
					}

					-- Apply terminal colors
					for color, value in pairs(colors) do
						vim.g[color] = value
					end

					-- Specifically override the suggestion color to be more visible
					-- This makes zsh autosuggestions lighter and more readable
					vim.g.terminal_color_8 = "#a7a7a7" -- Lighter gray for suggestions
				end,
			})

			-- Trigger the autocmd immediately
			vim.schedule(function()
				vim.cmd("doautocmd ColorScheme everforest")
			end)
		end,
	},
}
