"加上这句解决:PluginInstall安装插件时出现Unknown function: vundle#installer#new问题
set shell=/bin/bash 
"vundle插件管理器，1-10 vundle所需,mkdir ~/.vim; mkdir ~/.vim/bundle; 
"git clone https://github.com/gmarik/vundle.git
"设置不使用vi的键盘模式，而用vim自己的模式
set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#begin()
"插件位置,添加完插件后，保存退出再进入vim命令模式输入:PluginInstall,安装插件
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'     "nerdtree目录树插件
"go相关的插件，依赖的go程序可通过:GoInstallBinaries
"Plugin 'dgryski/vim-godef'       "需要事先安装godef
"Plugin 'Blackrush/vim-gocode'    "需要事先安装gocode
Plugin 'fatih/vim-go'             "go-vim包含以上插件
Plugin 'Shougo/neocomplete.vim'
"Plugin 'majutsushi/tagbar'
"vundle调用结束
call vundle#end()

"设置文件类型，插件，缩进检测
filetype plugin indent on 
"语法高亮，需要在其他语法设置之前
syntax on

"把 F8 映射到 启动NERDTree插件
map <F8> :NERDTree<CR>

Bundle 'majutsushi/tagbar'
"把F9隐射到启动tarbar"
nmap <F9> :TagbarToggle<CR>

set tags=./tags

"GoTags配置"
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }


"go语法高亮设置，默认是无高亮
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

"git clone https://github.com/Shougo/neocomplete.vim.git 代码补全插件
"开启代码补全插件
let g:nercomplete#enable_at_startup=1


"以下是独立配置，不依赖任何插件，只有基本的语法高亮

"设置文件被改动时自动读入
set autoread

"设置行号
set number

"设置tab键的宽度
set tabstop=4

"设置统一缩进为4
set softtabstop=4
set shiftwidth=4

"设置自动缩进
set autoindent

"设置c风格缩进
set cindent

"设置当前行下划线
set cursorline

"在行和段的开始处使用制表符
set smarttab

"设置不要用空格代替制表符
"set noexpandtab
"设置用空格代替制表符
set expandtab


"设置历史记录
set history=100

"禁止生成临时备份文件
set nobackup
set noswapfile

"设置共享剪贴板
set clipboard+=unnamed

"搜索忽略大小写
set ignorecase

"搜索字符高亮
set hlsearch
set incsearch

"设置跳转到搜索匹配的字符处
set showmatch

"设置显示匹配时间
set matchtime=5

"设置当前文字编码
set encoding=utf-8

"设置文件编码
set fileencoding=utf-8

"设置兼容文件编码
set fileencodings=utf-8,gb2312,gbk,gb18030,cp936

"设置显示状态栏
set laststatus=2

"设置状态栏显示内容
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]

"设置显示模式
set showmode

"设置显示命令
set showcmd

"设置不自动换行nowrap,自动换行set wrap
set nowrap

"设置主题
colorscheme desert

"设置网页脚本相关的缩进
autocmd FileType haml,javascript,html,css,xml set ai
autocmd FileType haml,javascript,html,css,xml set sw=2
autocmd FileType haml,javascript,html,css,xml set ts=2
autocmd FileType haml,javascript,html,css,xml set sts=2


