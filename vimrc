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
"Plugin 'ctrlpvim/ctrlp'
Plugin 'gmarik/vundle'
"搜索插件，类似ctrip
Plugin 'Yggdroot/LeaderF', { 'do': './install.sh' }
"python插件
Plugin 'python-syntax'
Plugin 'nvie/vim-flake8'
Plugin 'tell-k/vim-autopep8'			"依赖autopep8, pip install --upgrade autopep8
Plugin 'Yggdroot/indentLine'			"缩进标识
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'	"python自动缩进
"lua插件
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-lua-ftplugin'
"文件列表插件
Plugin 'scrooloose/nerdtree'			"nerdtree目录树插件
"go相关的插件，依赖的go程序可通过:GoInstallBinaries,:GoUpdateBinaries更新
Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' } "go-vim包含以上go开发相关的工具插件
Plugin 'majutsushi/tagbar'				"替代taglist.vim
"cd ~/.vim/bundle && git clone https://github.com/scrooloose/syntastic.git
Plugin 'scrooloose/syntastic'			"语法检查插件--导致打开文件过慢
Plugin 'Valloric/YouCompleteMe'			"自动补全插件, 要手动进去按装
"vundle调用结束
call vundle#end()


"YouCompleteMe配置
let mapleader = ","      "设置leader为','
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR> "快速打开文件
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR> 
let g:ycm_confirm_extra_conf=0                   "关闭加载.ycm_extra_conf.py提示
let g:ycm_min_num_of_chars_for_completion=2      "设置从第二个字母开始匹配
let g:ycm_seed_identifiers_with_syntax=1         "语法关键字补全
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tag_files = 1 "使用ctags生成的tags文件

"syntastic语法检查配置
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_python_checkers=['pylint'] 
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd'] "php语法检查配置
let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck'] "go语法检查插件配置
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_enable_balloons = 1 "whether to show balloons
let g:syntastic_ignore_files=[".*\.html$", ".*\.tpl$"] "不检查py
let g:autopep8_disable_show_diff=1

let python_highlight_all = 1
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

"将多余的空白字符标示出来
hi BadWhitespace guifg=gray guibg=red ctermfg=gray ctermbg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.cpp match BadWhitespace /\s\+$/

let g:Lf_ShortcutF = '<C-P>' "LeaderF文件搜索插件的配置
"把 F8 映射到 启动NERDTree插件
map <F9> :NERDTreeToggle<CR>

"Bundle 'majutsushi/tagbar'
"把F9隐射到启动tarbar"
nmap <F10> :TagbarToggle<CR>
nnoremap <C-J> <C-W><C-J> "隐射ctrl+j代替 ctrl+w+j
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"======以下是测试命令
imap tks thanks "插入模式下输入tks，直接变成thanks； "尽量不要隐射输入模式的命令
nmap <F2> ohello<Esc> "按下普通模式下F2键后输入hello后回到普通模式,o新建一行，并进入insert模式，hello直接插入，<Esc>返回normal模式
"======以上是测试命令

set tags=./tags,./TAGS,tags;~,TAGS;~

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

"确保YouCompleteMe能够找到虚拟环境的site packages文件夹
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
"只显示当前文件的tag
let Tlist_Show_One_File = 1
"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1
let NERDTreeIgnore=['\.pyc', '\.o']

"go语法高亮设置，默认是无高亮
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1 "设置go文件保存时自动出发gofmt,goimports调用
let g:go_fmt_fail_silently = 1


"git clone https://github.com/Shougo/neocomplete.vim.git 代码补全插件
"开启代码补全插件
let g:nercomplete#enable_at_startup=1


"以下是独立配置，不依赖任何插件，只有基本的语法高亮
"设置delete键的增强模式
set backspace=2

"检测文件类型
filetyp on

"针对不同的文件采取不同的缩进
filetype indent on

"允许插件
filetype plugin on

"启动智能插件
filetype plugin indent on 

"语法高亮，需要在其他语法设置之前
syntax on

"设置文件被改动时自动读入
set autoread

"设置行号
set number

"设置tab键的宽度为4个空格
set tabstop=4

"设置使用退格键一次可以干掉4个空格
set softtabstop=4
"设置每一级缩进4个空格
set shiftwidth=4

"设置自动缩进
set autoindent

"设置c风格缩进
set cindent

"设置当前行下划线
set cursorline

set ruler

"开启新行时使用智能自动缩进
set smarttab

"设置不要用空格代替制表符
"set noexpandtab
"设置用空格代替制表符
"set expandtab


"设置历史记录
set history=100

"禁止生成临时备份文件
set nobackup
set noswapfile

"设置共享剪贴板
set clipboard+=unnamed

"搜索忽略大小写
set ignorecase

"搜索字符高亮显示
set hlsearch
"设置输入搜索内容时即刻显示搜索结果
set incsearch

"设置跳转到搜索匹配的字符处
set showmatch

"设置在vim中可以使用鼠标
set mouse=a

"设置显示匹配时间
set matchtime=5

"设置vim内部文字编码
set encoding=utf-8

"设置保存文件时的编码
set fileencoding=utf-8

"设置文件格式为unix
set fileformat=unix

"设置每行最多79个字符
set textwidth=79

"设置兼容文件编码
set fileencodings=utf-8,gb2312,gbk,gb18030,cp936

"设置终端编码
set termencoding=utf-8

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
autocmd FileType haml,javascript,html,css,xml set nobackup
autocmd FileType python set expandtab

