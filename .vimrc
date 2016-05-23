if v:progname =~? "evim"
  finish
endif

set nocompatible

" inoremap <bs> <nop>
" inoremap <cr> <nop>
" nnoremap jj <nop>
" nnoremap kk <nop>

filetype off

" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" :PluginInstall
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'airblade/vim-gitgutter'
Plugin 'croaker/mustang-vim'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'endel/vim-github-colorscheme'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'nowk/genericdc'
Plugin 'othree/html5.vim'
Plugin 'peterhoeg/vim-qml'
Plugin 'plasticboy/vim-markdown'
Plugin 'rsmenon/vim-mathematica'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/calmar256-lightdark.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
call vundle#end()

filetype plugin indent on

" leader
let mapleader="<F3>"

let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_checkers_args='--ignore=E501,E25'
let g:syntastic_check_on_wq = 0

" no more *~ files
set backup
set backupdir=~/Dropbox/backup/vim
set undodir=~/.vim/tmp
set directory=~/.vim/tmp
set undolevels=10000

set completeopt=menuone,preview,noinsert,noselect
set nojoinspaces
set cryptmethod=blowfish
set splitbelow
set splitright
set tabstop=4
set shiftwidth=4
set expandtab
set copyindent
set shiftround
set autochdir
set ttyfast
set hidden
set visualbell
set noerrorbells
set timeoutlen=1000 ttimeoutlen=0
set ignorecase
set smartcase
set pastetoggle=mp
set wildignore=*.o,*~,*.pyc,__pycache__,.git
set history=1000
set showcmd
set incsearch
set backspace=indent,eol,start
set foldmethod=manual
set relativenumber
set nowrap

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

" tabs
noremap <silent> \ :bnext<cr>
noremap <silent> \| :bprevious<cr>
noremap <silent> ml :rightb :vsplit<cr>
noremap <silent> mh :lefta :vsplit<cr>
noremap <silent> mk :rightb :split<cr><c-w>k
noremap <silent> mj :lefta :split<cr><c-w>j
noremap <silent> mL :rightb :vsplit<cr>:CtrlP<cr>
noremap <silent> mH :lefta :vsplit<cr>:CtrlP<cr>
noremap <silent> mK :rightb :split<cr><c-w>k:CtrlP<cr>
noremap <silent> mJ :lefta :split<cr><c-w>j:CtrlP<cr>

nnoremap <expr> <silent> - ':-' . (v:count ? v:count : '1')
nnoremap <expr> <silent> = ':+' . (v:count ? v:count : '1')
nnoremap <expr> <silent> _ ':-' . (v:count ? v:count : '1') . ','
nnoremap <expr> <silent> + ':,+' . (v:count ? v:count : '1')

noremap <silent> <s-h> :FSHere<cr>

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

augroup FSwitchConf
    au!
    au BufEnter *.cpp let b:fswitchdst = 'h'
augroup END

" vimdiff
noremap <silent> m[ :diffget LO<cr>
noremap <silent> m] :diffget RE<cr>

" plugins
let g:ctrlp_map='<C-P>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_match_window='top,order:ttb,min:10,max:10'
let g:ctrlp_switch_buffer='0'
let g:ctrlp_open_new_file='r'
let g:ctrlp_tabpage_position='c'
let g:ctrlp_root_margers=['node_modules', '.cabal-sandbox']
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_custom_ignore='node_modules,.cabal-sandbox'
let g:ctrlp_prompt_mappings={'PrtClearCache()': ['<f5>', '<c-r>']}

set mouse=a

noremap <silent> mt :NERDTreeToggle<CR>
noremap <silent> md :YcmCompleter GoToDeclaration<CR>
noremap <silent> ms :GitGutterStageHunk<CR>
noremap <silent> mr :GitGutterRevertHunk<CR>
noremap <silent> m! :YcmDiags<CR>
noremap <silent> m> :YcmDiags<CR><CR>zz
noremap <silent> m< :cprev
noremap <silent> m> :cnext

" show nerdtree at startup
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:mustache_abbreviations=1

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
\   'rs': ['.', '::'],
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
"
vnoremap <silent> <Space> zf
nnoremap <silent> <Space> :w<cr>

set colorcolumn=80

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
    set nohlsearch
    inoremap <C-Space> <C-x><C-o>
    set cul
    hi CursorLine term=none cterm=none
endif

" filetype specific
augroup vimrcEx
    au!
    au FileType haskell nnoremap <buffer> gt :HdevtoolsType<cr>
    au FileType haskell nnoremap <buffer> <silent> gT :HdevtoolsClear<cr>
    "au FileType javascript noremap <buffer> gd :TernDef<cr>
    "au FileType javascript noremap <buffer> gr :TernRefs<cr>
    "au FileType javascript noremap <buffer> mn :TernRename<cr>
    au FileType text setlocal textwidth=80
    au FileType make setlocal tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
    au FileType ls setlocal foldmethod=indent nofoldenable
    au BufNewFile,BufRead *.pde setlocal ft=arduino
    au BufNewFile,BufRead *.ino setlocal ft=arduino
    " not sure what this line does
    au BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
augroup END

" first attempt at vimscript, beware
let s:colorschemes = [
    \ 'default',
    \ 'mustang',
    \ '256_noir',
    \ 'smpl',
    \ 'genericdc',
    \ 'frozen',
    \ 'C64',
    \ 'genericdc-light',
    \ 'github',
    \ 'calmar256-light',
    \ 'blue',
    \ 'xoria256',
    \ 'materialbox']

function! s:NextColor()
    if exists('g:colors_name')
        let next_index = index(s:colorschemes, g:colors_name) + 1
    else
        let next_index = 0
    endif
    if next_index >= len(s:colorschemes)
        let next_index = 0
    endif
    execute 'colorscheme ' . s:colorschemes[next_index]
    " TODO: find out whats wrong
    hi NonText ctermbg=NONE
endfunction

command! NextColor call s:NextColor()
noremap mc :NextColor<CR>
call s:NextColor()


augroup PLUGIN

autocmd!

let g:watches = []

function! s:RunWatch()
    if empty(g:watches)
        return
    endif
    for watch in g:watches
        let [bufferid, cmd] = watch
        silent vsplit
        silent execute ":buffer " . bufferid
        silent setlocal modifiable
        silent 1,$delete
        silent execute ':silent read !' . cmd
        silent 1,1delete
        silent setlocal nomodifiable
        silent close
    endfor
    redraw!
endfunction

function! s:Watch(cmd)
    py import uuid
    let bufferid = pyeval("str(uuid.uuid4())")
    botright new
    setlocal buftype=nofile noswapfile nowrap " bufhidden=wipe nobuflisten
    execute ":file " .  bufferid
    call insert(g:watches, [bufferid, a:cmd])
    call s:RunWatch()
endfunction

command! -nargs=1 -complete=command Watch call s:Watch('<args>')

autocmd BufWritePost * call s:RunWatch()

augroup END

if $DISPLAY == ''
    let g:instant_markdown_autostart=0
endif

" 'difforig'
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

hi NonText ctermbg=NONE

let g:ycm_rust_src_path = '/home/lennart/rustlib/rustc-1.7.0/src'

set foldlevel=99
