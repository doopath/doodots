

" # Doopath's neovim configuration file :>
" ################################## EDITOR SETTINGS ##################################
" Installed in my system vim takes 600-1500MB RAM,
" so if you want do decrease this value you can uninstall 
" some of plugins or you lighter autocompleter (like deoplite),
" disable it or even uninstall (if you like light vim setup).
" I use this configuration because it very comfy for me and
" helps me in my dev cases.

" " If you hate vim-plug or something like this, you can switch it 
" to another, but I use this one
" If you want to read more about some plugin open 
" https://github.com/<plugin path>
call plug#begin('~/.vim/plugged')

" Awesome files viewer for vim ==>
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Awesome asynchronous linter
Plug 'dense-analysis/ale'

" Everyone know this
Plug 'mattn/emmet-vim'

" Languages support
Plug 'sheerun/vim-polyglot'

" The best one and I wanna give separated place for this one
Plug 'easymotion/vim-easymotion'

" Status bar plugins ==>
Plug 'vim-airline/vim-airline'

" Very useful things ==>
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround' " include word/line in '[{< and other stuff like those
Plug 'preservim/nerdcommenter' " <Leader>-c-l to comment; <Leader>-c-u to uncomment
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " fuzzy-finder
Plug 'APZelos/blamer.nvim' " A plugin like the 'git-lense' for vscode

" CSharp and FSharp support
Plug 'OmniSharp/omnisharp-vim'
Plug 'ionide/Ionide-vim', { 'do':  'make fsautocomplete' }

" Haskell and Cabal support
Plug 'neovimhaskell/haskell-vim'


Plug 'airblade/vim-gitgutter'

" Appearance plugins ==>
" Color schemes
Plug 'arcticicestudio/nord-vim'
Plug 'doopath/doobox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ulwlu/elly.vim'
Plug 'joshdick/onedark.vim'

" Transparent vim
Plug 'kjwon15/vim-transparent'

" Icons for bars (and nerdtree)
Plug 'ryanoasis/vim-devicons'

" These themes are created by this awesome guy https://github.com/sainnhe ==>
Plug 'sainnhe/forest-night'
Plug 'sainnhe/edge'
Plug 'sainnhe/sonokai'

" IDE Feautures ==>
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conqueror Of Completion
Plug 'SirVer/ultisnips' " Powerful snippets
Plug 'honza/vim-snippets' " Also, makes your exp better

" Live server inside the code-editor like VSCode live-server
Plug 'turbio/bracey.vim'
call plug#end() 

" Appearance settings
syntax on
highlight Normal ctermbg=NONE
set termguicolors

colorscheme onedark
" Available themes: nord, dracula, onedark, doobox
" Sainnhe themes : edge, forest-night, sonokai

" Make status line transparent (yes, yes, yes...)
set laststatus=2
hi statusline guibg=#FFFFFFFF guifg=#D8DEE9

" Make transparent background
hi Normal guibg=NONE ctermbg=NONE
" Also, if you want to make you terminal background
" transparent you need to set it in you terminal configuration
" If you use konsole: 
" Right click -> Edit Current Profile -> Appearance -> Edit -> 
" -> Background Transparency

" Edge color scheme settings
let g:edge_style = 'neon' " neon/aura/light/dark
let g:edge_enable_italic = 1 " Enable italic comments

" Font: You need to install Nerd-Fonts ->
" (https://github.com/ryanoasis/nerd-fonts)
set guifont=Hasklig\ Semibold:h15:w5:b "

" Some scary things
filetype plugin on
" set spell spelllang=en_us " Enable spell check
set autoindent " Set autoindention then you go inside a function or something like this
set clipboard+=unnamedplus " Enable clipboard (if you compiled you vim with it)
set guioptions+=a " Ability to change gui things
set softtabstop=4 " Set tabs with two spaces
set linespace=4
set tabstop=4
set shiftwidth=4
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
let g:NERDTreeWinSize=40

" Let vim-easymotion to do its things by ,+s hotkey
map <Leader> <Plug>(easymotion-prefix)

" Buffers maps
" You can switch between buffers by comma + buffer number
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>f :bn<CR>
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

" FZF settings
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>c :Files<CR>

" Blamer settings
let g:blamer_enabled = 1
" Or, if you don't want to view blamer stuff everytime:
" nnoremap <Leader>g :BlamerToggle<CR>

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

" ################################## NerdCommenter configuration ##################################
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


" ################################## COC.NVIM configuration ##################################
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=400

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



" ################################## OMNISHARP SETTINGS ##################################
" See https://github.com/OmniSharp/omnisharp-vim for more information

let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_selector_findusages = 'fzf'

let g:ale_linters = { 'cs': ['OmniSharp'] }

" Use the vim-plug plugin manager: https://github.com/junegunn/vim-plug
" Remember to run :PlugInstall when loading this vimrc for the first time, so
" vim-plug downloads the plugins listed.
" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview', 'popup'
" and 'popuphidden' if you don't want to see any documentation whatsoever.
" Note that neovim does not support `popuphidden` or `popup` yet:
" https://github.com/neovim/neovim/issues/10996
if has('patch-8.1.1880')
  set completeopt=longest,menuone,popuphidden
  " Highlight the completion documentation popup background/foreground the same as
  " the completion menu itself, for better readability with highlighted
  " documentation.
  set completepopup=highlight:Pmenu,border:off
else
  set completeopt=longest,menuone,preview
  " Set desired preview window height for viewing documentation.
  set previewheight=5
endif

" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END
