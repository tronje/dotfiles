vim.cmd.colorscheme('gruvbox')
vim.cmd.syntax('on')

-- gruvbox contrast: hard
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_contrast_light = 'hard'

-- use , as <leader> key
vim.g.mapleader = ','

-- various options
vim.opt.autoindent = true
vim.opt.background = 'dark'
vim.opt.backspace = 'indent,eol,start'
vim.opt.backup = false
vim.opt.clipboard:append('unnamed')
vim.opt.cmdheight = 1
vim.opt.colorcolumn = '80'
vim.opt.cursorline = true
vim.opt.display = 'lastline'
vim.opt.foldenable = false
vim.opt.foldlevelstart = 99
vim.opt.grepprg = 'rg --vimgrep'
vim.opt.hidden = true
vim.opt.history = 100
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.lbr = true
vim.opt.list = true
vim.opt.listchars = { tab = '→·' }
vim.opt.matchpairs:append('<:>')
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.ruler = true
vim.opt.scrolloff = 5
vim.opt.shiftwidth = 4
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.showmode = true
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest,full'
vim.opt.wrap = true
vim.opt.ww = '<,>,[,]'

-- search for selected string in visual mode with //
vim.keymap.set('v', '//', 'y/<C-R>"<CR>"')

-- map : to ; for ease of typing
vim.keymap.set('', ';', ':')

-- use Esc to enter normal mode in terminal
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- cycle through buffers with Tab and Shift-Tab
vim.keymap.set('n', '<tab>', ':bnext<CR>', { silent = true })
vim.keymap.set('n', '<s-tab>', ':bprevious<CR>', { silent = true })

-- insert a checkmark with ,ok
vim.keymap.set('n', '<leader>ok', 'a<C-k>OK<ESC>')

-- use Ctrl-a to open header file for current buffer
vim.keymap.set('n', '<C-a>', ':A<CR>')

-- restore position in file
vim.api.nvim_create_autocmd(
	'BufReadPost',
	{
		pattern = '*',
		callback = function()
			-- if the line that was exited from is greater than one and less than the last line, go there
			-- (accounts for changes to the file not made by nvim)
			if vim.fn.line('\'"') > 1 and vim.fn.line('\'"') <= vim.fn.line('$') then
				vim.cmd.normal('g`"')
			end
		end
	}
)

-- setup fidget
require("fidget").setup({})
