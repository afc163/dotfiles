" 设置为vim模式
set nocompatible

" 侦测文件类型
filetype off

"""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" My Bundles here:
Bundle 'gmarik/vundle'
Bundle 'asciidoc.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'ap/vim-css-color'
Bundle 'tomasr/molokai'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'wavded/vim-stylus'
Bundle 'scrooloose/nerdtree'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'scrooloose/nerdcommenter'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'airblade/vim-gitgutter'
Bundle 'itchyny/lightline.vim'
Bundle 'ciaranm/detectindent'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'jakar/vim-json'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle "lepture/vim-velocity"
Bundle "othree/html5.vim"
Bundle "gregsexton/gitv"
Bundle "tpope/vim-fugitive"
Bundle "plasticboy/vim-markdown"
Bundle "Raimondi/delimitMate"
Bundle "terryma/vim-multiple-cursors"
Bundle 'nono/jquery.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'gregsexton/MatchTag'
Bundle 'markgandolfo/nerdtree-fetch.vim'
Bundle 'moll/vim-node'
Bundle 'bigfish/vim-js-context-coloring'

"""""""""""""""""""""""""""""""""""""""
" 自定义设定
"""""""""""""""""""""""""""""""""""""""

" 不要 swp 文件
set nobackup
set nowritebackup
set noswapfile

" 命令记忆历史的行数
set history=400

" 256 color
let t_Co=256

set laststatus=2

" 制表符为2
set tabstop=2

" 统一缩进为2
set softtabstop=2
set shiftwidth=2

" 设定所有tab为4个空格
set expandtab

" 删除tab时，不需要删四次
set smarttab

" 自动切换工作目录，以当前打开的文件所在目录为准
set autochdir

" 开启水平滚动条
set guioptions+=b

" 继承前一行的缩进方式，特别适用于多行注释
set autoindent

" 高亮显示匹配的括号
set showmatch

" 在搜索时，输入的词句的逐字符高亮（类似firefox的搜索）
set incsearch

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
set guifont=Source\ Code\ Pro\ Light:h16

" 显示行号
set number

" 设置编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

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

if has("gui_running")
  au VimEnter * NERDTree
endif

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

" auto detect file indent
autocmd BufReadPost,FileReadPost *.html DetectIndent
autocmd BufReadPost,FileReadPost *.js DetectIndent
autocmd BufReadPost,FileReadPost *.styl DetectIndent

:let g:detectindent_preferred_expandtab = 1
:let g:detectindent_preferred_indent = 2
:let g:detectindent_max_lines_to_analyse = 1024

" http://www.2maomao.com/blog/wp-content/uploads/vim_tips.txt
vnoremap < <gv
vnoremap > >gv

" 显示上区分 tab 和空格
set list
set listchars=tab:▸\ ,extends:❯,precedes:❮

let g:cssColorVimDoNotMessMyUpdatetime = 1

" markdown 不折叠
let g:vim_markdown_folding_disabled = 1

" lightline 自定义配置
" 显示 git 分支和只读状态
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"☢":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '⑂ %{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" 修改后自动生效
autocmd! bufwritepost .vimrc source % "
