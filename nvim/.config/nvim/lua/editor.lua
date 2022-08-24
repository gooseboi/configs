local options = {
	autoindent = true, -- Copy indent from previous line
	timeoutlen = 300, -- https://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
	encoding = 'utf-8', -- Use UTF-8
	scrolloff = 3, -- Keep 3 lines above and below the cursor when scrolling
	sidescrolloff = 7, -- Keep 7 lines to both sides when scrolling
	showmode = false,
	hidden = true, -- Allow unsaved buffers to be hidden
	wrap = false, -- No line wrapping
	joinspaces = false,
	colorcolumn = '80',
	printfont = ':h10',
	printencoding = 'utf-8',
	printoptions = 'paper:letter',

	-- Sane splits
	splitright = true,
	splitbelow = true,

	-- Permanent undo
	undofile = true,
	
	-- Decent wildmenu
	wildmenu = true,
	wildmode = 'list:longest',
	wildignore = '.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor',

	-- Wrapping options
	formatoptions = 'tcrqnbjp',

	-- Tab settings
	shiftwidth = 4,
	softtabstop = 4,
	tabstop = 4,
	expandtab = false,

	-- Proper search
	incsearch = true,
	ignorecase = true,
	smartcase = true,
	gdefault = true,


	-- Gui options

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
	diffopt = nil, -- TODO
	showcmd = true,
	mouse = 'a',
	listchars = 'nbsp:¬,extends:»,precedes:«,trail:•'
}

for opt, val in pairs(options) do
	vim.opt[opt] = val
end

-- Latex
vim.g.latex_indent_enabled = 1
vim.g.latex_fold_envs = 0
vim.g.latex_fold_sections = {}

-- Rust
vim.g.rustfmt_autosave = 1
vim.g.rustfmt_emit_files = 1
vim.g.rustfmt_fail_silently = 0
vim.g.rust_clip_command = 'xclip -selection clipboard'
