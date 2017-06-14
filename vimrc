set nocompatible

call plug#begin('~/.vim/plugged')

" Theme
Plug 'morhetz/gruvbox'

" Explore
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug 'vim-airline/vim-airline'

" Editor
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Checker
Plug 'neomake/neomake'

" Language specified
" JS
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" CSS in JS
" Plug 'fleischie/vim-styled-components'
" CSS
Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'https://github.com/EddiG/vim-snippets.git'

" Brings the ablility to find the utility in current node project
Plug 'jaawerth/nrun.vim'

" Formatter
Plug 'sbdchd/neoformat'

call plug#end()

syntax on

" Set the leader key
let mapleader=","
noremap \ ,

" Theme
let g:gruvbox_italic=1
set background=dark
colorscheme gruvbox

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Ignore letter case in search pattern
set ignorecase

" Honor letter case if the pattern contains uppercase letters
set smartcase

" Show suggestions in the command pallete
set wildmenu

" Highlighting the search result
set hlsearch

" Show line number
set number

" Turn off unnecessary backups
set nobackup
set noswapfile
set nowb

set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2

" This will cause Vim to treat all numerals as decimal,
" regardless of whether they are padded with zeros.
set nrformats=

" Map <Esc> to exit terminal-mode:
:tnoremap <Esc> <C-\><C-n>

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Syntastic configuration
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_debug = 3
" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_aggregate_errors = 1
" let g:syntastic_check_on_wq = 0

" " let g:syntastic_javascript_checkers = ['eslint', 'flow']
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_exe = 'npm run --silent eslint -- -f compact'

" Neomake
let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
let g:neomake_javascript_eslint_exe = nrun#Which('eslint')
let g:neomake_javascript_flow_exe = nrun#Which('flow')

autocmd! BufWritePost * Neomake

" For pangloss/vim-javascript plugin (enable Flow syntax)
let g:javascript_plugin_flow = 1

" For mxw/vim-jsx plugin (disable the jsx extension requiring)
let g:jsx_ext_required = 0

" Deoplete (autocomplete)
let g:deoplete#enable_at_startup = 1

" NERDTree
nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>

" Ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Airline
let g:airline#extensions#tabline#enabled = 0
set laststatus=2

" Bufexplorer
let g:bufExplorerDisableDefaultKeyMapping=1
let g:bufExplorerShowRelativePath=1
nnoremap <leader>b :BufExplorer<CR>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Prettier for JS formatting (gq command)
" Previously you should install prettier (npm install -g prettier)
" airbnb
autocmd FileType javascript set formatprg=prettier\ --single-quote\ --trailing-comma\ all\ --stdin
" standardjs
" autocmd FileType javascript set formatprg=prettier-standard

" Prettier autoformat on save
" autocmd BufWritePre *.js :normal gggqG

" Neoformat
let g:neoformat_try_formatprg = 1
autocmd BufWritePre *.js Neoformat

" Trigger configuration (Optional)
let g:UltiSnipsExpandTrigger="<C-l>"

" Define how to enter in the PASTE mode
" imap <silent> <F4> <ESC>:set invpaste<CR>

" " Define how to clear serch higlight
" nnoremap <esc> :noh<return><esc>

" " Define how to insert empty lines from the normal mode
" " nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
" " nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" " ======== Commands ========
" " gc        -     Toggle comment block
" " gcc       -     Toggle comment line
" " leader+b  -     Show buffers list
" " <C>+p     -     Fuzzy search files
" " <C>+\     -     Open file location in NERDTree
