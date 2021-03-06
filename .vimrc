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
set relativenumber
set so:5  " 5 line buffer on top/bottom of screen "

" Persistent undo
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

nmap j gj
nmap k gk
"swap 0 and ^
nnoremap 0 ^
nnoremap ^ 0
vnoremap 0 ^
vnoremap ^ 0
onoremap 0 ^
onoremap ^ 0
" Maintain visual mode after shifting
vmap < <gv
vmap > >gv

" Show hidden characters "
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_

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

" General
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-fugitive'
Plug 'unblevable/quick-scope'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/LustyJuggler'
Plug 'Valloric/YouCompleteMe'
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'
Plug 'godlygeek/tabular'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jpalardy/vim-slime'
Plug 'valloric/MatchTagAlways'
Plug 'alvan/vim-closetag'
Plug 'SirVer/ultisnips'
Plug 'jimgswang/vim-snippets'
Plug 'jimgswang/jsnippets'

" Util
Plug 'vim-scripts/SyntaxAttr.vim'

" JS/JSX
Plug 'ternjs/tern_for_vim'
Plug 'jimgswang/vim-javascript'
Plug 'othree/yajs.vim'
Plug 'moll/vim-node'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'Quramy/vim-js-pretty-template'
Plug 'mtscout6/syntastic-local-eslint.vim'

"Plug 'othree/html5.vim'

" UI
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'Yggdroot/indentline'
Plug 'junegunn/rainbow_parentheses.vim'

" Themes / Colors
Plug 'jimgswang/mango.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'flazz/vim-colorschemes'
Plug 'romainl/apprentice'
Plug 'w0ng/vim-hybrid'

call plug#end()

" conflicts with quickscope
"call yankstack#setup()

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
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

let g:syntastic_javascript_checkers=['eslint']
"let g:syntastic_debug= 3

let g:airline_theme='bubblegum'

let g:javascript_plugin_jsdoc = 1

let tern#is_show_argument_hints_enabled = 1
let g:ycm_autoclose_preview_window_after_completion = 1

let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:tmuxline_powerline_separators = 0

let g:jsx_ext_required = 0

let g:ag_working_path_mode = 'r'

" Quickscope on f, F, t, T
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'js' : 1,
    \ 'javascript.jsx' : 1,
    \}

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'

" Yggdroot/indentline
let g:indentLine_char = '│'

let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

autocmd QuickFixCmdPost *grep* cwindow
"
" html completion "
:iabbrev </ </<C-X><C-O>

colorscheme apprentice
match Label /[A-Z]\{2,\}/ 

set tags=tags;

" Clipboard
set clipboard=unnamedplus
vnoremap <C-c> "+y

ca Ag Ag!
ca Ags Ag! -Q

nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
