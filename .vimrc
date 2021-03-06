" === SETTINGS ===

" Be IMproved
set nocompatible
syntax on

" Set backup and swap dirs:
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

set encoding=utf-8
set fileencodings=utf-8
set laststatus=2
set ttimeoutlen=10
set hidden
set noshowmode
set history=2000
set wildmenu
set showcmd
set number
set relativenumber
set expandtab
set tabstop=4
set shiftwidth=4
set mouse=a
set ttymouse=xterm2
let g:wheel#scroll_on_wrap = 1

" Open splits to right and down
set splitbelow
set splitright

" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

" Set viminfo settings
set viminfo='100,<1000,s100,:200,n~/.vim/.viminfo
" set viminfo='100,<1000,s100,:200,%,n~/.vim/.viminfo
"  'q  : q, number of edited file remembered
"  <m  : m, number of lines saved for each register
"  :p  : p, number of  history cmd lines remembered
"  %   : saves and restore the buffer list
"  n...: fully qualified path to the viminfo files (note that this is a literal 'n')

" Make netrw better
" Refer to https://shapeshed.com/vim-netrw/ for more info
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 20

" === END SETTINGS ===

" === AUTO COMMANDS ===

" File-specific mappings
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd Filetype javascript inoremap cl_ console.log();<esc>hi

" Spacing by file-type
autocmd BufRead,BufNewFile *.vue setfiletype html
autocmd Filetype php setlocal ts=2 sw=4 sts=0 expandtab
autocmd Filetype html setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab


" === END AUTO COMMANDS ===

" === MAPPINGS ===

" Map backslash as leader
let mapleader = "\\"

" Move among buffers with CTRL
map gb :bnext<CR>
map gB :bprev<CR>

" So we don't have to reach for escape to leave insert mode
" Also puts it back in the same place so you don't have to hit right to delete a word
inoremap jf <esc>l
inoremap fj <esc>l
inoremap jj <esc>l

" swap mark keys so ' goes to column whereas ` just goes to line
nnoremap ` '
nnoremap ' `

" Map :w + Enter in insert mode to actually write
inoremap :w<cr> <esc>:w<cr>

" Clear search
nnoremap <leader><space> :noh<cr>

" Wrap space-delimited word in backticks like `so`
nnoremap <leader>w lBi`<ESC>Ea`<ESC>

" Force delete buffer
nnoremap <leader>q :bd!<cr>

nnoremap <leader>p :set paste!<cr>
nnoremap <leader>s :set spell!<cr>
nnoremap <leader>p :set paste!<cr>

nnoremap <leader>bb :set cursorline!<cr> :hi CursorLine cterm=none ctermbg=black<cr>

nnoremap <leader>hh :new<cr>
nnoremap <leader>vv :vnew<cr>
"nnoremap <leader>cc :enew<cr>

" Open command in new buffer, split, or vsplit  with ,[char]
nnoremap <leader>c :enew\|%!
nnoremap <leader>h :new\|0read!
nnoremap <leader>v :vnew\|0read!

" Open explorer in vertical split
nnoremap <leader>x :Vex<cr>

" Note : shift+left-mouse copies and shift+rightmouse pastes!
" Use ',m' to toggle mouse selection
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

" So we don't have to press shift when we want to get into command mode.
" --- Commented out so you can use ';' to progress forward in per-line character search ---
"nnoremap ; :
"vnoremap ; :

" Unset relative when entering insert mode or losing focus
"augroup numbertoggle
"  autocmd!
"  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
"augroup END

" Toggle numbers with '<leader>n'
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

" === END MAPPINGS ===

" === OTHER CONFIG FILES ===

" Source plugins
if filereadable(expand("~/.vim/.vimrc.colors")) | exe "source ~/.vim/.vimrc.colors" | endif

" Source plugins
if filereadable(expand("~/.vim/.vimrc.plugins")) | exe "source ~/.vim/.vimrc.plugins" | endif

" Source writing-related stuff
if filereadable(expand("~/.vim/.vimrc.writing")) | exe "source ~/.vim/.vimrc.writing" | endif

" === END OTHER CONFIG FILES ===
