local builtin = require('telescope.builtin')

-- git file search
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- fallback on Ctrl+F for when not inside a git repo
vim.keymap.set('n', '<C-f>', builtin.find_files, {})

-- search through buffers
vim.keymap.set('n', '<C-b>', builtin.buffers, {})

-- lines in a buffer
vim.keymap.set('n', '<C-l>', builtin.current_buffer_fuzzy_find, {})

-- use 's :Rg to search for word under cursor with ,/
vim.keymap.set('n', '<leader>/', builtin.grep_string, {})

-- ,rf to search references known to the LSP to the word under the cursor
vim.keymap.set('n', '<leader>rf', builtin.lsp_references, {})

-- search sessions
local session_lens = require('session-lens')
vim.keymap.set('n', '<C-s>', session_lens.search_session, {})
