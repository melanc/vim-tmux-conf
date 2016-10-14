" 关闭 vi 兼容模式
set nocompatible

" 打开文件类型检测
filetype off

" 标尺和行号
set ruler
set number

" 自动缩进，智能缩进
set autoindent
set smartindent

" 制表符
set noexpandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" 备份和缓存
set nobackup
set noswapfile
set nowritebackup

" 搜索
set magic
set hlsearch
set incsearch
set ignorecase
set smartcase

" 使用可视响铃
set noerrorbells
" set visualbell
set t_vb=

" 行设置
set nowrap
set linebreak
set cursorline
set linespace=2
set scrolloff=2
set formatoptions+=mM

" 括号匹配
set showmatch
set matchtime=2

" 保存历史和撤销的次数
set history=100
set undolevels=100

" 命令增强
set wildmenu
set wildignore+=*.o,*.so,*.obj,*.pyc,*.swp

" 不自动添加空行
set noendofline binary

" 允许在有未保存的修改时切换缓冲区
set hidden

" 当运行宏时，不重绘
set lazyredraw 

" 除去启动信息
set shortmess=atI

" 自动更新文件
set autoread
set paste

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,%,@,#,-

" 插入模式下使用 Backspace,delete
set backspace=indent,eol,start
set whichwrap=b,s,<,>,[,]

" 命令行于状态栏
set cmdheight=1
set laststatus=2

" 自动切换当前目录
set autochdir

" 模式行
set modeline
set modelines=5

" 基于语法进行代码折叠
set foldmethod=syntax
" 启动vim时关闭折叠
set nofoldenable

" 定义<leader>快捷键
let mapleader=","
let g:mapleader=","

" ---------------------------- 插件管理 -------------------------------------
set rtp+=~/.vim/bundle/vundle/  
call vundle#rc()  

" let Vundle manage Vundle  
Plugin 'a.vim'
Plugin 'c.vim'
Plugin 'vimprj'
Plugin 'DfrankUtil'
Plugin 'narwhales/indexer'
Plugin 'gmarik/vundle'
Plugin 'fatih/vim-go'
Plugin 'mattn/emmet-vim'
Plugin 'majutsushi/tagbar'
Plugin 'dgryski/vim-godef'
Plugin 'Blackrush/vim-gocode'
Plugin 'narwhales/delimit-mate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

filetype plugin indent on
" ---------------------------------- 外观定制 ---------------------------------
" 语法高亮
syntax on
set background=dark

" if has('gui_running')
    " 定制菜单，工具栏
    set guioptions-=m " 隐藏菜单栏
    set guioptions-=T " 隐藏工具栏
    set guioptions-=L " 隐藏左侧滚动条
    set guioptions-=r " 隐藏右侧滚动条
    set guioptions-=b " 隐藏底部滚动条
    set showtabline=0 " 隐藏Tab栏

    colorscheme solarized
	set guifont=Monaco\ for\ Powerline\ 13
" else
    set t_Co=256
    " colorscheme solarized
" endif
" ------------------------------ 编码定制 --------------------------------
set fileformats=unix,dos,mac
nmap <leader>e :e $HOME/.vimrc<CR>
let $VIMFILES = $HOME.'/.vim'

if has("multi_byte")
    " 去掉BOM
    set nobomb

    " 编码相关
    set encoding=utf-8
    set termencoding=utf-8
    set fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,gbk,cp936,gb18030,big5,latin1

    " 解决菜单及右键乱码(zh_CN,en_US)
    set langmenu=zh_CN.UTF-8
    language messages zh_CN.UTF-8
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    " 当编码为utf-8时，定义中文字符宽度为双倍
    if v:lang =~? '^(zh)|(ja)|(ko)'
        set ambiwidth=double
    endif
else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif


" ------------------------------ 基本设置 --------------------------------
""" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

""" 记住上次文件位置
augroup vimrcEx
	au!
	autocmd FileType text setlocal textwidth=78
	autocmd BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\   exe "normal g`\"" |
				\ endif
augroup END

""" 设置文件Tab宽度
autocmd FileType c,cpp,go,php,python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4

""" 代码折叠
" zr    打开所有折叠
" zm    关闭所有折叠
" zc    折叠
" zC    对所在范围内所有嵌套的折叠点进行折叠
" zo    展开折叠
" zO    对所在范围内所有嵌套的折叠点展开
" zj    向下移动。到达下一个折叠的开始处
" zk    向上移动到前一折叠的结束处

" ---------------------------- 插件设置 -------------------------------
""" Plugin - delimitMate 自动补全括号
let delimitMate_matchpairs = "(:),[:],{:}"


""" emmet-vim - 前端开发
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-Q>'


""" Plugin-tagbar.vim 函数列表
let g:tagbar_width = 25
let g:tagbar_autofocus = 1
let g:tagbar_ctags_bin = 'ctags'
nmap <silent><F8> <Esc>:TagbarToggle<CR>


""" Plugin - indexer自动更新tags
" set tags+=~/.vim/tags
" 设置indexer调用ctags的参数
" 默认--c++-kinds=+p+l，设置为--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认--fields=+iaS不满足YCM要求，需改为--fields=+iaSl
" 标签跳转: ctrl-]，tn向后，tp向前
" 返回：ctrl-t，返回到上次光标位置；ctrl-o，返回到上个标签
" 再次进入: ctrl-i
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

nmap <leader>jc :YcmCompleter GoToDeclaration<CR>
nmap <leader>jd :YcmCompleter GoToDefinition<CR>


""" Plugin - vim-go golang语言支持
let g:godef_split=0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" gotags配置
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

nmap <leader>g :GoDef<CR>


""" Plugin - airline 状态栏美化
" 设置airline主题
let g:airline_theme="luna"
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"打开tabline功能,方便查看Buffer和切换
"if has("gui_running")
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#left_sep = ''
	let g:airline#extensions#tabline#left_alt_sep = '|'
	let g:airline#extensions#tabline#buffer_nr_show = 1
"endif
" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
" 状态栏设置
let g:bufferline_echo=0
let g:airline_powerline_fonts=1
let g:Powerline_symbols='fancy'
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '»'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '«'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.readonly = '🔒'
let g:airline_symbols.whitespace = 'Ξ'


""" Plugin - YcmCompleteMe 自动补全
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致
autocmd InsertLeave * if pumvisible() == 0|pclose|endif			"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
" 自动补全设置
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" 指定vim解释器
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
" 不显示开启vim时检查ycm_extra_conf文件的信息  
let g:ycm_confirm_extra_conf=0
" 关闭语法检查，节省性能
let g:ycm_enable_diagnostic_signs = 0
" 开启基于tag的补全，可以在这之后添加需要的标签路径  
let g:ycm_collect_identifiers_from_tags_files=1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=2
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1	
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
      \ 'nerdtree' : 1,
      \}
 

" ------------------------ 自定义函数 ------------------------------------
" 批量删除: buffer
func! DeleteAllBuffers() 
	let s:curWinNr = winnr() 
	if winbufnr(s:curWinNr) == 1 
		ret 
	endif 
	let s:curBufNr = bufnr("%") 
	exe "bn" 
	let s:nextBufNr = bufnr("%") 
	while s:nextBufNr != s:curBufNr 
		exe "bn" 
		exe "bdel ".s:nextBufNr 
		let s:nextBufNr = bufnr("%") 
	endwhile 
endfunc
nmap <silent><F4> <Esc>:call DeleteAllBuffers()<CR>


" 在文件末尾添加: modelline
func! AppendModeline()
	let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
		\ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
	let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
	call append(line("$"), l:modeline)
endfunc
nmap <silent><F3> <Esc>:call AppendModeline()<CR>


" 自动最大化窗口: wmctrl
func! MaximizeWindow()
    silent !wmctrl -r :ACTIVE: -b add,maximized_vert,maximized_horz
endfunc
au GUIEnter * call MaximizeWindow()

" 全屏化
func! ToggleFullScreen()
    call system("wmctrl -r :ACTIVE: -b toggle,fullscreen")
endfunc
nmap <silent><F11> <Esc>:call ToggleFullScreen()<CR>


" ------------------------ 快捷键定制 ------------------------------------
" 文件浏览器
let g:netrw_list_hide =  '^\..*,'                                
let g:netrw_list_hide .= '\.a$,\.so$,'    
let g:netrw_list_hide .= '\.o$,\.obj$,' 
let g:netrw_list_hide .= '\.a\s\+,\.so\s\+,'
let g:netrw_list_hide .= '\.o\s\+,\.obj\s\+,'         
let g:netrw_list_hide .= '\.pyc$,\.git$,\.gitignore$,tags$'
command! E Explore
command! S Sexplore
command! V Vexplore

" 切换窗口快捷键重映射
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" 复制粘贴
vmap <C-X> "+x
vmap <C-C> "+y
imap <C-V> "+gP
cmap <C-V> <C-R>+
imap <S-Insert> "+gP
cmap <S-Insert> <C-R>+
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

" 切换Buffer
nmap <S-TAB> <Esc>:bn<CR>

" 保存会话
let session_file = $HOME.'/.vim/session/Session.vim'
set sessionoptions=buffers,curdir,resize,folds,tabpages  
" autocmd VimLeave * exec "mks! " . session_file
nmap <leader>m :exec "mks! " . session_file<CR>
" 恢复会话
nmap <leader>r :exec "source " . session_file<CR>

