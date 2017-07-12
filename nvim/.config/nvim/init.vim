call plug#begin(expand('~/.config/nvim/plug'))

" Language support
Plug 'groenewege/vim-less'
Plug 'plasticboy/vim-markdown', {'depends': 'godlygeek/tabular'}
Plug 'lervag/vim-latex'
"Plug 'pangloss/vim-javascript'
"Plug 'othree/html5.vim'
"Plug 'hail2u/vim-css3-syntax'
Plug 'rust-lang/rust.vim'
"Plug 'octol/vim-cpp-enhanced-highlight'
"Plug 'fatih/vim-go'
Plug 'cespare/vim-toml'
"Plug 'neovimhaskell/haskell-vim'

" Looks
Plug 'bling/vim-airline'
"Plug 'flazz/vim-colorschemes'
"Plug 'gorodinskiy/vim-coloresque' " breaks . keyword
"Plug 'luochen1990/rainbow'
Plug 'morhetz/gruvbox'
"not working atm
"Plug 'koron/minimap-vim'
Plug 'severin-lemaignan/vim-minimap'

" Functionality
"Plug 'Raimondi/delimitMate'
"Plug 'tpope/vim-fugitive'
"Plug 'mattn/gist-vim', {'depends': 'mattn/webapi-vim'}
Plug 'airblade/vim-gitgutter'
Plug 'michaeljsmith/vim-indent-object'
Plug 'Valloric/MatchTagAlways'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'thinca/vim-quickrun'
Plug 'sjl/gundo.vim'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'rhysd/vim-clang-format'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'

"Plug 'Valloric/YouCompleteMe', { 'do': 'python2 install.py --clang-completer --gocode-completer --racer-completer'}
Plug 'ajh17/VimCompletesMe'
Plug 'racer-rust/vim-racer'

call plug#end()

" Required:
filetype plugin indent on

" basics
set title               " set window title
let mapleader = ","     " map leader to ,
set mouse=a             " make sure mouse is used in all cases.
set t_Co=256            " set 256 color
"colorscheme tronlight   " define syntax color scheme
colorscheme gruvbox
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
set shortmess+=I        " disable the welcome screen
set clipboard+=unnamed  " yank and copy to X clipboard
set backspace=2         " full backspacing capabilities
set history=100         " 100 lines of command line history
set ruler               " ruler display in status line
set hidden              " enable buffer switching without saving
set showmode            " show mode at bottom of screen
set showcmd             " show incomplete command at bottom of screen
set ww=<,>,[,]          " whichwrap -- left/right keys can traverse up/down
set cmdheight=1         " set the command height
set showmatch           " show matching brackets (),{},[]
set matchpairs+=<:>     " match < and > as well
set mat=5               " show matching brackets for 0.5 seconds
set scrolloff=2         " keep 2 lines spacing between cursor and edge"
set background=dark     " we don't like bright white terminals
"set gfn=Bitstream\ Vera\ Sans\ Mono\ 8
"set gfn=GohuFont\ 8
"set gfn=TamzenForPowerline\ 14
"set gfn=Source\ Code\ Pro\ Light\ 11
set number              " show line numbers
syntax on               " enable syntax highlighting
"set synmaxcol=200       " for performance reason, don't highlight long lines

" set airline theme
"let g:airline_theme='bubblegum'
let g:airline_theme='gruvbox'
"let g:airline_powerline_fonts = 1

" Minimap stuff
"autocmd VimEnter * :Minimap " run Minimap on startup
let g:minimap_highlight='StatusLine'

" cursor settings
set cursorline        " highlight cursor line
set cursorcolumn      " highlight cursor column

" wrap like other editors
set wrap                " word wrap
"set textwidth=100        "
set lbr                 " line break
set display=lastline    " don't display @ with long paragraphs

" backup settings
set noswapfile          " don't create a swap file
set nobackup            " don't keep a backup file
set backupdir=/tmp      " backup dir
set directory=/tmp      " swap file directory

" tabs and indenting
set expandtab           " insert spaces instead of tab chars
set tabstop=4           " a n-space tab width
set shiftwidth=4        " allows the use of < and > for VISUAL indenting
set softtabstop=4       " counts n spaces when DELETE or BCKSPCE is used
set autoindent          " auto indents next new line
set smarttab            " remember indent
set listchars=tab:→,trail:¸ " show trail spaces and tabstchars
nnoremap <silent> <F2> :set list!<CR>
inoremap <silent> <F2> <esc>:set list!<CR>a

" command mode
set wildmenu
set wildmode=list:longest,full

" searching
set hlsearch            " highlight all search results
set incsearch           " increment search
set ignorecase          " case-insensitive search
set smartcase           " upper-case sensitive search
vnoremap // y/<C-R>"<CR>


" vim-clang-format
let g:clang_format#style_options = {
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "BasedOnStyle" : "LLVM",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>


" emmet-vim
let g:user_emmet_leader_key='<C-X>'


" vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
" uncomment to turn off powerline arrow things which sometimes look terrible
let g:airline_left_sep=''
let g:airline_right_sep=''
 let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'


" syntastic
" let g:syntastic_check_on_open = 1         " Don't check for errors until save
" let g:syntastic_python_checkers = ['flake8', 'python']
" autocmd FileType rust let g:syntastic_rust_checkers = ['rustc']


" ale
let g:ale_lint_on_text_changed = 'never'


" vim-racer
let g:racer_cmd = "/home/tronje/.cargo/bin/racer"


" auto completion stuff
set ofu=syntaxcomplete#Complete
set complete+=k         " enable dictionary completion
set completeopt=menuone,menu,longest,preview


" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif


" make sure code isn't folded because it's annoying
"set nofoldenable
set foldlevelstart=99


" vim-latex-live-preview
let g:livepreview_previewer = 'evince'


" nerdtree
nnoremap <silent> <F6> :NERDTreeToggle<CR>
inoremap <silent> <F6> <esc>:NERDTreeToggle<CR>a


" map : to ; in normal mode
map ; :


" spell check
map <F12> :w<CR>:!aspell -c %<CR><CR>:e<CR><CR>


" restore position
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
augroup END


" file types
autocmd FileType python let python_highlight_all = 1
autocmd FileType python let python_highlight_space_errors = 1
autocmd FileType python let python_slow_sync = 1
autocmd Filetype tex,latex :set dictionary=~/.vim/dict/latex.dict
"autocmd Filetype tex,latex :set textwidth=99

" gui
set guioptions-=m " remove menubar
set guioptions-=T " remove toolbar

" cycle through buffers
nmap <silent> <tab> :bnext<CR>
nmap <silent> <s-tab> :bprevious<CR>

" disable page up, page down keys
" because they annoy me
map <PageUp> <Nop>
map <PageDown> <Nop>
imap <PageUp> <Nop>
imap <PageDown> <Nop>
