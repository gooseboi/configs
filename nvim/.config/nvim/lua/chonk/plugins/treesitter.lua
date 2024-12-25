return {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	config = function()
		require('nvim-treesitter.configs').setup {
			ensure_installed = {
				-- Vim
				'vim',
				'vimdoc',
				'lua',

				-- Real shit
				'cpp',
				'c',
				'rust',
				'go',
				'odin',
				'zig',

				-- Build
				'make',
				'nix',

				-- Webdev
				'typescript',
				'javascript',
				'html',

				-- Typesetting
				'markdown',
				'bibtex',
				-- this needs tree-sitter-cli to be installed through npm
				'latex',
				'typst',
			},

			highlight = { enable = true },
			indent = { enable = true },

			ignore_install = {},

			modules = {},

			sync_install = false,
			auto_install = false,
		}
	end,
}
