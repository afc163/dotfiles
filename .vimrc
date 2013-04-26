" 设置为vim模式
set nocompatible

"""""""""""""""""""""""""""""""""""""""
"Vundle
"""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" My Bundles here:

" vim-scripts repos

" Syntax
Bundle 'asciidoc.vim'
Bundle 'html5.vim'
Bundle 'JavaScript-syntax'
Bundle 'tpope/vim-markdown'
Bundle 'nono/jquery.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'gmarik/vundle'

" Color
Bundle 'Color-Sampler-Pack'
Bundle 'ap/vim-css-color'
Bundle 'tomasr/molokai'

" Plugin
Bundle 'The-NERD-tree'
Bundle 'jsbeautify'
Bundle 'The-NERD-Commenter'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle "garbas/vim-snipmate"

Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-surround'

Bundle 'vim-scripts/vimwiki'

"""""""""""""""""""""""""""""""""""""""
" 自定义设定
"""""""""""""""""""""""""""""""""""""""

" 不要 swp 文件
set nobackup
set nowritebackup
set noswapfile

" 命令记忆历史的行数
set history=600

"256 color
let t_Co=256

set laststatus=2

" 制表符为4
set tabstop=4

" 统一缩进为4
set softtabstop=4
set shiftwidth=4

" 设定所有tab为4个空格
set expandtab

" 不折行
set nowrap

" 删除tab时，不需要删四次
set smarttab

set autochdir

" 开启水平滚动条
set guioptions+=b

" 继承前一行的缩进方式，特别适用于多行注释
set autoindent

" 高亮显示匹配的括号
set showmatch

" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch

" 侦测文件类型
filetype on

" 载入文件类型插件
filetype plugin on

" 为特定文件类型载入相关缩进文件
filetype indent on

" 语法高亮
syntax enable 

" 增强模式中的命令行自动完成操作
set wildmenu

" 选择配色方案
colorscheme molokai

" 字体 
set guifont=Andale\ Mono:h16

" 显示行号
set number

" 设置编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"开启折叠
let b:javascript_fold=1  
"启用对dom html css高亮支持
let javascript_enable_domhtmlcss=1

" 执行当前文件
function! ExcuteFile()
    let file = expand("%:p")
    exec ":update " . file
    echo file
    exec ":silent ! open " . file
endfunction
nmap ff :call ExcuteFile()<cr>

" 打开和关闭文件浏览器
map <F5> :NERDTreeToggle<cr>

" 过滤nerdtree的文件显示
:let NERDTreeIgnore=['\.DS_Store','\.svn','\.swp']

" 光标向下移动时留5行空间
set so=5

" 高亮搜索文本
set hlsearch

" 命令行行高
set cmdheight=1

" 默认不折叠代码
set nofoldenable

" 切换切割窗口
nmap <Tab> <C-w>w

" 高亮当前行
set cursorline

" 高亮当前列
set cursorcolumn

" 去掉工具栏
set guioptions-=m
set guioptions-=T

set list
set listchars=tab:▸\ ,extends:❯,precedes:❮

" choose theme
let g:Powerline_symbols = 'unicode'

" jquery color
au BufRead,BufNewFile *.js set syntax=jquery
