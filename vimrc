set nocompatible              " be iMproved, required
filetype off                  " required
let &t_ut=''                  " https://sw.kovidgoyal.net/kitty/faq.html#using-a-color-theme-with-a-background-color-does-not-work-well-in-vim

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" General
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'mileszs/ack.vim'
"Plugin 'valloric/youcompleteme'  " see installation notes
Plugin 'misterbuckley/vim-definitive'
"Plugin 'rhysd/vim-grammarous'
" Plugin 'syntastic'
" Plugin 'tpope/vim-repeat'
" Plugin 'junegunn/goyo.vim'
" Plugin 'mattn/webapi-vim'

" Visual
"Plugin 'altercation/vim-colors-solarized'
Plugin 'AlessandroYorba/Sierra'
Plugin 'vim-airline/vim-airline'

" Python
Plugin 'klen/python-mode'  " consider to remove it because there is no use
Plugin 'mitsuhiko/vim-jinja'
Plugin 'zerc/vim-isort'
Plugin 'janko-m/vim-test'
Plugin 'vim-syntastic/syntastic'  " Python validation
" Plugin 'davidhalter/jedi-vim'

" Golang
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" END PLUGINS


" #### Visual settings ####
colorscheme sierra
syntax enable
set cursorline
set cursorcolumn
set ruler
set showmatch
set relativenumber
set number
set hlsearch
set incsearch
set lazyredraw
set splitbelow
set splitright

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype htmldjango setlocal ts=2 sw=2 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab colorcolumn=120
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
" #### End Visial settings ####


" #### General settings ####
set clipboard=unnamed  " use the common buffer for copy & paste
set expandtab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set autoread
set autoindent
set smartindent
set laststatus=2  " always display a status line
set backspace=2  " make backspace work like most other apps

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Ignore some shit
set wildignore+=*/tmp/*,*/venv/*,*.so,*.swp,*.zip,*.pyc,__pycache__     " MacOSX/Linux

" Remove trailing whitespaces
autocmd FileType python,yaml,html autocmd BufWritePre <buffer> %s/\s\+$//e

" Disable bell
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
" #### End General settings ####


" #### General key bindings ####
" Contains general purpose bingins.
" See pluging-specific sections for a plugin-related bingins ;)

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <space>q :q<CR>
map <space>Q :q!<CR>
map <space>x :x<CR>
map <space>w :w<CR>
" #### End General key bindings ####


" #### NERDTree settings ####
let NERDTreeRespectWildIgnore = 1
map <TAB> :NERDTreeToggle<CR>
map <C-N> :NERDTreeFind<CR>
" #### End NERDTree settings ####


" #### Buffergator settings ####
map <Leader>a :BuffergatorToggle<CR>
" #### End Buffergator settings ####


" #### CTRLP settings ####
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.git|\.hg|venv|node_modules|__pycache__)$',
    \ 'file': '\v\.(exe|so|dll|pyc)$',
    \ }
" #### End CTRLP settings ####


" ### Git ####
nnoremap <space>s :Gstatus<CR>
map <space>p :!git push origin HEAD
" #### End Git ####


" #### Airline ####
let g:airline_section_y=''
let g:airline_section_z='%l/%L : %c'
" #### End Airline ####


" #### ISort settings ####
autocmd BufWritePre *.py :Isort
" #### End ISort settings ####


" #### Golang settings ####
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
"
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_methods = 1
" #### End Golang settings ####


" #### Grammar settings ####
" set spell spelllang=en_gb
" setlocal spell spelllang=en_gb
" #### End Grammar settings ####


" #### Search (Ack) ####
let g:ackprg = 'ag --nogroup --nocolor --column'
vmap <space>i :Ack --ignore *migrations* "<C-R>" festicket/apps/
" #### End Search (Ack) ####


" #### Search (vim-definitive) ####
nnoremap <Leader>d :FindDefinition<CR>
" ### End Search (vim-definitive) ####


" #### Python mode settings
let g:pymode = 1
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_options_colorcolumn = 1
let g:pymode_doc = 1
let g:pymode_doc_bind = 'K'
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
let g:pymode_folding = 0
let g:pymode_lint_ignore = "E501,W391"
let g:pymode_rope = 0
let g:pymode_lint = 0  " doesn't work from the terminal
let g:pymode_lint_cwindow=1
let g:pymode_options_max_line_length = 120
let g:pymode_lint_options_pylint = {'max-line-length': g:pymode_options_max_line_length}
let g:syntastic_python_pylint_post_args="--max-line-length=120"
" #### End Python mode settings


" #### Python tests settings ####
let g:test#strategy = 'basic'
let g:test#python#pytest#options = '-x --reuse-db -vv'
let g:test#python#runner = 'pytest'
let g:test#python#pytest#executable = 'docker-compose run --rm web py.test'
nmap <silent> <leader>w :TestNearest<CR>
nmap <silent> <leader>W :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>L :TestLast --pdb<CR>
nmap <silent> <leader>] :TestVisit<CR>
" #### End Python tests settings ####


" #### Flake8 settings ####
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
" #### End Flake8 settings ####


" #### Youcompleteme settings ####
let g:ycm_python_binary_path = 'python'  " use Python from the active virtual environment
nnoremap <leader>o :YcmCompleter GoTo<CR>
" #### End Youcompleteme settings ####
