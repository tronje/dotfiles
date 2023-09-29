-- git file search
vim.keymap.set('n', '<C-p>', ':GFiles --recurse-submodules<CR>', { silent = true })

-- fallback on Ctrl+F for when not inside a git repo
vim.keymap.set('n', '<C-f>', ':Files<CR>', { silent = true })

-- search through buffers
vim.keymap.set('n', '<C-b>', ':Buffers<CR>')

-- lines in a buffer
vim.keymap.set('n', '<C-l>', ':BLines<CR>')
