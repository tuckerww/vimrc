set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'powerline/fonts'
"Plugin 'bling/vim-bufferline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
"Plugin 'scrooloose/nerd"tree'
Plugin 'flazz/vim-colorschemes'
Plugin 'airblade/vim-gitgutter'
Plugin 'henrik/vim-indexed-search'
Plugin 'sjl/gundo.vim'

":PluginInstall

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

set encoding=utf-8
set fileencodings=utf-8
set laststatus=2
set ttimeoutlen=10
set noshowmode
set nonumber
filetype plugin indent on
set expandtab
set tabstop=2
set shiftwidth=2
set hidden
set mouse=a
set ttymouse=xterm2

"set backup and swap dirs:
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

"shift+tab unindents for command mode
nnoremap <S-Tab> <<
"shift+tab unindents for insert mode
inoremap <S-Tab> <C-d>
"note that ctrl-t and ctrl-d are built-in indent and unindent commands

" Map comma as leader
let mapleader = ","

"Note : shift+left-mouse copies and shift+rightmouse pastes!
"use ',m' to toggle mouse selection
nnoremap <leader>m :call MouseToggle()<cr>
function! MouseToggle()
    if !empty(&mouse)
        set ttymouse=sgr
        setlocal mouse=
    else
        setlocal mouse=a
        set ttymouse=xterm2
    endif
endfunction

" toggle numbers with ',n'
nnoremap <leader>n :setlocal number!<cr>

" open command in new buffer, split, or vsplit  with ,[char]
nnoremap <leader>c :enew\|%!
nnoremap <leader>s :new\|0read!
nnoremap <leader>v :vnew\|0read!

nnoremap <leader>cc :enew<cr>
nnoremap <leader>ss :new<cr>
nnoremap <leader>vv :vnew<cr>

" force delete buffer with ,bd
nnoremap <leader>q :bd!<cr>

"open Gundo
"https://sjl.bitbucket.io/gundo.vim/#installation
nnoremap <leader>g :GundoToggle<cr>

"toggle git gutter (airblade)
nnoremap <leader>a :GitGutterToggle<cr>

" move among buffers with CTRL
map <C-J> :bprev<CR>
map <C-K> :bnext<CR>

" make netrw better
" refer to https://shapeshed.com/vim-netrw/ for more info
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 20

" open explorer in vertical split
nnoremap <leader>x :Vex<cr>

" increase and decrease split width
nnoremap <leader>ll :vertical resize +3<cr>
nnoremap <leader>hh :vertical resize -3<cr>

" make ack.vim use ag instead of ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
  cnoreabbrev ag Ack!
  cnoreabbrev aG Ack!
  cnoreabbrev Ag Ack!
  cnoreabbrev AG Ack!
endif

" ack/ag search
nnoremap <leader>a :Ack!<Space>

" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

" So we don't have to reach for escape to leave insert mode.
" also puts it back in the same place so you don't have to hit right to delete
" a word
inoremap jf <esc>l

set background=dark
"let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
"let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
"let g:airline_theme = 'hybrid'
"let g:airline_theme = 'powerlineish'
let g:airline_theme = 'alduin'
"colorscheme default

set t_Co=256
set background=dark
"colorscheme Monokai
"colorscheme elflord
colorscheme delek
hi Search ctermfg=Red ctermbg=DarkBlue
"hi StatusLine ctermbg=DarkBlue
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

"if has("terminfo")
"  let &t_Co=16
"  let &t_AB="\<Esc>[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm"
"  let &t_AF="\<Esc>[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm"
"else
"  let &t_Co=16
"  let &t_Sf="\<Esc>[3%dm"
"  let &t_Sb="\<Esc>[4%dm"
"endif

 if !exists('g:airline_symbols')
   let g:airline_symbols = {}
 endif
 let g:airline_symbols.space = "\ua0"

 " unicode symbols
 let g:airline_left_sep = ''
 let g:airline_left_sep = ''
 let g:airline_right_sep = ''
 let g:airline_right_sep = ''
 let g:airline_symbols.crypt = ''
 let g:airline_symbols.linenr = '☰'
 let g:airline_symbols.linenr = ''
 let g:airline_symbols.maxlinenr = ''
 "let g:airline_symbols.maxlinenr = '㏑'
 let g:airline_symbols.branch = ''
 let g:airline_symbols.paste = 'ρ'
 "let g:airline_symbols.paste = 'Þ'
 "let g:airline_symbols.paste = '∥'
 "let g:airline_symbols.spell = 'Ꞩ'
 let g:airline_symbols.spell = 'S'
 let g:airline_symbols.notexists = '∄'
 let g:airline_symbols.whitespace = 'Ξ'
 "
 
