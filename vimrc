set nocompatible
set t_Co=256
" Powerline config.
set rtp+=/home/rylai/code/powerline/powerline/bindings/vim
set laststatus=2
set fillchars+=stl:\ ,stlnc:\
"=================
" Vundle config
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'taglist.vim'
Bundle 'terryma/vim-multiple-cursors'
" Pathogen
execute pathogen#infect()
"Syntastic
let g:syntastic_always_populate_loc_list=1
" CtrlP.vim
set runtimepath^=~/.vim/bundle/ctrlp.vim
"================
" Color schemes
let g:solarized_termcolors=256
"let g:solarized_termtrans=1
let g:solarized_contrast="high"
"let g:solarized_visibility="high"
colorscheme solarized
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

set list
set listchars=tab:>-,trail:¶

"hi CursorLine term=none cterm=none ctermbg=3

filetype plugin on
filetype indent on

autocmd FileType python set shiftwidth=4
autocmd FileType python set softtabstop=4
autocmd FileType python set expandtab

autocmd FileType ruby set tabstop=2
autocmd FileType ruby set expandtab
autocmd FileType ruby set softtabstop=2
autocmd FileType ruby set shiftwidth=2

" completion
let g:EclimCompletionMethod = 'omnifunc'
"surround.vim settings!
let g:surround_{char2nr('=')} = "<%= \r %>"
let g:surround_{char2nr('-')} = "<% \r %>"

"function! InsertTabWrapper()
"        let col = col('.') - 1
"        if !col || getline('.')[col - 1] !~ '\k'
"return "\<tab>"
"        else
"                return "\<c-p>"
"        endif
"endfunction
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <s-tab> <c-n>
"
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
