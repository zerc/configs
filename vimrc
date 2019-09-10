set nocompatible              " be iMproved
let &t_ut=''                  " https://sw.kovidgoyal.net/kitty/faq.html#using-a-color-theme-with-a-background-color-does-not-work-well-in-vim
set exrc                      " enable configs per project

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" General
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'mileszs/ack.vim'
Plugin 'misterbuckley/vim-definitive'
Plugin 'dbeniamine/cheat.sh-vim'
Plugin 'ervandew/supertab'
Plugin 'justinmk/vim-sneak'
Plugin 'simnalamburt/vim-mundo'
Plugin 'majutsushi/tagbar'

" Visual
Plugin 'AlessandroYorba/Sierra'
Plugin 'vim-airline/vim-airline'

" Python
Plugin 'plytophogy/vim-virtualenv'
Plugin 'mitsuhiko/vim-jinja'
Plugin 'fisadev/vim-isort'
Plugin 'janko-m/vim-test'

" Golang
Plugin 'fatih/vim-go'

" Other
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/fzf.vim'
Plugin 'vim-syntastic/syntastic'  " Validation for variarity of languages including Pything

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
set nobackup
set nowb
set noswapfile
set wildignore+=*/tmp/*,*/venv/*,*.so,*.swp,*.zip,*.pyc,__pycache__

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype htmldjango setlocal ts=2 sw=2 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab colorcolumn=120
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

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
map <C-X> :NERDTreeToggle<CR>
map <C-N> :NERDTreeFind<CR>
" #### End NERDTree settings ####


" #### Buffergator settings ####
map <Leader>a :BuffergatorToggle<CR>
" #### End Buffergator settings ####


" #### Fuzzy search ####
" Need to install it separately e.g. `brew instrall fzf`
" Make it obey ignores and use AG as the search engine:
" export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
map <C-P> :FZF<CR>
set rtp+=/usr/local/opt/fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'vsplit' }
let g:fzf_layout = { 'window': '10split enew' }
" #### End Fuzzy search ####

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
let g:vim_isort_python_version = 'python3'
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


" #### Search (Ack) ####
let g:ackprg = 'ag --nogroup --nocolor --column'
" #### End Search (Ack) ####


" #### Search (vim-definitive) ####
nnoremap <Leader>d :FindDefinition<CR>
" ### End Search (vim-definitive) ####


" #### Python tests settings ####
" -- Mappings --
nmap <silent> <leader>w :TestNearest<CR>
nmap <silent> <leader>W :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>L :TestLast --pdb<CR>
nmap <silent> <leader>] :TestVisit<CR>
" -- Define these per project --
" let g:test#strategy = 'basic'
" let g:test#python#pytest#options = '-x --reuse-db -vv'
" let g:test#python#runner = 'pytest'
" let g:test#python#pytest#executable = 'honcho -e ../.env run py.test'
" #### End Python tests settings ####


" #### Flake8 settings ####
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
" #### End Flake8 settings ####


" #### Mundo settings #####
nnoremap <F5> :MundoToggle<CR>
" #### End Mundo settings ####


" #### Tagbar settings ####
nmap <F2> :TagbarToggle<CR>
" #### End Tagbar settings ####


" #### Black ####
" NOTE: the standart Black plugin comes with its own environment and it ignores 
" setup.cfg from the project's directory. Use the next command as a workaround:
" autocmd BufWritePost *.py !black <afile> 2>/dev/null
" ### End Black ####


" #### Spell Check ####
setlocal spell spelllang=en_gb
" #### End Spell Check ####

set secure  " disable unsafe commands in project-specific files. Must be at the end.
