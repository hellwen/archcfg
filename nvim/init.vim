
" set leader
let mapleader = "\<Space>"

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" 自动切换输入法
Plug 'https://github.com/vim-scripts/fcitx.vim.git'
" 颜色插件
Plug 'morhetz/gruvbox'
" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 符号对齐，用于对齐代码中的=号两边
Plug 'junegunn/vim-easy-align'
" 缩进高亮，显示一条竖线
" Plug 'Yggdroot/indentLine'

" HTML Style
Plug 'mattn/emmet-vim'

" Vue Style
Plug 'posva/vim-vue'

" ctrlp
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

syntax enable
set background=dark
colorscheme gruvbox
" 设置空白字符的视觉提示
set list listchars=tab:>·,trail:♫,nbsp:+,precedes:☜,extends:☞
" 高亮当前行
set cursorline
" 行号，相对行号
set number
set relativenumber
" 文件类型检查
filetype on

"制表符长度
set tabstop=4
set softtabstop=4
"tab长度
set shiftwidth=4
"将tab转换成space
set expandtab

" 复制到系统中
noremap <Leader>y "+y
noremap <Leader>d "+d
noremap <Leader>p "+p
noremap <Leader>P "+P
" set clipboard+=unnamedplus

" fzf
map <Leader>f <ESC>:FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" 分屏幕
map <Leader>s <C-w>s
map <Leader>v <C-w>v
" map <Leader>S <ESC>:Sex<CR>
" map <Leader>V <ESC>:Vex<CR>
map <Leader>S <ESC>:Sex<CR><ESC>:FZF<CR>
map <Leader>V <ESC>:Vex<CR><ESC>:FZF<CR>

map <Leader>h <C-w>h
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>l <C-w>l

" 调整窗口大小：10winc + , 5winc >

" Tab or :Te
" map <Leader>t <ESC>:Tex<CR>
map <Leader>t <ESC>:Tex<CR><ESC>:FZF<CR>

" Terminal
map <Leader>e <ESC>:vs\|te<CR>
map <Leader>E <ESC>:sp\|te<CR>

" 不换行
" set nowrap

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
