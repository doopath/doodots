""" Doopath vim configuration.
call plug#begin('~/.vim/plugged')

" Awesome files viewer for vim ==>
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Languages support
Plug 'sheerun/vim-polyglot'

" The best one and I wanna give separated place for this one
Plug 'easymotion/vim-easymotion'

" Status bar plugins ==>
Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Very useful things ==>
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'

" Git plugin for vim
Plug 'airblade/vim-gitgutter'

" Apprearance plugins ==>
Plug 'joshdick/onedark.vim'

" Transparent vim
Plug 'kjwon15/vim-transparent'

" Icons for bars (and nerdtree)
Plug 'ryanoasis/vim-devicons'

" IDE Feautures ==>
Plug 'SirVer/ultisnips' " Powerful snippets
Plug 'honza/vim-snippets' " Also, makes your exp better

" Live server inside the code-editor like VSCode live-server
" Plug 'turbio/bracey.vim'
call plug#end() 

" Appearance settings
syntax on
highlight Normal ctermbg=NONE
set termguicolors

colorscheme onedark

" Make transparent background
hi Normal guibg=NONE ctermbg=NONE
" Also, if you want to make you terminal background
" transparent you need to set it in you terminal configuration
" If you use konsole: 
" Right click -> Edit Current Profile -> Appearence -> Edit -> 
" -> Background Transparency

" Edge-colorscheme settings
let g:edge_style = 'neon' " neon/aura/light/dark
let g:edge_enable_italic = 1 " Enable italic comments

" Font: You need to install Nerd-Fonts ->
" (https://github.com/ryanoasis/nerd-fonts)
set guifont=Hasklig\ Semibold:h15:w5:b "

" Some scary things
filetype plugin on
set autoindent " Set autoindention then you go inside a function or smth like this
set clipboard+=unnamedplus " Enable clipboard (if you compiled you vim with it)
set guioptions+=a " Ability to change gui things
set softtabstop=2 " Set tabs with two spaces
set linespace=2
set tabstop=2
set shiftwidth=2
set t_Co=256 
set number " Set line number (nonumber/number/relativenumber)
set expandtab " Replace tabs to spaces (too helpful for lans like python)
set hlsearch " Highlight any results
set incsearch " Search while you are typing
set ruler " Show the cursor anytime
set nobackup " Do not create crappy backups/swaps and another stuff
set noswapfile
set encoding=utf-8
set fileencodings=utf-8,cp1251

" Maps
let g:mapleader=',' " Too useful (if you dont want to get carpal tunnel)
let g:jsx_ext_required = 1
let g:jsx_pragma_required = 1
let g:user_emmet_leader_key='<c-o>' " Map for emmet

" Ultisnips mapping
let g:UltiSnipsExpandTrigger="<c-.>" " Use snippet by Ctrl + .
let g:UltiSnipsJumpForwardTrigger="<c-b>" " Up to snippet input arg
let g:UltiSnipsJumpBackwardTrigger="<c-z>" " Down to snippet input arg

" Vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" If you are reallly mad: (assembly support)
map <silent> <C-a> :set ft=nasm<CR>

" NerdTree enable
map <C-n> :NERDTreeToggle<CR>

" Let vim-easymotion to do its things by ,+s hotkey
map <Leader> <Plug>(easymotion-prefix)

" Buffers maps
" You can switch between buffers by comma + buffer number
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
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


" Mappings to move between plited windows by WinMove function
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

" Resize split windows
map <silent> <C-p> :vertical resize +5<CR>
map <silent> <C-u> :vertical resize -5<CR>
map <silent> <C-o> :resize +5<CR>
map <silent> <C-i> :resize -5<CR>

" This one let you move between splited windows and create these
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

" NerdCommenter configuration
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

