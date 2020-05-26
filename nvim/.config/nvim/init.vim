" Tronje's init.vim
" Some stuff in here is excluse to neovim, like the name and location of the
" file, but also `deoplete` and possibly other things.
"
" This is not the greatest vimrc ever, but it's okay.


""" VimPlug
call plug#begin(expand('~/.config/nvim/plug'))

" Language support
Plug 'plasticboy/vim-markdown', {'depends': 'godlygeek/tabular'}
Plug 'lervag/vim-latex'
"Plug 'pangloss/vim-javascript'
"Plug 'othree/html5.vim'
"Plug 'hail2u/vim-css3-syntax'
Plug 'rust-lang/rust.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'fatih/vim-go'
Plug 'cespare/vim-toml'
"Plug 'neovimhaskell/haskell-vim'
Plug 'elmcast/elm-vim'
Plug 'mitsuhiko/vim-python-combined'
Plug 'tronje/python.vim'
Plug 'vim-scripts/django.vim'
Plug 'solarnz/thrift.vim'
Plug 'vim-jp/vim-cpp'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'matze/vim-meson'
Plug 'tronje/kernel.vim'
Plug 'dart-lang/dart-vim-plugin'
Plug 'tronje/dart.vim'
Plug 'lifepillar/pgsql.vim'

" Looks
Plug 'bling/vim-airline'
"Plug 'flazz/vim-colorschemes'
"Plug 'gorodinskiy/vim-coloresque' " breaks . keyword
Plug 'luochen1990/rainbow'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/goyo.vim'

" Functionality
"Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Valloric/MatchTagAlways'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" Plug 'scrooloose/syntastic'
Plug 'xuhdev/vim-latex-live-preview', { 'for':'tex' }
Plug 'rhysd/vim-clang-format'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'qpkorr/vim-bufkill'
" Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nixprime/cpsm', {'do': './install.sh'}
Plug 'tacahiroy/ctrlp-funky'
Plug 'vim-scripts/a.vim'
Plug 'romainl/vim-qf'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf.vim'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }

call plug#end()

" Required:
filetype plugin indent on
""" /VimPlug


""" basics
set title               " set window title
let mapleader = ","     " map leader to ,
set mouse=a             " make sure mouse is used in all cases.
set t_Co=256            " set 256 color
set termguicolors       " True Color support
colorscheme gruvbox     " font colors scheme
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
set scrolloff=5         " keep 2 lines spacing between cursor and edge"
set background=dark     " we don't like bright white terminals
set number              " show line numbers
syntax on               " enable syntax highlighting

" make background transparent
" hi Normal ctermbg=NONE

" cursor settings
set cursorline        " highlight cursor line
" set cursorcolumn      " highlight cursor column

" colored line at 80 characters
set colorcolumn=80

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
" set expandtab           " insert spaces instead of tab chars
set tabstop=4           " a n-space tab width
set shiftwidth=4        " allows the use of < and > for VISUAL indenting
" set softtabstop=4       " counts n spaces when DELETE or BCKSPCE is used
set autoindent          " auto indents next new line
set smarttab            " remember indent
set listchars=tab:→·    " show trail spaces and tabstchars
set list
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
"
" make sure code isn't folded because it's annoying
"set nofoldenable
set foldlevelstart=99

" map : to ; in normal mode
map ; :

" for git log files, K should open a buffer with commit info
autocmd FileType git nmap K
            \ :botright new <bar>
            \ :setlocal buftype=nofile bufhidden=wipe nobuflisted <bar>
            \ :read !git show <C-r><C-w><CR>
            \ gg0d_
            \ :setlocal nomodifiable<CR>
            \ :setlocal filetype=git<CR>

" set :grep command to ripgrep
set grepprg=rg\ --vimgrep

" autocorrect :rg to :Rg for ease of typing
cnoreabbrev rg grep

" for the built-in terminal (:term), bind ESC to return to normal mode
" ...the normal key combo is a bit ridiculous
tnoremap <Esc> <C-\><C-n>

" insert a checkmark
nnoremap <leader>ok a <C-k>OK<Esc>
""" /basics


""" lanuage stuff
" c
autocmd BufNewFile,BufRead *.h setlocal filetype=c
autocmd FileType c setlocal noexpandtab
autocmd FileType c setlocal tabstop=8
autocmd FileType c setlocal shiftwidth=8
autocmd FileType c setlocal softtabstop=8

" rust
autocmd FileType rust setlocal colorcolumn=""
autocmd FileType rust setlocal colorcolumn=100

" dart
autocmd FileType dart setlocal expandtab
autocmd FileType dart setlocal tabstop=2
autocmd FileType dart setlocal shiftwidth=2
autocmd FileType dart setlocal softtabstop=2
autocmd FileType dart RainbowToggleOn
""" /language stuff


""" vim-clang-format
let g:clang_format#style_options = {
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "BasedOnStyle" : "LLVM",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
""" /vim-clang-format


""" vim-airline
" set airline theme
" let g:airline_theme='wombat'
let g:airline_theme='gruvbox'
" let g:airline_theme='simple'
let g:airline_powerline_fonts = 1

set laststatus=2

let g:airline_powerline_fonts = 1
" uncomment to turn off powerline arrow things which sometimes look terrible
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ''
" let g:airline#extensions#tabline#right_sep = ''
" let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_alt_sep = ''
""" /vim-airline


""" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

autocmd FileType c let g:syntastic_auto_loc_list = 0

"" language-specific stuff
" python
let g:syntastic_python_checkers = ['flake8', 'python']
let g:python_highlight_builtins = 1

" rust
autocmd FileType rust let g:syntastic_rust_checkers = ['cargo']

" latex
autocmd FileType tex,latex let g:syntastic_auto_loc_list = 0

"" eye candy
let g:syntastic_error_symbol = '✘'
let g:syntastic_style_error_symbol = '!'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '‽'
""" /syntastic


""" deoplete
" auto completion stuff
set ofu=syntaxcomplete#Complete
set complete+=k         " enable dictionary completion
set completeopt=menuone,menu,longest,preview

let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 0
let g:deoplete#sources#rust#racer_binary='/home/tronje/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/tronje/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

" inoremap <silent><expr> <TAB> deoplete#mappings#manual_complete()
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}


" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
""" /deoplete


""" vim-latex-live-preview
let g:livepreview_previewer = 'evince'
""" /vim-latex-live-preview


""" NERDTree
nnoremap <silent> <F6> :NERDTreeToggle<CR>
inoremap <silent> <F6> <esc>:NERDTreeToggle<CR>a
""" /NERDTree


""" Tagbar
" nmap <F8> :TagbarToggle<CR>
"
" let g:tagbar_type_rust = {
"             \ 'ctagstype' : 'rust',
"             \ 'kinds' : [
"             \'T:types,type definitions',
"             \'f:functions,function definitions',
"             \'g:enum,enumeration names',
"             \'s:structure names',
"             \'m:modules,module names',
"             \'c:consts,static constants',
"             \'t:traits',
"             \'i:impls,trait implementations',
"             \]
"             \}
""" /Tagbar


""" CtrlP

" use FZF instead of Ctrlp on Ctrl+p
nnoremap <silent> <C-p> :Files<CR>

" put Ctrlp on Ctrl+shift+[ instead
let g:ctrlp_map = '<c-{>'

let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'rg %s --files -i --color=never --glob ''!.git'' --glob ''!.DS_Store'' --glob ''!node_modules'' --hidden --no-messages -g ""'
let g:ctrlp_extensions = ['funky']
let g:ctrlp_use_caching = 0

" ctrlp's buffer search
nnoremap <C-b> :CtrlPBuffer<cr>

" cpsm
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}

" ctrlp-funky
nnoremap <C-l> :CtrlPFunky<cr>
let g:ctrlp_funky_matchtype = 'path'
let g:ctrlp_funky_syntax_highlight = 1
""" /CtrlP


""" a.vim
nmap <silent> <C-a> :A<cr>
""" /a.vim


""" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_no_function_highlight = 0
""" /vim-cpp-enhanced-highlight


""" rainbow
let g:rainbow_active = 0 " disable by default
autocmd FileType html :RainbowToggleOn
""" /rainbow


""" ale
let g:ale_linters = {
            \    'dart': ['language_server'],
            \    'rust': ['rls'],
            \ }
let g:ale_rust_rls_toolchain = 'stable'
let g:ale_sign_error = '⨉'
let g:ale_sign_warning = '⚠'

" disable ALE in CtrlP windows
autocmd BufEnter ControlP let b:ale_enabled = 0
""" /ale


""" pgsql
let g:sql_type_default = 'pgsql'
""" /pgsql


""" misc
" spell check
map <F12> :w<CR>:!aspell -c %<CR><CR>:e<CR><CR>


" restore position
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" highlight trailing whitespace
highlight ExtraWhitespace term=standout ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" don't highlight in git logs
autocmd FileType git call clearmatches()


" file types
autocmd FileType python let python_highlight_all = 1
autocmd FileType python let python_highlight_space_errors = 1
autocmd FileType python let python_slow_sync = 1
autocmd Filetype tex,latex :set dictionary=~/.vim/dict/latex.dict

" email editing using Goyo
au Filetype mail setlocal textwidth=0
au Filetype mail setlocal wrapmargin=0
au Filetype mail setlocal linebreak
au Filetype mail setlocal nobreakindent
au Filetype mail setlocal showbreak=
au FileType mail Goyo | 6

" when leaving Goyo, leave vim as well
function! s:goyo_leave()
    :q
endfunction

autocmd! User GoyoLeave nested call <SID>goyo_leave()


" cycle through buffers
nmap <silent> <tab> :bnext<CR>
nmap <silent> <s-tab> :bprevious<CR>


" disable page up, page down keys
" because they annoy me
" map <PageUp> <Nop>
" map <PageDown> <Nop>
" imap <PageUp> <Nop>
" imap <PageDown> <Nop>

""" the end
