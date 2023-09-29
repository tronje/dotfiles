-- highlight trailing whitespace
vim.cmd.match('ExtraWhitespace', '/\\s\\+$/')
vim.cmd.highlight('ExtraWhitespace', 'guibg=red')
