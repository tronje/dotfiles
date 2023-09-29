vim.api.nvim_create_autocmd(
	'FileType',
	{
		pattern = 'python',
		callback = function()
			-- "Black" formatter line length
			vim.opt_local.colorcolumn = '88'
		end
	}
)

-- format with Black when saving
vim.api.nvim_create_autocmd(
	'BufWritePre',
	{
		pattern = '*.py',
		callback = function()
			vim.cmd.Black()
		end
	}
)
