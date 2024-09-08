local options = {
	autoindent = true, -- Copy indent from previous line
	timeoutlen = 300, -- https://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
	encoding = 'utf-8', -- Use UTF-8
	scrolloff = 5,   -- Keep 5 lines above and below the cursor when scrolling
	sidescrolloff = 7, -- Keep 7 lines to both sides when scrolling
	showmode = false, -- Don't show the editor mode as it is shown by the status bar
	hidden = true,   -- Allow unsaved buffers to be hidden
	wrap = false,    -- No line wrapping
	joinspaces = false, -- Don't insert spaces between '.' after joining lines
	colorcolumn = '80', -- Add a column 80 lines out to mark a limit
	signcolumn = 'yes',

	-- Sane splits
	splitright = true, -- Automatically create hsplits right of the current window
	splitbelow = true, -- Automatically create vsplits below the current window

	-- Permanent undo
	undofile = true, -- Permanent file for undos

	-- Decent wildmenu
	wildmenu = true,        -- Turn on wildmenu for completion
	wildmode = 'list:longest', -- `list` lists all matches
	--`longest` autocompletes to the longest common string
	wildignore =
	'.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor', -- Ignore files that have no use being opened in vim

	-- Wrapping options
	formatoptions = 'tcrqnbjp',

	-- Tab settings
	shiftwidth = 4,
	softtabstop = 4,
	tabstop = 4,
	expandtab = false,
	smartindent = true,

	-- Proper search
	incsearch = true,
	ignorecase = true,
	smartcase = true,
	gdefault = true,
	hlsearch = false,

	-- Better message display
	cmdheight = 2,
	-- Better experience than the default 4000
	updatetime = 300,
	errorbells = false, -- No more beeps
	backspace = '2', -- Backspace over newlines
	foldenable = false,
	lazyredraw = true,
	synmaxcol = 500,
	laststatus = 2,
	number = true,
	relativenumber = true,
	ruler = true,
	showcmd = true,
	mouse = '',
	listchars = 'nbsp:¬,extends:»,precedes:«,trail:•',

	vb = true, -- no beeping
}

for opt, val in pairs(options) do
	vim.opt[opt] = val
end

vim.api.nvim_create_autocmd(
	"TextYankPost",
	{
		callback = function()
			vim.highlight.on_yank({ timeout = 400 })
		end
	}
)

-- Courtesy of Lukesmith
-- Removes trailing whitespace in file before saving
-- TODO: Convert this to lua
vim.api.nvim_exec2([[
	autocmd BufWritePre * let currPos = getpos(".")
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
	autocmd BufWritePre *.[ch] %s/\%$/\r/e
	autocmd BufWritePre * cal cursor(currPos[1], currPos[2])
]], { output = false, })

vim.api.nvim_create_autocmd(
	'Filetype',
	{
		pattern = 'nix',
		callback = function(_)
			vim.opt.shiftwidth = 2
			vim.opt.softtabstop = 2
			vim.opt.tabstop = 2
			vim.opt.expandtab = true
			vim.opt.smartindent = true
		end
	})

vim.api.nvim_create_autocmd(
	'Filetype',
	{
		pattern = 'cs',
		callback = function(_)
			vim.opt.shiftwidth = 4
			vim.opt.softtabstop = 4
			vim.opt.tabstop = 4
			vim.opt.expandtab = true
			vim.opt.smartindent = true
		end
	})

-- Vimwiki
local vimwiki_dir = '~/.local/share/vimwiki/'
vim.g.vimwiki_list = { {
	path = vimwiki_dir,
	path_html = vimwiki_dir .. 'html',
	template_path = vimwiki_dir .. 'public_html/templates',
	template_default = 'default',
	template_ext = '.html'
} }
vim.g.vimwiki_global_ext = 0
