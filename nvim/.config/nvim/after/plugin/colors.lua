vim.opt.background = dark
base16colorspace = 256
vim.opt.termguicolors = true
vim.g.base16_shell_path = '~/dev/others/base16/templates/shell/scripts'
vim.cmd.colorscheme('base16-gruvbox-dark-hard')
vim.api.nvim_exec('syntax on', false)
vim.api.nvim_exec('hi Normal ctermbg=NONE', false)
-- Brighter comments
vim.api.nvim_exec('call Base16hi("Comment", g:base16_gui09, "", g:base16_cterm09, "", "", "")', false)
