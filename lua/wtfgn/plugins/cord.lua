return {
	"vyfor/cord.nvim",
	opts = {
		display = {
			theme = "minecraft", -- 'default', 'atom', 'catppuccin', 'minecraft', 'void', 'classic'
			flavor = "accent", -- 'dark', 'light', 'accent'
			view = "full", -- both the file/asset icon and the editor icon (default)
			-- view = 'asset',  -- only the file/asset icon
			-- view = 'editor', -- only the editor icon
			-- view = 'auto',   -- both, but drop the file icon in new/empty buffers
			swap_fields = false,
			swap_icons = false,
		},

		buttons = {
			{
				label = function(opts)
					return opts.repo_url and "View Repository" or "View GitHub"
				end,
				url = function(opts)
					return opts.repo_url or "https://github.com/wtfgn"
				end,
			},
		},

		text = {
			editing = function(opts)
				return "Editing > " .. opts.filename
			end,
			workspace = function(opts)
				return "Project: " .. opts.workspace
			end,
			terminal = function(opts)
				return "In a terminal (" .. opts.name .. ")"
			end,
		},

		idle = {
			details = function(opts)
				return "Touching grass..."
			end,
			state = "Be right back",
			tooltip = "🌿",
		},
	},
}
