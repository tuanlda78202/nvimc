return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {
			"          _____                    _____                    _____                    _____                    _____          ",
			"         /\\    \\                  /\\    \\                  /\\    \\                  /\\    \\                  /\\    \\         ",
			"        /::\\____\\                /::\\____\\                /::\\    \\                /::\\____\\                /::\\    \\        ",
			"       /::::|   |               /:::/    /                \\:::\\    \\              /::::|   |               /::::\\    \\       ",
			"      /:::::|   |              /:::/    /                  \\:::\\    \\            /:::::|   |              /::::::\\    \\      ",
			"     /::::::|   |             /:::/    /                    \\:::\\    \\          /::::::|   |             /:::/\\:::\\    \\     ",
			"    /:::/|::|   |            /:::/____/                      \\:::\\    \\        /:::/|::|   |            /:::/__\\:::\\    \\    ",
			"   /:::/ |::|   |            |::|    |                       /::::\\    \\      /:::/ |::|   |            \\:::\\   \\:::\\    \\   ",
			"  /:::/  |::|   | _____      |::|    |     _____    ____    /::::::\\    \\    /:::/  |::|___|______    ___\\:::\\   \\:::\\    \\  ",
			" /:::/   |::|   |/\\    \\     |::|    |    /\\    \\  /\\   \\  /:::/\\:::\\    \\  /:::/   |::::::::\\    \\  /\\   \\:::\\   \\:::\\    \\ ",
			"/:: /    |::|   /::\\____\\    |::|    |   /::\\____\\/::\\   \\/:::/  \\:::\\____\\/:::/    |:::::::::\\____\\/::\\   \\:::\\   \\:::\\____\\",
			"\\::/    /|::|  /:::/    /    |::|    |  /:::/    /\\:::\\  /:::/    \\::/    /\\::/    / ~~~~~/:::/    /\\:::\\   \\:::\\   \\::/    /",
			" \\/____/ |::| /:::/    /     |::|    | /:::/    /  \\::::\\/:::/    / \\/____/  \\/____/      /:::/    /  \\:::\\   \\:::\\   \\/____/ ",
			"         |::|/:::/    /      |::|____|/:::/    /    \\::::::/    /                       /:::/    /    \\:::\\   \\:::\\    \\     ",
			"         |::::::/    /       |:::::::::::/    /      \\::::/____/                       /:::/    /      \\:::\\   \\:::\\____\\    ",
			"         |:::::/    /        \\::::::::::/____/        \\:::\\    \\                      /:::/    /        \\:::\\  /:::/    /    ",
			"         |::::/    /          ~~~~~~~~~~               \\:::\\    \\                    /:::/    /          \\::::\\/:::/    /     ",
			"         /:::/    /                                     \\:::\\    \\                  /:::/    /            \\::::::/    /      ",
			"        /:::/    /                                       \\:::\\____\\                /:::/    /              \\::::/    /       ",
			"        \\::/    /                                         \\::/    /                \\::/    /                \\::/    /        ",
			"         \\/____/                                           \\/____/                  \\/____/                  \\/____/         ",
			"                                                                                                                             ",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
			dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
			dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

		-- Set custom highlight for header
		vim.cmd([[highlight AlphaHeader guifg=#A7C080]])
		dashboard.section.header.opts.hl = "AlphaHeader"
	end,
}
