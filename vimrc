set nocompatible
set t_Co=256
set laststatus=2
set fillchars+=stl:\ ,stlnc:\
"=================
" Vundle config
filetype off
if has('unix')
  set rtp+=~/.vim/bundle/Vundle.vim/
  call vundle#begin()
elseif has('win32')
  set rtp+=~/vimfiles/bundle/Vundle.vim/
  let path='~/vimfiles/bundle'
  call vundle#begin(path)
endif
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'
Plugin 'tpope/vim-bundler'
Plugin 'tomasr/molokai'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'gmarik/Vundle.vim'
if !empty(glob('~/.use_ycm'))
  Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
Plugin 'lepture/vim-jinja'
Plugin 'tpope/vim-rails'
Plugin 'nginx.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'bling/vim-airline'
Plugin 'chase/vim-ansible-yaml'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'tek/vim-textobj-ruby'
Plugin 'junegunn/vim-easy-align'
Plugin 'whatyouhide/vim-textobj-xmlattr'
Plugin 'tpope/vim-abolish'
Plugin 'wting/rust.vim'
Plugin 'cespare/vim-toml'
call vundle#end()
filetype plugin indent on
"Airline
let g:airline#extensions#tabline#enabled = 1
set noshowmode
let g:airline_theme='base16'
"Syntastic
let g:syntastic_always_populate_loc_list=1
" CtrlP.vim
let g:ctrlp_extensions = ['tag']
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

nnoremap <C-S-T> :CtrlPTag<CR>
let g:delimitMate_expand_cr=2
let g:delimitMate_expand_space=1
"Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au VimEnter * RainbowParenthesesLoadRound
au VimEnter * RainbowParenthesesLoadSquare
au VimEnter * RainbowParenthesesLoadBraces
au VimEnter * RainbowParenthesesLoadChevrons

"---
let g:textobj_ruby_inner_branch=0

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter>         <Plug>(EasyAlign)
vmap <Leader><Enter> <Plug>(LiveEasyAlign)
" " Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

"================
" Color schemes
if !has("gui_running")
  let g:rehash256 = 1
endif
if has("gui_running")
  set guifont=Source_Code_Pro:h12:cANSI
  set clipboard=unnamed
endif

colorscheme molokai

set background=dark
"================

set mps+=<:>

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

nnoremap <Leader>h :nohlsearch<CR>

set list
set listchars=tab:>-,trail:¶

let g:surround_{char2nr('c')} = "<!-- \r -->"
let g:surround_{char2nr('C')} = "<![CDATA[\r]]>"
vmap C Sc

autocmd BufRead,BufNewFile *.erb set filetype=eruby.html
"hi CursorLine term=none cterm=none ctermbg=3

hi Todo ctermbg=1 ctermfg=254

filetype plugin on
filetype indent on

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

autocmd FileType html,eruby  set tabstop=2
autocmd FileType html,eruby  set expandtab
autocmd FileType html,eruby  set softtabstop=2
autocmd FileType html,eruby  set shiftwidth=2

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
 augroup END

 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
