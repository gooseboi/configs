function nnoremap(keys, value)
	vim.keymap.set('n', keys, value, {silent = true, noremap = true})
end

function vnoremap(keys, value)
	vim.keymap.set('v', keys, value, {silent = true, noremap = true})
end

function cnoremap(keys, value)
	vim.keymap.set('c', keys, value, {silent = true, noremap = true})
end

function map(keys, value)
	vim.keymap.set('', keys, value, {silent = true})
end

-- Set the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
nnoremap('<Space>', '<Nop')

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
nnoremap('<C-j>', ':m .+1<CR>gv=gv')
nnoremap('<C-k>', ':m .-2<CR>gv=gv')

-- Move lines in visual mode (by ThePrimeagen)
vnoremap('<C-k>', ":m '<-2<CR>gv=gv")
vnoremap('<C-j>', ":m '>+1<CR>gv=gv")

-- Go to start and end of line
map('H', '^')
map('L', '$')

-- Switch between current and last used buffers
nnoremap('<leader><leader>', '<C-^>')

-- Quick movement
nnoremap('J', '10j')
nnoremap('K', '10k')

-- Disable useless keys
map('<F1>', '<Nop>')
map('<Up>', '<Nop>')
map('<Left>', '<Nop>')
map('<Right>', '<Nop>')
map('<Down>', '<Nop>')

-- Go up and down in command mode
cnoremap('<C-j>', ':norm nzz')
cnoremap('<C-k>', '<Up>')
