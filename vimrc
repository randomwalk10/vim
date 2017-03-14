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
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim' "help with python indentation
Plugin 'Valloric/YouCompleteMe'
Plugin 'python-mode/python-mode'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"end configuring Vundle

"layout setup
set number "This turns on line numbering
set numberwidth=4
set showcmd
set cursorline
"search
set wildmenu " autocomplete for command menu
set incsearch " search as characters are entered
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
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR> "go to definition
"configure python-mode
let g:pymode = 1
let g:pymode_warnings = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_options_max_line_length = 79
let g:pymode_options_colorcolumn = 1
let g:pymode_python = 'python' "python version
let g:pymode_indent = 1
let g:pymode_folding = 1
let g:pymode_motion = 1 "enable python motions, see docs
let g:pymode_run = 1 "default
let g:pymode_run_bind = '<leader>r' "default
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
if has('gui_running')
	set background=dark
	colorscheme solarized
else
	colorscheme zenburn
endif

call togglebg#map("<F5>") "toggle colors
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
set clipboard=unnamed "access system clipboard from vim
