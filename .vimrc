if v:progname =~? "evim"
  finish
endif

" not sure what this does
filetype plugin indent on
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor = "latex"

" improved
set nocompatible

" leader
let mapleader="m"

" no more *~ files
set backup
set backupdir=~/Dropbox/backup/vim
set directory=~/.vim/tmp

" better autocomplete selection
set completeopt=menuone,longest,preview
" no double spaces
set nojoinspaces
" security
set cryptmethod=blowfish
" window creation
set splitbelow
set splitright
" indentation
set tabstop=4
set shiftwidth=4
set expandtab
set copyindent
set shiftround
" other
set autochdir
set ttyfast
set hidden
set visualbell
set noerrorbells
set timeoutlen=1000 ttimeoutlen=0
set ignorecase
set smartcase
set pastetoggle=<F2>
set wildignore=*.o,*~,*.pyc,__pycache__,.git
set history=1000
set showcmd
set incsearch
set backspace=indent,eol,start
" info
"set statusline=%1*%m%*%F
"visualize whitespace
set list
set listchars=tab:__,trail:.,extends:$,nbsp:.,conceal:-,precedes:>
if has("vms")
  set nobackup
else
  set backup
  set undofile
endif

" repeat last command
nnoremap , @:

" improved ex mode
nnoremap Q gQ

" command mode
nnoremap q; :
nnoremap ; q:i
nnoremap ; q:i
nnoremap : ;
vnoremap ; q:i
vnoremap : ;

augroup ECW_au
    au!
    au CmdwinEnter * nnoremap <esc> :q<CR>
    au CmdwinEnter * nnoremap ; Gi
    au CmdwinLeave * nnoremap <esc> <NOP>
    au CmdwinLeave * nnoremap ; q:i
augroup END

" double o
map <Leader>o o<esc>o
map <Leader>O o<esc>O

" plugins
let g:ctrlp_map='<Leader>m'
let g:EasyMotion_smartcase = 1
noremap <Leader>t :NERDTreeToggle<CR>
map <Leader>/ <Plug>(easymotion-sn)
map <Leader>N <Plug>(easymotion-prev)
map <Leader>n <Plug>(easymotion-next)
map <Leader>f <Plug>(easymotion-s)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

function! Pipe(cmd)
    redir => message
    silent execute a:cmd
    redir END
    new
    silent put=message
    set nomodified
endfunction
command! -nargs=+ -complete=command Pipe cal Pipe(<q-args>)

cmap w!! w !sudo tee % >/dev/null

" normal mode indenting
nnoremap <Tab> >>
nnoremap <S-Tab> <<

" space to fold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" windows
nnoremap <C-c> <C-w>c
noremap <C-k> <C-w>k
noremap <C-j> <C-w>j
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

" formatting
vmap Z gq
nmap Z gqap

" undo C-U
inoremap <C-U> <C-G>u<C-U>

" highlighting
if &t_Co > 2 || has("gui_running")
    set t_Co=256
    syntax on
    colorscheme Mustang
    set hlsearch
    inoremap <C-Space> <C-x><C-o>
    set cul
    hi CursorLine term=none cterm=none
endif

" filetype specific
augroup vimrcEx
    au!
    au FileType text setlocal textwidth=72
    au FileType markdown setlocal spell
    au FileType make setlocal tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
    au BufNewFile,BufRead *.pde setlocal ft=arduino
    au BufNewFile,BufRead *.ino setlocal ft=arduino
    " not sure what this line does
    au BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup END

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

if filereadable("~/.rainbow.vim")
    source ~/.rainbow.vim
end
