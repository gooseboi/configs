require('nvim-treesitter.configs').setup {
	ensure_installed = { 'vim', 'vimdoc', 'lua', 'cpp', 'c', 'rust', 'go', 'nix', 'make' },

	auto_install = false,

	highlight = { enable = true },

	indent = { enable = true },

	ignore_install = {},

	modules = {},

	sync_install = false,
}
