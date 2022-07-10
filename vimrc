" ### Plugins ###
call plug#begin('~/.vim/plugged')

" General
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'simnalamburt/vim-mundo'
Plug 'majutsushi/tagbar'
Plug 'liuchengxu/vim-clap'
Plug 'chrisbra/NrrwRgn'
Plug 'wsdjeg/vim-fetch'
Plug 'mileszs/ack.vim'
Plug 'wellle/targets.vim'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'easymotion/vim-easymotion'

" Snippets
Plug 'honza/vim-snippets'

" Visual
Plug 'AlessandroYorba/Sierra'
Plug 'vim-airline/vim-airline'

" Python
Plug 'plytophogy/vim-virtualenv', {'for': 'python'}
Plug 'mitsuhiko/vim-jinja', {'for': 'python'}
Plug 'janko-m/vim-test', {'for': 'python'}
Plug 'fisadev/vim-isort', {'for': 'python'}
Plug 'psf/black', {'for': 'python'}
Plug 'jeetsukumaran/vim-pythonsense', {'for': 'python'}

" Ruby
Plug 'zerc/vim-rubocop', {'for': 'ruby'}
Plug 'kana/vim-textobj-user'  " vim-textobj-ruby depends on it
Plug 'rhysd/vim-textobj-ruby', {'for': 'ruby'}

" Other
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-syntastic/syntastic'  
Plug 'AndrewRadev/sideways.vim'
Plug 'google/vim-jsonnet'

call plug#end()
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
let &t_ut=''                  " https://sw.kovidgoyal.net/kitty/faq.html#using-a-color-theme-with-a-background-color-does-not-work-well-in-vim
set nocompatible              " be iMproved, required
set exrc                      " enable configs per project
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

set ignorecase
set smartcase
set shiftround

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


" #### Figutive settings ####
nnoremap <space>s :Git<CR>
map <space>p :!git push origin HEAD

nmap <Leader>g :diffget //2<CR>
nmap <Leader>h :diffget //3<CR>

command! -nargs=+ Gca :r!git log -n200 --pretty=format:"\%an <\%ae>" | grep -i '<args>' | head -1 | xargs echo "Co-authored-by:"
" #### End Figutive settings ####


" #### NERDTree settings ####
let NERDTreeRespectWildIgnore = 1
map <C-X> :NERDTreeToggle<CR>
map <C-N> :NERDTreeFind<CR>
" #### End NERDTree settings ####


" #### Buffergator settings ####
map <Leader>a :BuffergatorToggle<CR>
" #### End Buffergator settings ####


" #### Airline ####
let g:airline_section_y=''
let g:airline_section_z='%l/%L : %c'
" #### End Airline ####


" #### ISort settings ####
autocmd BufWritePre *.py :Isort
let g:vim_isort_python_version = 'python3'
" #### End ISort settings ####


" #### Golang settings ####
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
" #### End Golang settings ####


" #### Python tests settings ####
let g:test#strategy = "neovim"
let g:test#preserve_screen = 1
let g:test#neovim#start_normal = 1
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


" #### Syntastic settings ####
let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
" #### End Syntastic settings ####


" #### Mundo settings #####
nnoremap <F5> :MundoToggle<CR>
" #### End Mundo settings ####


" #### Tagbar settings ####
nmap tt :TagbarToggle<CR>
" #### End Tagbar settings ####


" #### Black ####
augroup RunBlack
    autocmd!
    autocmd BufWritePre *.py :Black
augroup END
" ### End Black ####
"

" #### Spell Check ####
" setlocal spell spelllang=en_gb
" #### End Spell Check ####
"

" ##### COC #####
set updatetime=300
set signcolumn=yes

let g:coc_global_extensions=['coc-pyright', 'coc-go', 'coc-solargraph', 'coc-snippets']

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <c-space> coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" ##### End COC #####


" ##### NarrowRegion settings #####
let g:nrrw_rgn_vert = 1
let g:nrrw_rgn_resize_window = 'relative'
" ##### End NarrowRegion settings #####


" ##### Sideways' settings #####
nnoremap <C-h> :SidewaysLeft<CR>
nnoremap <C-l> :SidewaysRight<CR>
" ##### ENDSideways' settings #####

"
" ##### Telescope settings #####
nnoremap <C-P> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" ##### EndTelescope settings #####

" #### Rubocop settings ####
"let g:vimrubocop_extra_args = '-a'
augroup RunRubo
    autocmd!
    autocmd BufWritePost *.rb :RuboCop -a
augroup END
" #### End Rubocop settings ####


" #### Providers settings ####
let g:python3_host_prog = '~/repos/global_python_env/bin/python'
let g:ruby_host_prog = '~/.rbenv/versions/3.0.3/bin/neovim-ruby-host'
" #### End Providers settings ####

" #### EasyMotion settings ####
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

nmap s <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" #### End EasyMotion settings ####
set secure  " disable unsafe commands in project-specific files. Must be at the end.
