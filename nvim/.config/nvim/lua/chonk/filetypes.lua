local filetype_exceptions = {
	nix = {
		shiftwidth = 2,
		softtabstop = 2,
		tabstop = 2,
		expandtab = true,
		smartindent = true,
	},
	cs = {
		shiftwidth = 4,
		softtabstop = 4,
		tabstop = 4,
		expandtab = true,
		smartindent = true,
	}
}

for name, config in pairs(filetype_exceptions) do
	local shiftwidth = config.shiftwidth
	local softtabstop = config.softtabstop
	local tabstop = config.tabstop
	local expandtab = config.expandtab
	local smartindent = config.smartindent
	vim.api.nvim_create_autocmd('Filetype', {
		pattern = name,
		callback = function(_)
			vim.opt.shiftwidth = shiftwidth
			vim.opt.softtabstop = softtabstop
			vim.opt.tabstop = tabstop
			vim.opt.expandtab = expandtab
			vim.opt.smartindent = smartindent
		end
	})
end
