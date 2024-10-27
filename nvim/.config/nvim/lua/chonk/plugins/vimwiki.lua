return {
	"vimwiki/vimwiki",
	config = function()
		local vimwiki_dir = '~/.local/share/vimwiki/'
		vim.g.vimwiki_list = { {
			path = vimwiki_dir,
			path_html = vimwiki_dir .. 'html',
			template_path = vimwiki_dir .. 'public_html/templates',
			template_default = 'default',
			template_ext = '.html'
		} }
		vim.g.vimwiki_global_ext = 0
	end
}

