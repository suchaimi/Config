"*****************************************************************************
"" Vim plug core
"*****************************************************************************

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing vim plug"
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif

"*****************************************************************************
"" Plug install packages
"*****************************************************************************

call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'lervag/vimtex'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-rhubarb'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'dylanaraps/wal.vim'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'plasticboy/vim-markdown'
Plug 'terryma/vim-multiple-cursors'
Plug 'machakann/vim-highlightedyank'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'honza/vim-snippets'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'

" go
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

" html
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

" js
Plug 'jelera/vim-javascript-syntax'

" php
Plug 'arnaud-lb/vim-php-namespace'

" python
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" ruby
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-projectionist'
Plug 'thoughtbot/vim-rspec'
Plug 'ecomba/vim-ruby-refactoring'

" rust
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'

" ts
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'

" vue
Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'

call plug#end()

"*****************************************************************************
"" Basic Setup
"*****************************************************************************

" required
filetype plugin indent on

" encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" some servers have issues with backup files
set nobackup
set nowritebackup

" Sane splits
set splitright
set splitbelow

" permanent undo
set undodir=~/.vimdid
set undofile

" auto read write
set autoread
set autowriteall

" fix backspace indent
set backspace=indent,eol,start

" tabs may be overridden by autocmd rules
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

" map leader to comma
let mapleader=','

" enable hidden buffers
set hidden

" searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set fileformats=unix,dos,mac

" decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*/node_modules/*,*/target/*,*.o,*.hi,Zend,vendor

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
if !exists('g:syntax_on')
	syntax enable
endif

set ruler
set number
set linebreak
set noshowmode
set relativenumber
set mousemodel=popup
set guioptions=egmrti
set background=dark
colorscheme wal

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************

" remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

"*****************************************************************************
"" Mappings
"*****************************************************************************

" move by line
nnoremap j gj
nnoremap k gk

" f1 as esc
imap <F1> <Esc>

" ctrl-j as esc
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>

" quick save
nmap <leader>w :w<CR>

" abbreviation
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" dont use arrow key
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" jump to start and end of line using the home row keys
map H ^
map L $

" split
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" copy/paste/cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

" buffer nav
noremap <space><space> <c-^>
noremap <leader>z :bp<CR>
noremap <leader>x :bn<CR>

" close buffer
noremap <leader>c :bd<CR>

" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" vmap for maintain visual mode after shifting > and <
vmap < <gv
vmap > >gv

" move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"*****************************************************************************
"" Custom configs
"*****************************************************************************

" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab

" go
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4

" html
autocmd Filetype html setlocal ts=2 sw=2 expandtab

" latex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

" js
let g:javascript_enable_domhtmlcss = 1

" python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#smart_auto_mappings = 0

" ruby
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1

augroup vimrc-ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

" rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" ruby refactory
if has('nvim')
  runtime! macros/matchit.vim
else
  packadd! matchit
endif

" ruby refactory
nnoremap <leader>rap  :RAddParameter<cr>
nnoremap <leader>rcpc :RConvertPostConditional<cr>
nnoremap <leader>rel  :RExtractLet<cr>
vnoremap <leader>rec  :RExtractConstant<cr>
vnoremap <leader>relv :RExtractLocalVariable<cr>
nnoremap <leader>rit  :RInlineTemp<cr>
vnoremap <leader>rrlv :RRenameLocalVariable<cr>
vnoremap <leader>rriv :RRenameInstanceVariable<cr>
vnoremap <leader>rem  :RExtractMethod<cr>

" rust
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" rust
let g:rustfmt_command = 'rustfmt'
let g:rustfmt_autosave = 1

" typescript
let g:yats_host_keyword = 1

" vuejs
let g:vue_disable_pre_processors = 1
let g:vim_vue_plugin_load_full_syntax = 1

" coc
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
	\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" ctrlp
let g:ctrlp_open_new_file = 'r'

" nerdtree 
let g:NERDTreeMinimalMenu = 1
let g:NERDTreeChDirMode = 1
nnoremap <silent> <F3> :NERDTreeToggle<CR>
