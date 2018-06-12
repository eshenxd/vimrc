" external configs for vim and plugin
if has("gui_running")
    set background=dark
    colorscheme molokai
    set guifont=Monaco:h12
endif

"<-------------------------------------------------->
" powerline config
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'solarized256'
set laststatus=2

"<-------------------------------------------------->
" indent guides config
let g:indent_guides_enable_on_vim_startup=1
" visual indent from 2 line
let g:indent_guides_start_level=2
" width of block
let g:indent_guides_guide_size=1
" open/close indent guide
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"<-------------------------------------------------->
"nerdcomment config
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

"<-------------------------------------------------->
"nerdtree config
"key to open/close file list window
nmap <F3> :NERDTreeToggle<CR>
" window width of nerdtree window
let NERDTreeWinSize=32
" position of the window
let NERDTreeWinPos="left"
" hidden custom type of files
let NERDTreeShowHidden=0
" no help infomation on the window
let NERDTreeMinimalUI=1
" auto delete the buffer when the file deleted
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

"<-------------------------------------------------->
"tags bar config
" tagbar win on the right
let tagbar_left=0
" identifier list by tag or not
nnoremap <F2> :TagbarToggle<CR> 
" hight of the tagbar window
let tagbar_width=32 
" no more information 
let g:tagbar_compact=1

"<-------------------------------------------------->
" Youcompletme config
set completeopt=longest,menu
let g:ycm_server_python_interpreter='/usr/local/bin/python3'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_min_num_identifier_candidate_chars = 2
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1

" set semantic complet for custom file types
let g:ycm_semantic_triggers =  {
	\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
	\ 'cs,lua,javascript': ['re!\w{2}'],
	\ }
" set file types which is complet needed
let g:ycm_filetype_whitelist = {
    \ "c":1,
    \ "cpp":1,
    \ "python":1,
    \ "sh":1,
    \ "vim":1,
    \}
" custom complet ui
let g:ycm_show_diagnostics_ui = 0
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black

"<-------------------------------------------------->
" ALE config
" always see the sign column
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" never check when file changes
let g:ale_lint_on_text_changed = 'never'
" never check when file open
let g:ale_lint_on_enter = 0
" press sn to the next error and sp for the previous on normal mode
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s open or close check
nmap <Leader>s :ALEToggle<CR>
"<Leader>d see the error information
nmap <Leader>d :ALEDetail<CR>

highlight clear ALEErrorSign
highlight clear ALEWarningSign

" use clang for c and c++ checker and use pylint for python
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}
" add google style pylintrc
let g:ale_python_pylint_options = '--rcfile /Users/Ethan/.vim/googlecl-pylint.rc'

"<-------------------------------------------------->
" auto pep8 config
" use F4 for auto pep8 check
autocmd FileType python noremap <buffer> <F4> :call Autopep8()<CR>
let g:autopep8_max_line_length=79
let g:autopep8_aggressive=1
"<-------------------------------------------------->

"airline config
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" let g:airline_left_sep = '▶'
" let g:airline_left_alt_sep = '❯'
" let g:airline_right_sep = '◀'
" let g:airline_right_alt_sep = '❮'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extension#ale#enable = 1
