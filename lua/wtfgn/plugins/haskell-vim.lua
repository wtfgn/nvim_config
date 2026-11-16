return {
	-- Syntax + Indentation
	{
		"neovimhaskell/haskell-vim",
		ft = { "haskell", "cabal" },
		init = function()
			-- Enable better indentation features
			vim.g.haskell_indent_disable = 0 -- Make sure indent is enabled

			-- Common settings (adjust to your taste)
			vim.g.haskell_indent_if = 2
			vim.g.haskell_indent_case = 2
			vim.g.haskell_indent_let = 4
			vim.g.haskell_indent_where = 6
			vim.g.haskell_indent_before_where = 2
			vim.g.haskell_indent_after_bare_where = 2
			vim.g.haskell_indent_do = 3
			vim.g.haskell_indent_in = 1
			vim.g.haskell_indent_guard = 2

			-- Optional: Use more modern highlighting but keep good indent
			vim.g.haskell_classic_highlighting = 0
		end,
	},
}
