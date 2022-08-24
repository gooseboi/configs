-- Make sure telescope is installed
local ok, telescope = pcall(require, "telescope")
if not ok then
	vim.notify("Failed to load telescope")
	return
end

local actions = require("telescope.actions")

-- Telescope setup
telescope.setup{
	defaults = {
		prompt_prefix = '> ',
		selection_caret = ' ',
		path_display = {truncate = 1},
		preview = {
			msg_bg_fillchar = "#",
		},
		-- Mappings inside of the telescope prompt
		mappings = {
			i = {
				-- Movement
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				-- History
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,
				-- Ctrl-s to open a horizontal split
				["<C-s>"] = actions.select_horizontal,
				-- Ctrl-v to open a vertical split
				["<C-v>"] = actions.select_vertical,

			},
			n = {
				-- Ctrl-s to open a horizontal split
				["<C-s>"] = actions.select_horizontal,
				-- Ctrl-v to open a vertical split
				["<C-v>"] = actions.select_vertical,
			},
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
		}
	},
}

-- Load extensions
telescope.load_extension('fzf')

-- Keymaps
local telescope_ok, telescope = pcall(require, "telescope")
if telescope_ok then
	vim.api.nvim_set_keymap('n', "<leader>jf", "<cmd>Telescope find_files<CR>",                 {noremap = true})
	vim.api.nvim_set_keymap('n', "<leader>tl", "<cmd>Telescope live_grep<CR>",                  {noremap = true})
	vim.api.nvim_set_keymap('n', "<leader>jb", "<cmd>Telescope buffers<CR>",                    {noremap = true})
	vim.api.nvim_set_keymap('n', "<leader>tb", "<cmd>Telescope current_buffer_fuzzy_find<CR>",  {noremap = true})
end
