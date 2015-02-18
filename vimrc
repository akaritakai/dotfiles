set nocompatible
set t_Co=256
set laststatus=2
set fillchars+=stl:\ ,stlnc:\
"=================
" vim-plug
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
call plug#begin(path)
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
if executable('ctags')
  Plug 'vim-scripts/taglist.vim'
end
Plug 'tpope/vim-bundler'
Plug 'tomasr/molokai'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/syntastic'
if !empty(glob('~/.use_ycm'))
  Plug 'Valloric/YouCompleteMe', { 'on': [] }
  augroup load_ycm
    autocmd!
    autocmd InsertEnter * call plug#load('YouCompleteMe')
                       \| call youcompleteme#Enable() | autocmd! load_ycm
  augroup END
endif
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'lepture/vim-jinja'
Plug 'tpope/vim-rails'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'bling/vim-airline'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'kien/rainbow_parentheses.vim'
Plug 'kana/vim-textobj-user'
Plug 'tek/vim-textobj-ruby'
Plug 'junegunn/vim-easy-align'
Plug 'whatyouhide/vim-textobj-xmlattr'
Plug 'tpope/vim-abolish'
Plug 'wting/rust.vim'
Plug 'cespare/vim-toml'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'mhinz/vim-startify'
Plug 'junegunn/vim-after-object'
Plug 'pangloss/vim-javascript'
Plug 'noprompt/vim-yardoc'
Plug 'chrisbra/Colorizer'
Plug 'fatih/vim-go'
Plug 'wesQ3/vim-windowswap'
call plug#end()
"Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
let g:airline#extensions#ctrlp#show_adjacent_modes = 1
set noshowmode
let g:airline_theme='molokai'
"Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" CtrlP.vim
noremap <C-S-B> :CtrlPBuffer<CR>
let g:ctrlp_extensions = ['tag']
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

nnoremap <C-S-T> :CtrlPTag<CR>
let g:delimitMate_expand_cr=2
let g:delimitMate_expand_space=1
"Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons

"Taglist
noremap <F11> :Tlist<CR>

"Startify
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

"---


"---
let g:textobj_ruby_inner_branch=0

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter>         <Plug>(EasyAlign)
vmap <Leader><Enter> <Plug>(LiveEasyAlign)
" " Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

"---

let g:javascript_conceal = 1
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_return     = "←"

"================
" Color schemes
if !has("gui_running")
  let g:rehash256 = 1
endif
if has("gui_running")
  set guifont=Source_Code_Pro:h12:cANSI
  set clipboard=unnamed
  set guioptions-=m
  set guioptions-=T
endif


colorscheme molokai

set background=dark
"================


set bs=2
syntax enable
set encoding=utf8
set ffs=unix,dos,mac
set ai
set number
set modeline
set ruler
set showmatch
set incsearch
set wildmenu
set hidden


set cole=1
hi Conceal guibg=black guifg=white ctermbg=black ctermfg=white

if exists('&breakindent')
  set breakindent
endif

set foldmethod=syntax
set foldnestmax=2

set colorcolumn=80
set cul

set mouse=nh

command WQ wq
command Wq wq
command W w
command Q q

" toggle spell checking with F5
map <F5> :setlocal spell! spelllang=en_us<CR>
map <C-C> :NERDTreeToggle<CR>

let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>h :nohlsearch<CR>
inoremap jj <Esc>

set list
set listchars=tab:>-,trail:¶

let g:surround_{char2nr('j')} = "$(\r)"

let g:surround_{char2nr('c')} = "<!-- \r -->"
let g:surround_{char2nr('C')} = "<![CDATA[\r]]>"
vmap C Sc

autocmd BufRead,BufNewFile *.erb set filetype=eruby.html
"hi CursorLine term=none cterm=none ctermbg=3

hi Todo ctermbg=1 ctermfg=254

filetype plugin on
filetype indent on

autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

autocmd FileType python set shiftwidth=4
autocmd FileType python set softtabstop=4
autocmd FileType python set expandtab

autocmd FileType ruby set tabstop=2
autocmd FileType ruby set expandtab
autocmd FileType ruby set softtabstop=2
autocmd FileType ruby set shiftwidth=2

"Shamelessly stolen from
"http://stackoverflow.com/questions/14333508/vim-ruby-autocomplete
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

autocmd FileType go nnoremap <Leader>gr :GoRun<CR>

autocmd FileType css ColorHighlight

autocmd FileType rust setlocal makeprg=cargo\ build\ --verbose

"surround.vim settings!
let g:surround_{char2nr('=')} = "<%= \r %>"
let g:surround_{char2nr('#')} = "<%# \r %>"
let g:surround_{char2nr('-')} = "<% \r %>"

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
 \ endif

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
