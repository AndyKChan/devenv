syntax on
filetype plugin indent on

" Tabs "
set expandtab          
set softtabstop=4
set nocindent smartindent
set shiftwidth=4

" airline
set laststatus=2

autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

set virtualedit=block
set background=dark
set t_Co=256

set showcmd
set hlsearch  " highlight search

set nu
set so:5  " 5 line buffer on top/bottom of screen "

" Persistent undo
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

nmap j gj
nmap k gk

" Show hidden characters "
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

set title
set ruler

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitright
set splitbelow

let g:slime_target = "tmux"

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endi

" let mapleader=" "
map <space> <leader>
set showcmd "show leader key at bottom corner " 


" Install plugins ""
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/LustyJuggler'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'easysid/mod8.vim'
Plug 'w0ng/vim-hybrid'
Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'

Plug 'christoomey/vim-tmux-navigator'
Plug 'jpalardy/vim-slime'
Plug 'vim-scripts/SyntaxAttr.vim'

Plug 'jimgswang/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'

"Plug 'othree/html5.vim'
"
"
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'jimgswang/mango.vim'

call plug#end()

noremap <Leader>n :NERDTreeFocus<CR>

" LustyJuggler "
let g:LustyJugglerDefaultMappings = 0
noremap <Leader>j :LustyJuggler<CR>

" Set current working directory to the dir of the current file "
autocmd BufEnter * silent! lcd %:p:h"

" Remove highlight of current search "
noremap <leader>h :noh<CR>

" Vim Fugitive mappings "

noremap <leader>gs :Gstatus<CR>
noremap <leader>gd :Gdiff<CR>
noremap <leader>gb :Gblame<CR>
noremap <leader>gl :Glog<CR>
noremap <leader>gp :Gpush<CR>

noremap <leader>x :lopen<CR>

noremap <leader>sy :call SyntaxAttr()<CR>

" cntrlp mappings "

noremap <leader>f :CtrlP <CR>
noremap <leader>e :CtrlPBuffer<CR>

set wildignore+=*/dist/**
set wildignore+=*/node_modules/**
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 

" Syntastic Settings "
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_root_markers = ['.ctrlp']

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers=['eslint']

let g:airline_theme='bubblegum'

let g:javascript_plugin_jsdoc = 1

let tern#is_show_argument_hints_enabled = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:tmuxline_powerline_separators = 0

let g:jsx_ext_required = 0

autocmd QuickFixCmdPost *grep* cwindow
"
" html completion "
:iabbrev </ </<C-X><C-O>

colorscheme mango
match Label /[A-Z]\{2,\}/ 

set tags=tags;

" Clipboard
set clipboard=unnamedplus
vnoremap <C-c> "+y
