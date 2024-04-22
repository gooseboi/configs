local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- colorscheme
	{
		"sainnhe/gruvbox-material",
		lazy = false, -- load at start
		priority = 1000, -- load first
		config = function()
			vim.g.gruvbox_material_background = "hard"
			vim.g.gruvbox_material_better_performance = 1
			vim.o.background = 'dark'
			vim.cmd.colorscheme("gruvbox-material")
		end
	},
	-- statusbar
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup {
				options = {
					icons_enabled = true,
					theme = 'gruvbox_dark',
					component_separators = { left = '', right = '' },
					section_separators = { left = '', right = '' },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					}
				},
				sections = {
					lualine_a = { 'mode' },
					lualine_b = { 'branch', 'diff', 'diagnostics' },
					lualine_c = { 'filename' },
					lualine_x = { 'encoding', 'fileformat', 'filetype' },
					lualine_y = { 'progress' },
					lualine_z = { 'location' }
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { 'filename' },
					lualine_x = { 'location' },
					lualine_y = {},
					lualine_z = {}
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {}
			}
		end
	},
	-- add commenting
	{
		"numToStr/Comment.nvim",
		config = function()
			-- sets gc for commenting lines
			require("Comment").setup()
		end
	},
	"easymotion/vim-easymotion",

	{
		"ThePrimeagen/harpoon",
		dependencies = "nvim-lua/plenary.nvim",
	},

	"NoahTheDuke/vim-just",
	"vimwiki/vimwiki",

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			}
		},
	},

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"folke/neodev.nvim",

	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',

			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'rafamadriz/friendly-snippets',
		},
	},

	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
	},
})
