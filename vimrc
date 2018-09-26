" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

" 关闭兼容模式
set nocompatible
" 开启文件类型侦测
filetype on
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" vim 自身命令行模式智能补全
set wildmenu
" 搜索时大小写不敏感
set ignorecase
" 快捷键前缀
let mapleader=";"

" 开启语法高亮
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on


" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4


" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" 配色插件
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'rakr/vim-one'
" 状态栏插件
Plugin 'Lokaltog/vim-powerline'
" 缩进可视化插件
Plugin 'nathanaelkane/vim-indent-guides'
" 代码跳转插件
Plugin 'derekwyatt/vim-fswitch'
" 注释插件 <leader>cc注释 cu取消注释
Plugin 'scrooloose/nerdcommenter'
" 代码补全插件
Plugin 'Valloric/YoucompleteMe'
" 工程文件遊廊插件
Plugin 'scrooloose/nerdtree'
call vundle#end()
" 根据侦测到的不同类型加载对应的插件
filetype plugin on


" 配色方案设置
let g:solarized_termcolors=256
let g:molokai_original=1
let g:rehash256 = 1
set background=dark
"colorscheme solarized
colorscheme gruvbox
"colorscheme one
"colorscheme molokai

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'
let g:Powerline_smybols='fancy'

" 添加辅助信息
"" 总是显示状态栏
set laststatus=2
" 显示当前光标位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行
set cursorline
" 高亮显示搜索结果
set hlsearch

" 缩进可视化插件配置
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

" 代码折叠配置 za打开或关闭折叠 zM关闭所有折叠 zR打开所有折叠
" 基于缩进或语法进行折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动vim时关闭折叠代码
set nofoldenable


" NERDTree 配置
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置子窗口宽度
let NERDTreeWinSize=32
" 设置子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" 不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对于buffer
let NERDTreeAutoDeleteBuffer=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" YCM配置
" 补全在注释中有效
let g:ycm_complete_in_comments=1
" 允许vim加载.ycm_extra_conf.py文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启YCM标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入c++标准库标签
set tags+=/usr/include/c++/8.2.1/stdcpp.tags
" 从键入第一个字符就开始补全
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_gobal_extra_conf='~/.ycm_extra_conf.py'

" 定义快捷键
" 定义代码跳转快捷键
nmap <silent> <Leader>sw :FSHere<cr>
nmap LB 0
nmap LE $
imap jj <ESC>
inoremap <leader>; <C-x><C-o>
