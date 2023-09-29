vim.api.nvim_create_autocmd(
	'FileType',
	{
		pattern = 'rust',
		callback = function()
			vim.opt_local.colorcolumn = '100'
		end
	}
)

vim.g.rustfmt_autosave = 1

-- Fix semantic highlighting of doc comments
-- (they're highlighted as just regular comments by default)
vim.cmd.highlight({ 'link', '@lsp.typemod.comment.documentation.rust', 'GruvboxOrange', bang = true })
