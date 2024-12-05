local opt_local = vim.opt_local;

local filetype_exceptions = {
	nix = function(_)
		opt_local.shiftwidth = 2
		opt_local.softtabstop = 2
		opt_local.tabstop = 2
		opt_local.expandtab = true
		opt_local.smartindent = true
	end,
	cs = function(_)
		opt_local.shiftwidth = 8
		opt_local.softtabstop = 4
		opt_local.tabstop = 4
		opt_local.expandtab = true
		opt_local.smartindent = true
	end,
}

for name, callback in pairs(filetype_exceptions) do
	vim.api.nvim_create_autocmd('Filetype', {
		pattern = name,
		callback = callback,
	})
end
