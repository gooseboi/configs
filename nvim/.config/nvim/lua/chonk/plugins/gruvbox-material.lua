return {
	"sainnhe/gruvbox-material",
	lazy = false, -- load at start
	priority = 1000, -- load first
	config = function()
		vim.g.gruvbox_material_background = "hard"
		vim.g.gruvbox_material_better_performance = 1
		vim.o.background = 'dark'
		vim.cmd.colorscheme("gruvbox-material")
	end
}
