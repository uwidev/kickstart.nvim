-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>qe', vim.cmd.Ex, { desc = 'File [e]xplorer' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')

-- Keep buffer centered when moving around
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- vim.keymap.set('n', '<leader>zig', '<cmd>LspRestart<cr>')

-- Quick nav when in insert mode
vim.keymap.set('i', 'jj', '<Esc>j', { noremap = true, silent = true })
vim.keymap.set('i', 'kk', '<Esc>k', { noremap = true, silent = true })
vim.keymap.set('i', 'll', '<Esc>l', { noremap = true, silent = true })
vim.keymap.set('i', 'hh', '<Esc>h', { noremap = true, silent = true })

-- Paste over selection while keeping original paste
-- Normally, when deleting the selection to paste over it, the deleted text
-- will overwrite the current register. Since in cases like this, our usual
-- intention is to forget what we're overwriting, so write to blackhole reg.
vim.keymap.set('x', '<leader>p', [["_dP]])

-- Use system clipboard on leader
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = '[y]ank motion to system clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = '[Y]ank line(s) to system clipboard' })

vim.keymap.set({ 'n', 'v' }, '<leader>p', [["+p]], { desc = '[p]aste from system clipboard' })
vim.keymap.set('n', '<leader>p', [["+P]], { desc = '{P}aste above from system clipboard' })

-- There exists conflicting keymap <leader>d for diagnostics
-- vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]], { desc = '[d]elete to blackhole' })

-- This is going to get me cancelled
-- vim.keymap.set('i', '<C-c>', '<Esc>')

-- vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- Allows for faster edit-compile-edit cycles
-- see `:h quickfix`
-- vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
-- vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
-- vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
-- vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

vim.keymap.set('n', '<leader>sS', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[S]earch and [S]ubstitute under cursor' })
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'chmod +[x] current file' })

-- vim.keymap.set('n', '<leader><leader>', function()
-- 	vim.cmd 'so'
-- end)

-- [[ Basic Keymaps from Kickstart ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
	vim.diagnostic.jump { count = -1 }
end, { desc = 'Go to previous [d]iagnostic message' })
vim.keymap.set('n', ']d', function()
	vim.diagnostic.jump { count = 1 }
end, { desc = 'Go to next [d]iagnostic message' })
vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, { desc = 'Show [d]iagnostic [e]rror messages' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open [d]iagnostic [q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--gc
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
