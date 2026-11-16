return {
	{
		"saghen/blink.cmp",
		version = "v1.*",
        -- enabled = false,
		-- enabled = function()
		-- 	-- Get the current buffer name and filetype
		-- 	local buf_name = vim.api.nvim_buf_get_name(0)
		-- 	local filetype = vim.bo.filetype
		--
		-- 	-- Disable if the name or filetype matches "copilot-chat"
		-- 	if buf_name:match("copilot%-chat") or filetype == "copilot-chat" then
		-- 		return false
		-- 	end
		--
		-- 	return true
		-- end,
		dependencies = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"fang2hou/blink-copilot",
		},
		config = function()
			require("blink.cmp").setup({
				fuzzy = {
					implementation = "prefer_rust",
				},
				keymap = {
					preset = "default",
				},
				completion = {
					list = { selection = { preselect = false, auto_insert = true } },
					menu = {
						auto_show = true,
						scrollbar = true,
						scrolloff = 2,
						draw = {
							columns = {
								{ "kind_icon" },
								{ "label", "label_description", gap = 1 },
								{ "kind", "source_name", gap = 1 },
							},
							padding = 1,
							gap = 1,
							align_to = "label",
							-- treesitter = { "lsp" }, -- enable treesitter highlighting on labels (can be slower)
						},
					},
					documentation = {
						auto_show = true,
						auto_show_delay_ms = 200,
						window = {
							-- max_width = 80,
							-- max_height = 20,
						},
					},
					ghost_text = {
						enabled = false,
						show_with_menu = false,
					},
					accept = {
						auto_brackets = {
							enabled = true,
						},
					},
				},
				cmdline = {
					enabled = true,
					keymap = { preset = "cmdline" },
					completion = {
						menu = { auto_show = true },
					},
				},
				sources = {
					default = {
						"lsp",
						"path",
						"buffer",
						"snippets",
						"copilot",
					},
					providers = {
						lsp = {
							opts = { tailwind_color_icon = "󱓻" },
						},
						copilot = {
							name = "copilot",
							module = "blink-copilot",
							score_offset = 100,
							async = true,
						},
					},
				},
				appearance = {
					use_nvim_cmp_as_default = false,
					nerd_font_variant = "mono",
				},
				snippets = {
					preset = "luasnip",
				},
			})
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		requires = {
			-- "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
		},
		cmd = "Copilot",
		event = "InsertEnter",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
		},
	},
}
