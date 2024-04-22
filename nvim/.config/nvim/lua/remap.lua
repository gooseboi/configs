--- @param keys string
--- @param value string
local nnoremap = function(keys, value)
	vim.keymap.set('n', keys, value, { silent = true, noremap = true })
end

--- @param keys string
--- @param value string
local vnoremap = function(keys, value)
	vim.keymap.set('v', keys, value, { silent = true, noremap = true })
end

--- @param keys string
--- @param value string
local cnoremap = function(keys, value)
	vim.keymap.set('c', keys, value, { silent = true, noremap = true })
end

--- @param keys string
--- @param value string
local map = function(keys, value)
	vim.keymap.set('', keys, value, { silent = true })
end

-- Set the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
nnoremap('<Space>', '<Nop>')

-- `x` and `c` don't change clipboard
nnoremap('x', '"_x')
nnoremap('X', '"_X')
nnoremap('c', '"_c')

-- Center search results
nnoremap('n', 'nzz')
nnoremap('N', 'Nzz')
nnoremap('*', '*zz')
nnoremap('#', '#zz')
nnoremap('g*', 'g*zz')

-- Copy to clipboard (by ThePrimeagen)
nnoremap('<leader>y', '"+y')
nnoremap('<leader>Y', '"+Y')
vnoremap('<leader>y', '"+y')

-- Swap lines
nnoremap('<C-j>', ':m .+1<CR>==')
nnoremap('<C-k>', ':m .-2<CR>==')

-- Move lines in visual mode (by ThePrimeagen)
vnoremap('<C-k>', ":m '<-2<CR>gv=gv")
vnoremap('<C-j>', ":m '>+1<CR>gv=gv")

-- Go to start and end of line
map('H', '^')
map('L', '$')

-- Move lines by visual lines
nnoremap('j', 'gj')
nnoremap('k', 'gk')

-- Disable useless keys
map('<F1>', '<Nop>')
map('<Up>', '<Nop>')
map('<Left>', '<Nop>')
map('<Right>', '<Nop>')
map('<Down>', '<Nop>')

-- Go up and down in command mode
cnoremap('<C-j>', ':norm nzz')
cnoremap('<C-k>', '<Up>')

-- cd to directory of current file
nnoremap('<leader>cd', ':cd %:p:h<CR>')
