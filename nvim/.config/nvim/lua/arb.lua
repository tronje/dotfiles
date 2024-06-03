vim.api.nvim_create_autocmd(
	{ 'BufNewFile', 'BufRead' },
	{
		pattern = '*.arb',
		callback = function()
			vim.opt_local.filetype = 'json'
			vim.opt_local.expandtab = true
			vim.opt_local.tabstop = 2
			vim.opt_local.shiftwidth = 2
			vim.opt_local.softtabstop = 2
		end
	}
)
