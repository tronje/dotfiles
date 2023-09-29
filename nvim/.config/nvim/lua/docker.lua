vim.api.nvim_create_autocmd(
	'FileType',
	{
		pattern = 'dockerfile',
		callback = function()
			vim.opt_local.expandtab = true
			vim.opt_local.tabstop = 4
			vim.opt_local.shiftwidth = 4
			vim.opt_local.softtabstop = 4
		end
	}
)

vim.api.nvim_create_autocmd(
	{ 'BufNewFile', 'BufRead' },
	{
		pattern = 'Dockerfile.*',
		callback = function()
			vim.cmd.setfiletype('dockerfile')
		end
	}
)
