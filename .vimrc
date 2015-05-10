if v:progname =~? "evim"
  finish
endif

set nocompatible

filetype off

" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" :PluginInstall
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'croaker/mustang-vim'
Plugin 'vim-scripts/calmar256-lightdark.vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'othree/html5.vim'
Plugin 'gkz/vim-ls'
call vundle#end()

filetype plugin indent on

" leader
let mapleader="m"

let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_checkers_args='--ignore=E501,E25'

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

" improved ex mode
nnoremap Q gQ

" zz top
nnoremap <C-O> <C-O>zz
nnoremap <C-I> <C-I>zz
nnoremap { {zz
nnoremap } }zz
nnoremap n nzz
nnoremap p pzz

" command mode
nnoremap q; :
noremap ; q:i
noremap : ;
noremap : @:
noremap , ;
noremap m, ,

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

" fold search
set fml=0
set foldexpr=getline(v:lnum)!~@/
noremap <Leader><Space> :set foldmethod=expr<CR>
noremap <Leader>! :YcmDiags<CR>
noremap <Leader>< :cprev
noremap <Leader>> :cnext
noremap <Leader>> :YcmDiags<CR><CR>zz

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
map <Leader>d :YcmCompleter GoToDefinition<CR>
map <Leader>g :YcmCompleter GoToDeclaration<CR>

let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_error_symbol = '!!'
let g:ycm_warning_symbol = '??'
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_auto_stop_csharp_server = 0
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_confirm_extra_conf = 0

let g:ycm_semantic_triggers =  {
\   'c' : ['->', '.'],
\   'objc' : ['->', '.'],
\   'ocaml' : ['.', '#'],
\   'cpp,objcpp' : ['->', '.', '::'],
\   'perl' : ['->'],
\   'php' : ['->', '::'],
\   'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
\   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
\   'ruby' : ['.', '::'],
\   'lua' : ['.', ':'],
\   'erlang' : [':'],
\   'html' : ['re!<[^>]*', '.'],
\ }

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
" nnoremap <Tab> >>
" nnoremap <S-Tab> <<

" space to fold
" nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
nnoremap <Space> :YcmCompleter GoTo<CR>


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
    colorscheme mustang
    " colorscheme calmar256-light
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
