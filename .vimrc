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
Plugin 'Yggdroot/indentLine'
" Plugin 'ervandew/supertab'
Plugin 'vim-scripts/AutoComplPop'
" for writing:
Plugin 'reedes/vim-pencil'
Plugin 'reedes/vim-litecorrect'
Plugin 'kana/vim-textobj-user'
Plugin 'reedes/vim-textobj-sentence'
Plugin 'reedes/vim-wordy'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'reedes/vim-wheel'

" for latex:
Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'
"for notes
Plugin 'vimwiki/vimwiki'
Plugin 'nelstrom/vim-markdown-folding'

":PluginInstall

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax on
" To ignore plugin indent changes, instead use:
"filetype plugin on

set encoding=utf-8
set fileencodings=utf-8
set laststatus=2
set ttimeoutlen=10
set noshowmode
set number
set relativenumber
filetype plugin indent on
set expandtab
set tabstop=4
set shiftwidth=4
" set colorcolumn=80
set hidden
set mouse=a
set ttymouse=xterm2
set history=2000

"set backup and swap dirs:
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" "shift+tab unindents for command mode
" nnoremap <S-Tab> <<
" "shift+tab unindents for insert mode
" inoremap <S-Tab> <C-d>
" "note that ctrl-t and ctrl-d are built-in indent and unindent commands

" Map comma as leader
let mapleader = "\\"

nnoremap <leader>bb :set cursorline!<cr> :hi CursorLine cterm=NONE ctermbg=DarkGrey<cr>

nnoremap <leader>p :set paste!<cr>
nnoremap <leader>s :set spell!<cr>

" Wrap space-delimited word in backticks like `so`
nnoremap <leader>w lBi`<ESC>Ea`<ESC>

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

" unset relative when entering insert mode or losing focus
" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

" toggle numbers with ',n'
nnoremap <leader>n :call NumberToggle()<cr>
function! NumberToggle()
    if &number && &relativenumber
        setlocal number!
    elseif &relativenumber
        setlocal relativenumber!
        setlocal number
    elseif &number
        setlocal number!
    else
        setlocal number
        setlocal relativenumber
    endif
endfunction

" Toggle writing mode
nnoremap <leader>wm :call WritingMode()<cr>
function! WritingMode()
   setlocal formatoptions=1
   setlocal noexpandtab
   map j gj
   map k gk
   setlocal spell spelllang=en_us
   " set thesaurus+=~/.vim/thes
   set complete+=s
   set formatprg=par
   setlocal wrap
   setlocal linebreak
endfu

let g:wheel#scroll_on_wrap = 1
let g:wheel#map#mouse = 0

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

" open command in new buffer, split, or vsplit  with ,[char]
nnoremap <leader>c :enew\|%!
nnoremap <leader>h :new\|0read!
nnoremap <leader>v :vnew\|0read!

" nnoremap <leader>cc :enew<cr>
" nnoremap <leader>ss :new<cr>
" nnoremap <leader>vv :vnew<cr>

" force delete buffer with ,bd
nnoremap <leader>q :bd!<cr>

"open Gundo
"https://sjl.bitbucket.io/gundo.vim/#installation
nnoremap <leader>g :GundoToggle<cr>

"toggle git gutter (airblade)
nnoremap <leader>gg :GitGutterToggle<cr>

" move among buffers with CTRL
map gB :bprev<CR>
map gb :bnext<CR>

" Note crtl-j and ctrl-k now wheel down and up with wheel plugin

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
" --- Commented out so you can use ';' to progress forward in per-line character search ---
" nnoremap ; :
" vnoremap ; :

" So we don't have to reach for escape to leave insert mode.
" also puts it back in the same place so you don't have to hit right to delete
" a word
inoremap jf <esc>l

" open splits to right and down
set splitbelow
set splitright

" vimwiki with markdown support
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
" helppage -> :h vimwiki-syntax 

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"for latex servername:
" if empty(v:servername) && exists('*remote_startserver')
"   call remote_startserver('VIM')
" endif

" fix indentLine plugin conceal issues and link-hiding issue
let g:indentLine_setConceal = 0
" don't conceal special characters
set conceallevel=0

"let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
"let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
"let g:airline_theme = 'hybrid'
"let g:airline_theme = 'powerlineish'
"let g:airline_theme = 'alduin'
" let g:airline_theme = 'ayu_mirage'
let g:airline_theme = 'angr'

set t_Co=256
set background=dark
" colorscheme Monokai
" colorscheme elflord
colorscheme delek
" colorscheme CandyPaper
" colorscheme 0x7A69_dark
" colorscheme 1989

" Red numbers not on cursorLine
" hi LineNr term=underline ctermfg=1 ctermbg=236 guifg=#878787 guibg=#303030

" no background color:
" hi Normal ctermbg=NONE

" blue visual-select:
" hi Visual ctermbg=blue
hi Visual ctermbg=496

"Make search highlighting readable:
" hi IncSearch ctermbg=DarkGrey
" hi Search ctermbg=DarkGrey
hi IncSearch ctermbg=DarkGrey cterm=underline
hi Search ctermbg=DarkGrey cterm=underline

":h hl-SpellBad
hi SpellBad ctermbg=520 cterm=underline
hi SpellCap ctermbg=520 cterm=underline
hi SpellLocal ctermbg=500 cterm=underline
hi SpellRare ctermbg=503 cterm=underline

hi nonText ctermbg=NONE
" highlight the cursorline:
hi CursorLine cterm=NONE ctermbg=DarkGrey
hi ColorColumn ctermbg=magenta
