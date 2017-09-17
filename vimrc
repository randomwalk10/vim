"begin configuring Vundle
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'tmhedberg/SimpylFold'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-scripts/indentpython.vim' "help with python indentation
Plugin 'Valloric/YouCompleteMe'
"Plugin 'davidhalter/jedi-vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'python-mode/python-mode'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DrawIt'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'lervag/vimtex'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype on " set file type detection on
filetype plugin indent on    " required
"end configuring Vundle

"map leader to ;
let mapleader=";" "map leader to ;
"source vimrc everytime vimrc is saved
autocmd BufWritePost $MYVIMRC source $MYVIMRC
"layout setup
set number "This turns on line numbering
set numberwidth=4
set showcmd
set cursorline
set cursorcolumn
set nowrap " disable wrapping code in the same line
"search
set wildmenu " autocomplete for command menu
set incsearch " search as characters are entered
"set ignorecase " case insensitive
set hlsearch " highlight matches
nnoremap <leader><space> :nohlsearch<CR>
"folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
nnoremap <space> za
set foldmethod=indent   " fold based on indent level
"buffers
set hidden " Leave hidden buffers open
set history=100 "by default Vim saves your last 8 commands.  We can handle more
"encoding
set encoding=utf-8 "set encoding

"split screen
set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"map jk to esc
inoremap jk <esc>
"preview docstring of simpylFold
let g:SimpylFold_docstring_preview=1
"python format
autocmd Filetype python setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 autoindent
au BufNewFile *.py set fileformat=unix
"c family format
autocmd Filetype c,cpp setlocal noexpandtab tabstop=4 softtabstop=4 shiftwidth=4
au BufNewFile *.c, *.cpp, *.h, *.hpp set fileformat=unix
"configure youcompleteme
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_global_ycm_extra_conf = '/Users/randomwalk10/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_python_binary_path = 'python'
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_auto_trigger=1
" go to declaration
map <leader>jc :YcmCompleter GoToDeclaration<CR>
" go to definition
map <leader>jd :YcmCompleter GoToDefinition<CR>
" go to include file
map <leader>ji :YcmCompleter GoToInclude<CR>
" go to reference(python)
map <leader>jr :YcmCompleter GoToReferences<CR>
"configure python-mode
let g:pymode = 1
let g:pymode_warnings = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_options_max_line_length = 79
let g:pymode_options_colorcolumn = 1
let g:pymode_python = 'python' "python version
let g:pymode_indent = 1
let g:pymode_folding = 0
let g:pymode_motion = 1 "enable python motions, see docs
let g:pymode_run = 1 "default
let g:pymode_run_bind = '<leader>r' "default
let g:pymode_virtualenv=1
let g:pymode_virtualenv_path=$VIRTUAL_ENV
"configure powerline
let g:Powerline_colorscheme='solarized256'
"python with virtualenv support
py << EOF
import os
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
let python_highlight_all=1
syntax on
" set background and colorscheme
set background=dark
" colorscheme solarized
colorscheme zenburn
" colorscheme molokai
" colorscheme phd
call togglebg#map("<F5>") "toggle colors

"highlight indentation
"auto start indent guide
let g:indent_guides_enable_on_vim_startup=1
"start from level 2
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
"toggle indent guide
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"switch b/w header and implementation
nmap <silent> <Leader>sw :FSHere<cr>

"configure tagbar
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>ilt :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
	\ 'kinds' : [
		\ 'c:classes:0:1',
		\ 'd:macros:0:1',
		\ 'e:enumerators:0:0',
		\ 'f:functions:0:1',
		\ 'g:enumeration:0:1',
		\ 'l:local:0:1',
		\ 'm:members:0:1',
		\ 'n:namespaces:0:1',
		\ 'p:functions_prototypes:0:1',
		\ 's:structs:0:1',
		\ 't:typedefs:0:1',
		\ 'u:unions:0:1',
		\ 'v:global:0:1',
		\ 'x:external:0:1'
	\ ],
	\ 'sro'        : '::',
	\ 'kind2scope' : {
		\ 'g' : 'enum',
		\ 'n' : 'namespace',
		\ 'c' : 'class',
		\ 's' : 'struct',
		\ 'u' : 'union'
	\ },
	\ 'scope2kind' : {
		\ 'enum'      : 'g',
		\ 'namespace' : 'n',
		\ 'class'     : 'c',
		\ 'struct'    : 's',
		\ 'union'     : 'u'
	\ }
	\ }

"configure UltiSnips
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"

" 设置插件 indexer 调用 ctags 的参数
" " 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" " 默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"

" vimtex options
let g:vimtex_latexmk_options='-pdf -pdflatex=\"xelatex -synctex=1 \%S \%O\" -verbose -file-line-error -interaction=nonstopmode'
if !exists('g:ycm_semantic_triggers')
let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" CUDA syntax
autocmd BufRead,BufNewFile *.cu set filetype=cpp

" 正向遍历同名标签
nmap <Leader>tn :tnext<CR>
" " 反向遍历同名标签
nmap <Leader>tp :tprevious<CR>

" add directory to path
if isdirectory('/usr/local/include')
	set path+=/usr/local/include
endif
if isdirectory('/Users/randomwalk10/Documents/cpp_workspace/microzed/project_genesis/project_genesis.sdk/standalone_bsp_0/ps7_cortexa9_0/include')
	set path+=/Users/randomwalk10/Documents/cpp_workspace/microzed/project_genesis/project_genesis.sdk/standalone_bsp_0/ps7_cortexa9_0/include
endif

"configure nerd tree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
nmap <Leader>fl :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERDTreeWinPos="right"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1


set clipboard=unnamed "access system clipboard from vim
