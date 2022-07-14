" leader
let mapleader = " "

" system setting
let $PATH = "C:\\Program Files\\Git\\usr\\bin;" . $PATH

" encoding
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif

" gui setting
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" toggle menu and toolbar with F3
map <silent> <F3> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

" basic setting
set nobackup
set noswapfile
set nowritebackup
set noundofile
set nowrap
set history=1000
set scrolloff=3
set incsearch
set hlsearch
set nu
set rnu
set ignorecase
set smartcase
set showmatch
set tabstop=4
set cursorline
set cursorcolumn
set backspace=indent,eol,start
set ts=4
set expandtab
set autoindent
set langmenu=en_US
set hidden
set splitbelow
set splitright
set autochdir
set wildmode=list:longest,full
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
let $LANG= 'en_US'
let g:sql_type_default = 'mysql'
let g:VM_mouse_mappings = 1
syntax on

" standard stlye cut/copy/paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" key mapping
vnoremap < <gv
vnoremap > >gv
nmap <A-z> :call ToggleWrap()<CR>

" plug manager
call plug#begin()
Plug 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 300

Plug 'mg979/vim-visual-multi', {'branch': 'master'}
nmap   <C-LeftMouse>         <Plug>(VM-Mouse-Cursor)
nmap   <C-RightMouse>        <Plug>(VM-Mouse-Word)  
nmap   <M-C-RightMouse>      <Plug>(VM-Mouse-Column)

Plug 'junegunn/vim-easy-align'
xmap ga <plug>(EasyAlign)
nmap ga <plug>(EasyAlign)

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
let g:fzf_layout = { 'down': '~40%' }

Plug 'preservim/vim-markdown'
let g:vim_markdown_conceal = 0
let g:vim_markdown_toc_autofit = 1

Plug 'godlygeek/tabular'
Plug 'itchyny/calendar.vim'
Plug 'justinmk/vim-sneak'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
let g:startify_custom_header = []
let g:startify_custom_footer = []

call plug#end()

" functions
" auto session
function SvSession()
    "execute 'mksession! ' . '~/session.vim'
endfunction

function LdSession()
    "execute 'source ' . '~/session.vim'
endfunction

autocmd VimLeave * call SvSession()
autocmd VimEnter * nested call LdSession()

" toggle wrap
function ToggleWrap()
    set wrap!
endfunction
