" The very basics {{{
" Be improved
set nocompatible
" 256 colors
set t_Co=256
" Allow backspacing like in a non-Vim editor
set bs=2
" Enable syntax highlighting
syntax enable
" Enable plugins and indentation based on filetypes detection.
filetype plugin on
filetype indent on
" load matchit.vim, for purposes of quickly jumping to matching tags
runtime macros/matchit.vim
" Default to UTF-8 encoding
set encoding=utf8
" Default to Unix line endings on new files, read as Unix line endings first,
" then DOS -> Mac
set ffs=unix,dos,mac
" Use the autoindenter, based on syntax
set autoindent
" Use line numbering
set number
" Allow using a modeline (:help modeline)
set modeline
" Don't use the Vim ruler (airline has this too)
set noruler
" When a bracket is inserted, briefly jump to the matching one if it can be
" seen on the screen.
set showmatch
" Incremental search -- search as you type
set incsearch
" Use the much improved wildmenu when completing options
set wildmenu
" Only redraw when necessary (e.g. not in the middle of macros...)
set lazyredraw
" Allow background buffers without having to save them to disk first
set hidden
" breakindent: indentations continue on next line if soft line wrapped
if exists('&breakindent')
  set breakindent
endif
" folding uses syntax with a maximum of two nesting levels
set foldmethod=syntax
set foldnestmax=2
" Add a line on the 80th column
set colorcolumn=80
" Highlight the line that the cursor is on (for near instant identification)
set cul
" Allow mouse usage in normal mode and help files
set mouse=nh
" list: show certain characters with representations
set list
" tabs are shown as >-----, trailing spaces are shown with a special mark
set listchars=tab:>-,trail:¶
" use the system clipboard for vim whenever possible
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
end

" toggle spell checking with F5
map <F5> :setlocal spell! spelllang=en_us<CR>

" }}}
" Neovim stuff {{{
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif
" }}}
" Handy remappings {{{
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>h :nohlsearch<CR>
inoremap jj <Esc>
nnoremap <Leader>n :set relativenumber!<CR>
"}}}
" vim-plug {{{
if has('unix')
  let plugpath=$HOME.'/.vim/autoload/plug.vim'
  let path='~/.vim/bundle'
elseif has('win32')
  let plugpath=$HOME.'/vimfiles/autoload/plug.vim'
  let path='~/vimfiles/bundle'
endif
if empty(glob(plugpath))
  " Initial bootstrapping on first install
  execute 'silent !curl -fLo ' . plugpath . ' --create-dirs ' .
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall
endif
" Plugins {{{
call plug#begin(path)
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-bundler'
Plug 'sjl/badwolf'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'bling/vim-airline'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'kien/rainbow_parentheses.vim'
Plug 'kana/vim-textobj-user'
Plug 'junegunn/vim-easy-align'
Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'tpope/vim-abolish'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'mhinz/vim-startify'
Plug 'junegunn/vim-after-object'
Plug 'chrisbra/Colorizer'
Plug 'wesQ3/vim-windowswap'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-rails'
Plug 'tek/vim-textobj-ruby'
Plug 'noprompt/vim-yardoc'
Plug 'hynek/vim-python-pep8-indent'
" todo: only load language-specific plugins on entering a buffer of the
" correct filetype
if has('python')
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
endif

if executable('ctags')
  Plug 'vim-scripts/taglist.vim'
  noremap <F11> :Tlist<CR>
endif

if executable('ack')
  Plug 'mileszs/ack.vim'
endif

if executable('ag')
  Plug 'rking/ag.vim'
endif

if !empty(glob('~/.use_ycm'))
  Plug 'Valloric/YouCompleteMe', { 'on': [] }
  augroup load_ycm
    autocmd!
    autocmd InsertEnter * call plug#load('YouCompleteMe')
                       \| call youcompleteme#Enable() | autocmd! load_ycm
  augroup END
endif
call plug#end() "}}} }}}
"Airline {{{
"Always give the last window a status line
set laststatus=2
" Never put a (vim default) message on the status line about the mode
" (airline does this for me)
set noshowmode
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
let g:airline#extensions#ctrlp#show_adjacent_modes = 1 "}}}
"Syntastic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_ruby_mri_quiet_messages = { "regex": "interpreted as argument prefix" }
let g:syntastic_ruby_checkers = ['mri']
let g:syntastic_check_on_wq = 0 "}}}
" CtrlP.vim {{{
let g:ctrlp_extensions = ['tag']
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] "}}}
" delimitMate {{{
let g:delimitMate_expand_cr=2
let g:delimitMate_expand_space=1 "}}}
"Rainbow Parentheses {{{
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces "}}}
" UltiSnips {{{
 let g:UltiSnipsExpandTrigger="<c-e>"
 let g:UltiSnipsListSnippets="<c-a-e>"
 let g:UltiSnipsJumpForwardTrigger="<c-j>"
 let g:UltiSnipsJumpBackwardTrigger="<c-k>"
 let g:UltiSnipsEditSplit="vertical"
" }}}
"Startify {{{
let g:startify_bookmarks = [
\  '~/.vimrc'
\ ]

let g:startify_custom_header = [
  \ '                      _              _         __',
  \ '               _   __(_)___ ___     (_)____   / /___ _   _____',
  \ '              | | / / / __ `__ \   / / ___/  / / __ \ | / / _ \',
  \ '              | |/ / / / / / / /  / (__  )  / / /_/ / |/ /  __/',
  \ '              |___/_/_/ /_/ /_/  /_/____/  /_/\____/|___/\___/',
  \ ''
  \ ]

let g:startify_custom_footer = [
 \ '',
 \ '                        _              _         ___ ____',
 \ '                 _   __(_)___ ___     (_)____   / (_) __/__',
 \ '                | | / / / __ `__ \   / / ___/  / / / /_/ _ \',
 \ '                | |/ / / / / / / /  / (__  )  / / / __/  __/',
 \ '                |___/_/_/ /_/ /_/  /_/____/  /_/_/_/  \___/',
 \ ''
 \ ]
" }}}
" vim-textobj-user {{{
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
" }}}
"vim-textobj-ruby {{{
let g:textobj_ruby_inner_branch=0 "}}}
"vim-easy-align {{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter>         <Plug>(EasyAlign)
vmap <Leader><Enter> <Plug>(LiveEasyAlign)
" " Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign) "}}}
" vim-javascript {{{
let g:javascript_conceal = 1
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_return     = "←" "}}}
" vim-go {{{
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" }}}
" NERDTree {{{
map <C-C> :NERDTreeToggle<CR>
"}}}
"surround.vim {{{
let g:surround_{char2nr('=')} = "<%= \r %>"
let g:surround_{char2nr('#')} = "<%# \r %>"
let g:surround_{char2nr('-')} = "<% \r %>"
let g:surround_{char2nr('j')} = "$(\r)"
vmap C Sc
let g:surround_{char2nr('c')} = "<!-- \r -->"
let g:surround_{char2nr('C')} = "<![CDATA[\r]]>" "}}}
" Color schemes and other GUI things {{{
if has("gui_running")
  set guifont=Source_Code_Pro:h12:cANSI
  set guioptions-=m
  set guioptions-=T
else
  let g:rehash256 = 1
endif

colorscheme badwolf

"}}}
" Concealing (requires a vim with +conceal) {{{
if has('conceal')
  set cole=1
  hi Conceal guibg=black guifg=white ctermbg=black ctermfg=white
endif "}}}
" Account for accidentally holding down shift while trying to save or exit {{{
command WQ wq
command Wq wq
command W w
command Q q "}}}
" Re-color TODOs to be white on red. {{{
hi Todo ctermbg=1 ctermfg=254
" }}}
" Per-filetype settings {{{
autocmd FileType python set shiftwidth=4
autocmd FileType python set softtabstop=4
autocmd FileType python set expandtab

autocmd FileType ruby set tabstop=2
autocmd FileType ruby set expandtab
autocmd FileType ruby set softtabstop=2
autocmd FileType ruby set shiftwidth=2

autocmd BufRead,BufNewFile *.erb set filetype=eruby.html
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

let g:xml_syntax_folding=1
autocmd FileType xml setlocal foldmethod=syntax

autocmd FileType xml,html,eruby set tabstop=2
autocmd FileType xml,html,eruby set expandtab
autocmd FileType xml,html,eruby set softtabstop=2
autocmd FileType xml,html,eruby set shiftwidth=2
autocmd FileType xml,html,eruby set mps+=<:>

autocmd FileType scss,css set tabstop=2
autocmd FileType scss,css set expandtab
autocmd FileType scss,css set softtabstop=2
autocmd FileType scss,css set shiftwidth=2

autocmd FileType vim set tabstop=2
autocmd FileType vim set expandtab
autocmd FileType vim set softtabstop=2
autocmd FileType vim set shiftwidth=2

autocmd FileType javascript set tabstop=2
autocmd FileType javascript set expandtab
autocmd FileType javascript set softtabstop=2
autocmd FileType javascript set shiftwidth=2

autocmd BufEnter *.jsx let g:syntastic_javascript_checkers = ['jsxhint']
autocmd BufEnter *.js let g:syntastic_javascript_checkers = ['jshint']

autocmd FileType go nnoremap <Leader>gr :GoRun<CR>
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

autocmd FileType css ColorHighlight

autocmd FileType rust setlocal makeprg=cargo\ build\ --verbose "}}}
" Convenience functions {{{
" Automatically jump to where you were when you closed the file upon
" re-opening it {{{
autocmd BufReadPost *
 \ if expand("<afile>:p:h") !=? $TEMP |
 \ if line("'\"") > 1 && line("'\"") <= line("$") |
 \ let JumpCursorOnEdit_foo = line("'\"") |
 \ let b:doopenfold = 1 |
 \ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
 \ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
 \ let b:doopenfold = 2 |
 \ endif |
 \ exe JumpCursorOnEdit_foo |
 \ endif |
 \ endif |
 \ autocmd BufWinEnter *
 \ if exists("b:doopenfold") |
 \ exe "normal zv" |
 \ if(b:doopenfold > 1) |
 \ exe "+".1 |
 \ endif |
 \ unlet b:doopenfold |
 \ endif " }}}
" Close Vim if NERDTree is the last thing open {{{
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"}}}
""}}}

" vim:fdm=marker ts=2 sw=2 et
