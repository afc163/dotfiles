" 设置为vim模式
set nocompatible

"""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" My Bundles here:

Bundle 'asciidoc.vim'
Bundle 'html5.vim'
Bundle 'JavaScript-syntax'
Bundle 'nono/jquery.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'gmarik/vundle'
Bundle 'Color-Sampler-Pack'
Bundle 'ap/vim-css-color'
Bundle 'tomasr/molokai'
Bundle 'vim-scripts/rdark'
Bundle 'wavded/vim-stylus'
Bundle 'The-NERD-tree'
Bundle 'jsbeautify'
Bundle 'The-NERD-Commenter'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'airblade/vim-gitgutter'
Bundle 'itchyny/lightline.vim'
" Bundle 'scrooloose/syntastic'
Bundle 'ciaranm/detectindent'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'bronson/vim-trailing-whitespace'

"""""""""""""""""""""""""""""""""""""""
" 自定义设定
"""""""""""""""""""""""""""""""""""""""

" 不要 swp 文件
set nobackup
set nowritebackup
set noswapfile

" 命令记忆历史的行数
set history=600

" 256 color
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

" 自动切换工作目录，以当前打开的文件所在目录为准
set autochdir

" 开启水平滚动条
set guioptions+=b

" 开启水平滚动条

" 继承前一行的缩进方式，特别适用于多行注释
set autoindent

" 高亮显示匹配的括号
set showmatch

" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch

" 侦测文件类型
filetype on

" 载入文件类型插件
"filetype plugin on

" 为特定文件类型载入相关缩进文件
filetype indent on

set guioptions+=M

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

" 开启 javascript 折叠
let b:javascript_fold=1

" 启用对dom html css高亮支持
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

" NERDTree 的默认宽度
let g:NERDTreeWinSize = 24

au VimEnter * NERDTree

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

" key leader
let mapleader = ","

" 高亮当前行
set cursorline

" 高亮当前列
set cursorcolumn

" 显示上区分 tab 和空格
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮

" choose powerline theme
" let g:Powerline_symbols = 'unicode'

" jquery color
autocmd BufRead,BufNewFile *.js set syntax=jquery

" auto detect file indent
autocmd BufReadPost,FileReadPost *.html DetectIndent
autocmd BufReadPost,FileReadPost *.js DetectIndent
autocmd BufReadPost,FileReadPost *.styl DetectIndent

:let g:detectindent_preferred_expandtab = 1
:let g:detectindent_preferred_indent = 4
:let g:detectindent_max_lines_to_analyse = 1024


let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" http://www.2maomao.com/blog/wp-content/uploads/vim_tips.txt
vnoremap < <gv
vnoremap > >gv

" 修改后自动生效
autocmd! bufwritepost .vimrc source % "
