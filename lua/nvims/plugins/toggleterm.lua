return {
	"akinsho/toggleterm.nvim",
	version = "*", -- or specify a commit if you prefer
	config = function()
		require("toggleterm").setup({
			-- You can specify options here, or leave it empty for defaults.
			-- For a VSCode-like experience, you might want a floating terminal:
			direction = "horizontal",
			size = 20, -- specifies the height in lines for horizontal split
			-- open_mapping = [[<c-\>]], -- Keymap handled below
			-- Ensures terminal opens in insert mode
			start_in_insert = true,
			-- Persist terminal size
			persist_size = true,
			-- Close terminal when the process exits
			close_on_exit = true,
			float_opts = {
				border = "curved", -- 'single', 'double', 'shadow', 'curved'
			},
		})

		-- A keymap to toggle the terminal
		-- Using Ctrl + ` (backtick) for a VSCode-like feel.
		-- Works in normal and insert mode.
		vim.keymap.set(
			{ "n", "i" },
			"<C-`>",
			"<cmd>ToggleTerm<CR>",
			{ silent = true, noremap = true, desc = "Toggle terminal" }
		)

		-- Keymap to easily exit the terminal with Esc while in terminal mode AND also close/toggle it.
		-- If you prefer Esc to only exit terminal insert mode back to normal mode (inside the terminal),
		-- you can use: vim.keymap.set("t", "<Esc>", "<C-\\\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })
		vim.keymap.set(
			"t",
			"<Esc>",
			"<cmd>ToggleTerm<CR>",
			{ noremap = true, silent = true, desc = "Exit and toggle terminal" }
		)

		-- Optional: If you want other keymaps specifically for when the terminal is open,
		-- you can use an autocommand like this:
		-- vim.cmd('autocmd! TermOpen term://*toggleterm#* lua << EOF')
		-- vim.keymap.set("t", "<C-h>", "<Cmd>wincmd h<CR>", { noremap = true, silent = true, buffer = 0})
		-- vim.keymap.set("t", "<C-j>", "<Cmd>wincmd j<CR>", { noremap = true, silent = true, buffer = 0})
		-- vim.keymap.set("t", "<C-k>", "<Cmd>wincmd k<CR>", { noremap = true, silent = true, buffer = 0})
		-- vim.keymap.set("t", "<C-l>", "<Cmd>wincmd l<CR>", { noremap = true, silent = true, buffer = 0})
		-- vim.cmd('EOF')
	end,
}
