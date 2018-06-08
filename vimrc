" vim config for myself
let mapleader = "\<Space>"
  
" 中文支持
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" 使用真色
set t_Co=256
set textwidth=80
set colorcolumn=-2
highlight ColorColumn ctermbg=green guibg=orange
" 开启文件类型侦测
filetype on
filetype plugin on

" 定义快速行首和行尾
nmap lb 0
nmap le $

" 关闭兼容模式, 解决backspace不可用问题
set nocompatible
set backspace=indent,eol,start

set wildmenu
set incsearch
set showmatch
set matchtime=1
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 剪贴板拷贝，剪贴，复制
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>Q :qa!<CR>

" 遍历窗口
nnoremap nw <C-W><C-W>
nnoremap <Leader>lw <C-W>l
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>jw <C-W>j
nnoremap <Leader>kw <C-W>k

nnoremap <Leader>M %

" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/vim-powerline'
Plugin 'terryma/vim-expand-region'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
"Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'fholgado/minibufexpl.vim'
"Plugin 'vim-scripts/Pydiction'
"Plugin 'scrooloose/syntastic'
"Plugin 'nvie/vim-flake8'
Plugin 'w0rp/ale'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'tell-k/vim-autopep8'
call vundle#end()

"============ 内部配置 =================
" 配色方案
"set background=dark
"colorscheme solarized
"colorscheme molokai
"colorscheme phd

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 显示光标当前位置
set ruler
" 开启行号显示
set relativenumber
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch

" 禁止折行
set nowrap

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
"set softtabstop=4

"=============== 插件配置 ================

" vim-expand-region config
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" powerline config
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'solarized256'
set laststatus=2

" indent guides config
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" nerdcomment config
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" nerdtree confing
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <F3> :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=0
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" auto open nerdtree when start vim with no files
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open nerdtree when vim starts on opening a dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" close nerdtree when vim only window left is nerdtree win
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" change default arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" hightlight different file type with different color
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('cpp', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('py', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" Project root folders, used to identify ancestor path of project root directory.
let g:indexer_root_folders = ['/root/workspace']
" Project root markers, used to identify project root directory.
let g:indexer_root_markers = ['.git']
let g:indexer_root_setting = 'indexer.json'
let g:indexer_user_modules = ['log', 'job', 'tag']

"tags bar config
" 设置 tagbar 子窗口的位置出现在主编辑区的左边 
let tagbar_left=0
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <F2> :TagbarToggle<CR> 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1

"let g:pydiction_location = '/root/.vim/bundle/pydiction/complete-dict'
"let g:pydiction_menu_height = 3
"set completeopt-=preview

" Youcompletme config
set completeopt=longest,menu
let g:ycm_server_python_interpreter='/usr/local/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_min_num_identifier_candidate_chars = 2
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1

let g:ycm_semantic_triggers =  {
	\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
	\ 'cs,lua,javascript': ['re!\w{2}'],
	\ }
let g:ycm_filetype_whitelist = {
    \ "c":1,
    \ "cpp":1,
    \ "python":1,
    \ "sh":1,
    \ "vim":1,
    \}
let g:ycm_show_diagnostics_ui = 0
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black

" syntastic config
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 1
"
" let g:syntastic_warning_symbol = '!'
" let g:syntastic_error_symbol = 'X'
"
" let g:syntastic_python_checkers=['flake8']
" let g:syntastic_python_pylint_args='--disable=C0111,R0903,C0301'

" ALE config
" 侧边栏始终可见
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>

highlight clear ALEErrorSign
highlight clear ALEWarningSign

"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}

let g:ale_sign_column_always = 1

" auto pep8 config
autocmd FileType python noremap <buffer> <F4> :call Autopep8()<CR>
let g:autopep8_max_line_length=79
let g:autopep8_aggressive=1
