vim.api.nvim_create_autocmd(
	'FileType',
	{
		pattern = 'cpp',
		callback = function()
			vim.opt_local.expandtab = false
			vim.opt_local.tabstop = 4
			vim.opt_local.shiftwidth = 4
			vim.opt_local.softtabstop = 4
			vim.opt_local.colorcolumn = '100'
		end
	}
)

vim.g.cpp_class_scope_highlight = 1
vim.g.cpp_experimental_template_highlight = 0
vim.g.cpp_no_function_highlight = 0
