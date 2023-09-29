vim.api.nvim_create_autocmd(
	'FileType',
	{
		pattern = 'dart',
		callback = function()
			vim.opt_local.expandtab = true
			vim.opt_local.tabstop = 2
			vim.opt_local.shiftwidth = 2
			vim.opt_local.softtabstop = 2
			vim.cmd.RainbowToggleOn()
		end
	}
)

-- format with DartFmt when saving
vim.api.nvim_create_autocmd(
	'BufWritePre',
	{
		pattern = '*.dart',
		callback = function()
			vim.cmd.DartFmt()
		end
	}
)
