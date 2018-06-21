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
Plug 'w0rp/ale'

" JS
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" CSS in JS
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
"
" CSS
" Plug 'hail2u/vim-css3-syntax'
Plug 'ap/vim-css-color'

" GraphQL
Plug 'jparise/vim-graphql'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'https://github.com/EddiG/vim-snippets.git'

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
set tabstop=2

" This will cause Vim to treat all numerals as decimal,
" regardless of whether they are padded with zeros.
set nrformats=

" Allow per-project configuration
set exrc
set secure

" Map <Esc> to exit terminal-mode:
tnoremap <Esc> <C-\><C-n>

" Paste with placing the replaced content in 'the black hole register'
vnoremap p "_dP

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Linting & Formatting ==================
" ALE (Asynchronus Lint Engine)
" Use these configuration options per project
"
" let g:ale_linters = {}
" let g:ale_linters['javascript'] = ['eslint']
" let g:ale_javascript_eslint_use_global = 0
" let g:ale_javascript_eslint_suppress_missing_config = 1
" let g:ale_javascript_eslint_suppress_eslintignore = 1

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['css'] = ['prettier']
" let g:ale_javascript_prettier_use_local_config = 1
" let g:ale_fix_on_save = 1
" ========================================================


" For pangloss/vim-javascript plugin (enable Flow syntax)
let g:javascript_plugin_flow = 1

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
nmap <silent> <C-k> <C-w><Up>
nmap <silent> <C-j> <C-w><Down>
nmap <silent> <C-l> <C-w><Right>
nmap <silent> <C-h> <C-w><Left>

" Map keys for window resizing
nmap <silent> <C-n> <C-w><
nmap <silent> - <C-w>-
nmap <silent> = <C-w>+
nmap <silent> <C-m> <C-w>>

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Define files that have json format
autocmd BufRead,BufNewFile .babelrc,.eslintrc,.prettierrc set filetype=json

" Define files that have javascript format
autocmd BufRead,BufNewFile *.ts set filetype=javascript

" Define files that have yaml format
autocmd BufRead,BufNewFile .graphcoolrc set filetype=yaml

" Trigger configuration (Optional)
let g:UltiSnipsExpandTrigger="<C-l>"
