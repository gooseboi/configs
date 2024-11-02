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

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 400 })
	end
})

-- Courtesy of Lukesmith
-- Removes trailing whitespace in file before saving
vim.api.nvim_create_autocmd('BufWritePre', {
	callback = function(_)
		local currPos = vim.api.nvim_win_get_cursor(0)
		vim.cmd([[%s/\s\+$//e]])
		vim.api.nvim_win_set_cursor(0, currPos)
	end
})
