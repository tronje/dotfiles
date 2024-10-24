local Plug = vim.fn['plug#']

vim.fn['plug#begin'](vim.fn.expand('~/.config/nvim/plug'))

-- Language support
Plug('plasticboy/vim-markdown')
Plug('pangloss/vim-javascript')
Plug('othree/html5.vim')
Plug('hail2u/vim-css3-syntax')
Plug('rust-lang/rust.vim')
Plug('vim-jp/vim-cpp')
Plug('octol/vim-cpp-enhanced-highlight')
Plug('cespare/vim-toml')
Plug('mitsuhiko/vim-python-combined')
Plug('tronje/python.vim')
Plug('solarnz/thrift.vim')
Plug('kergoth/vim-bitbake')
Plug('Glench/Vim-Jinja2-Syntax')
Plug('matze/vim-meson')
Plug('dart-lang/dart-vim-plugin')
Plug('tronje/dart.vim')
Plug('jparise/vim-graphql')
Plug('folke/neodev.nvim')

-- Looks
Plug('bling/vim-airline')
Plug('luochen1990/rainbow')
Plug('morhetz/gruvbox')
Plug('vim-airline/vim-airline-themes')

-- Functionality
Plug('tpope/vim-fugitive')
Plug('junegunn/gv.vim')
Plug('airblade/vim-gitgutter')
Plug('Valloric/MatchTagAlways')
Plug('tomtom/tcomment_vim')
Plug('scrooloose/nerdtree')
Plug('tpope/vim-repeat')
Plug('tpope/vim-surround')
Plug('rhysd/vim-clang-format')
Plug('godlygeek/tabular')
Plug('jiangmiao/auto-pairs')
Plug('qpkorr/vim-bufkill')
Plug('tronje/a.vim')
Plug('romainl/vim-qf')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope-fzf-native.nvim')
Plug('nvim-telescope/telescope.nvim', { branch = '0.1.x' })
Plug('j-hui/fidget.nvim')

-- Completion
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')

-- Snippets
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')

-- custom
Plug('~/prj/nsdk.vim')
Plug('~/prj/aldrin.vim')
Plug('~/prj/kernel.vim')

vim.fn['plug#end']()

-- Required:
vim.cmd.filetype('plugin', 'indent', 'on')
