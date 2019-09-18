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
" 显示相对行号
" 一开始不显示相对行号
set nu
augroup relative_numbser
    autocmd!
    autocmd InsertEnter * :set norelativenumber
    autocmd InsertLeave * :set relativenumber
augroup END
" 使编辑行始终居中 有缺陷
" nnoremap j jzz
" nnoremap k kzz
" 关闭出错声音
set noerrorbells
" 出错时发出视觉提示
set visualbell
" 启用256色
set t_Co=256



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


call plug#begin('~/.vim/plugged')
" 配色插件
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
" 状态栏插件
Plug 'Lokaltog/vim-powerline'
" 缓冲区插件
Plug 'fholgado/minibufexpl.vim'
" 注释插件 <leader>cc注释 cu取消注释
Plug 'scrooloose/nerdcommenter'
" 工程文件遊廊插件
Plug 'scrooloose/nerdtree'
" vim-go
Plug 'fatih/vim-go', {'do': 'GoUpdateBinaries'} 
"go-补全
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

" 补全设置
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ deoplete#manual_complete()
		function! s:check_back_space() abort "{{{
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~ '\s'
		endfunction"}}}



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

" 缓冲区插件配置
set hidden " 必须保存修改后才能跳转buffer
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bf<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" 缩进可视化插件配置
" let g:indent_guides_enable_on_vim_startup=1
" let g:indent_guides_start_level=2
" let g:indent_guides_guide_size=1

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
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" 不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对于buffer
let NERDTreeAutoDeleteBuffer=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" 定义快捷键
" 定义代码跳转快捷键
" nmap LB 0
" nmap LE $
" imap jj <ESC>
inoremap <leader>; <C-x><C-o>

" 设置透明
hi Normal ctermbg=none



" 设置无效
inoremap <BS> <Nop>
nmap <Up>        <Nop>
nmap <Down>      <Nop>
nmap <Left>      <Nop>
nmap <Right>     <Nop>
imap <Up>        <Nop>
imap <Down>      <Nop>
imap <Left>      <Nop>
imap <Right>     <Nop>
