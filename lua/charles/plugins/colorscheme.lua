return {
	{
		"sainnhe/everforest",
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- Optional: You can configure everforest here if needed
			-- require("everforest").setup({
			--   -- your settings
			-- })
			vim.cmd("colorscheme everforest")
		end,
	},
}
