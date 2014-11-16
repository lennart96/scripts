if v:progname =~? "evim"
  finish
endif

filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

set nocompatible

set cryptmethod=blowfish

set backspace=indent,eol,start

if has("vms")
  set nobackup
else
  set backup
  set undofile
endif
set history=1000
set title
set ruler
    set showcmd
set incsearch

cmap w!! w !sudo tee % >/dev/null

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

nnoremap qq <Esc>
vnoremap qq <Esc>gv
onoremap qq <Esc>
inoremap qq <Esc>`^

set hidden
set visualbell
set noerrorbells

set timeoutlen=200 ttimeoutlen=0
nnoremap <Tab> >>
nnoremap <S-Tab> <<

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

noremap <C-k> <C-w>k
noremap <C-j> <C-w>j
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
inoremap <C-w> <Esc>:w<CR>a

vmap Z gq
nmap Z gqap

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

if has('mouse')
  " set mouse=a
endif

if &t_Co > 2 || has("gui_running")
  syntax on
  colorscheme evening
  set hlsearch
endif

if has("autocmd")

  filetype plugin indent on

  augroup vimrcEx
  au!

  autocmd FileType text setlocal textwidth=72
  autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
  autocmd FileType haskell set omnifunc=necoghc#omnifunc
  autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino
  autocmd! BufNewFile,BufRead *.ino setlocal ft=arduino

  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent

endif

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set copyindent
set shiftround
set ignorecase
set smartcase
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set pastetoggle=<F2>


" set spell

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

filetype plugin on

let maplocalleader = ","

if has("gui_running")
    inoremap <C-Space> <C-x><C-o>
else
    inoremap <Nul> <C-x><C-o>
endif

" nnoremap <Esc> ZZ
