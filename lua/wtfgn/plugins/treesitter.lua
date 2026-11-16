return {
	-- NOTE: treesitter CLI installation needed
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter")

			local ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"go",
				"yaml",
				"html",
				"css",
				"python",
				"http",
				"prisma",
				"svelte",
				"graphql",
				"bash",
				"vim",
				"dockerfile",
				"gitignore",
				"query",
				"vimdoc",
				"c",
				"java",
				"rust",
				"ron",
				"haskell",
				"lua",
			}

			treesitter.install(ensure_installed)

			-- Safe FileType autocmd for highlighting + indentation
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "*",
				callback = function(args)
					local buf = args.buf
					local ft = vim.bo[buf].filetype
					local lang = vim.treesitter.language.get_lang(ft)

					if lang then
						pcall(vim.treesitter.start, buf, lang)
					end

					-- Only set Treesitter indentation for languages where it works well
					if ft == "yaml" or ft == "markdown" then
						-- Skip these
						return
					elseif ft == "haskell" then
						vim.bo[buf].syntax = "ON"
						vim.bo[buf].smartindent = false
						vim.bo[buf].cindent = false
					else
						-- Default good languages
						vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
						vim.bo[buf].smartindent = false
						vim.bo[buf].cindent = false
					end
				end,
			})
		end,
	},
	-- NOTE: js,ts,jsx,tsx Auto Close Tags
	{
		"windwp/nvim-ts-autotag",
		enabled = true,
		ft = { "html", "xml", "javascript", "typescript", "javascriptreact", "typescriptreact", "svelte" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true, -- Auto-close tags
					enable_rename = true, -- Auto-rename pairs
					enable_close_on_slash = false, -- Disable auto-close on trailing `</`
				},
				per_filetype = {
					["html"] = {
						enable_close = true,
					},
					["typescriptreact"] = {
						enable_close = true,
					},
				},
			})
		end,
	},
}
