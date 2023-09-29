vim.api.nvim_create_autocmd(
	{ 'BufNewFile', 'BufRead' },
	{
		pattern = { '*.service', '*.target', '*.timer', '*.unit' },
		callback = function()
			vim.cmd.setfiletype('systemd')
		end
	}
)
