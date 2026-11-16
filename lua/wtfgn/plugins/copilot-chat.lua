return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		keys = {
			{ "<leader>ac", "<cmd>CopilotChatToggle<cr>", desc = "Open/close Copilot Chat" },
			{ "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "Review code", mode = { "n", "v" } },
			{ "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "Explain code", mode = { "n", "v" } },
			{ "<leader>af", "<cmd>CopilotChatFix<cr>", desc = "Fix code", mode = { "n", "v" } },
		},
		opts = {
			model = "gpt-5-mini", -- AI model to use
			temperature = 0.1, -- Lower = focused, higher = creative
			trusted_tools = nil, -- Require approval for all tool calls
			auto_insert_mode = true, -- Enter insert mode when opening

			window = {
				layout = "vertical",
				width = 0.3, -- Fixed width in columns
			},

			-- headers = {
			-- 	user = "👤 You",
			-- 	assistant = "🤖 Copilot",
			-- 	tool = "🔧 Tool",
			-- },

			-- Adjust chat display settings
			highlight_headers = false,
			error_header = "> [!ERROR] Error",
		},

		config = function()
			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "copilot-chat", -- Adjust your pattern here
				callback = function()
					vim.opt_local.relativenumber = false
					vim.opt_local.number = false
					vim.opt_local.conceallevel = 0
				end,
			})
			-- vim.keymap.set(
			-- 	"i",
			-- 	"<S-Tab>",
			-- 	'copilot#Accept("\\<S-Tab>")',
			-- 	{ expr = true, replace_keycodes = false, desc = "CopilotChat Autocomplete" }
			-- )
		end,
	},
}
