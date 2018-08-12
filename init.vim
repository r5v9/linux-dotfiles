" plugins ---------------------------------------------------------------------- {{{

" turn filetype detection off and, even if it's not strictly necessary
" disable loading of indent scripts and filetype plugins
filetype off
filetype plugin indent off

" }}}
" events ----------------------------------------------------------------------- {{{

" save on losing focus
autocmd BufLeave,FocusLost * silent! wall

" autosave
autocmd InsertLeave,TextChanged * if expand('%') != '' | update | endif

" restores the cursor position
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction
augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" closes quickfix window once a file is closed
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" }}}
" default settings ------------------------------------------------------------- {{{

" prevents some security exploits having to do with modelines in files
set modelines=0

" tab setttings. expand tabs to spaces, use width 4
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" autoreload files if changed externally
set autoread

" utf-8 by default
set encoding=utf-8

" at least 5 lines above or below the cursor
set scrolloff=5

" autoident
set autoindent

" show (partial) command in the last line of the screen
set showcmd

" buffers becomes hidden when abandoned
set hidden

" enhanced mode for command-line completion
set wildmenu
set wildmode=list:longest

" use visual bell instead of beeping
set visualbell

" fast terminal connection (more characters will be sent to the screen for redrawing)
set ttyfast

" show the line and column number of the cursor position
set ruler

" backspacing over autoindent, line breaks (join lines) and start of insert
set backspace=indent,eol,start

" last window always have status line
set laststatus=2

" disable line numbers
set nonumber

" ignore binary files
set wildignore+=*.o,*.obj,.git,*.class,*.jar,*.pyc

" if you search for an all-lowercase string your search will be case-insensitive,
" but if one or more characters is uppercase the search will be case-sensitive
set ignorecase
set smartcase

" applies substitutions globally on lines (s/../../g by default)
set gdefault

" highlight search results as you type
set incsearch
set showmatch
set hlsearch

" use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" folders
silent execute '!mkdir -p ~/.nvim/tmp && for i in backup swap view undo; do mkdir -p ~/.nvim/tmp/$i; done'
set backupdir=~/.nvim/tmp/backup/
set directory=~/.nvim/tmp/swap/
set viewdir=~/.nvim/tmp/view/
set undodir=~/.nvim/tmp/undo/

" enable backups
set backup

" Tell vim to remember certain things when we exit
"  '100  :  marks will be remembered for up to 100 previously edited files
"  "1000 :  will save up to 1000 lines for each register
"  :100  :  up to 100 lines of command-line history will be remembered
"  %     :  saves and restores the buffer list
"  n...  :  where to save the viminfo files
set viminfo='100,\"1000,:100,n~/.nvim/tmp/viminfo

" disable auto comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" }}}
" file types ------------------------------------------------------------------- {{{

" javascript file types
au BufNewFile,BufRead *.json             set filetype=javascript

" ruby file types
au BufNewFile,BufRead [vV]agrantfile     set filetype=ruby
au BufNewFile,BufRead Gemfile            set filetype=ruby
au BufNewFile,BufRead Capfile            set filetype=ruby
au BufNewFile,BufRead [rR]akefile,*.rake set filetype=ruby

" python file types
au BufNewFile,BufRead fabfile            set filetype=python

" }}}
" key mappings ----------------------------------------------------------------- {{{

" use , as the leader key
let mapleader = ","

" clear out a search by typing ,/
nnoremap <leader>/ :noh<cr>

" ctrl-c copy selection to clipboard
vnoremap <c-c> "*ygv

" ctrl-x cut selection to clipboard
vnoremap <c-x> "*ygvx

" ctrl-a selects whole file
nnoremap <c-a> ggvG$"*ygv

"make < > shifts keep selection
vnoremap < <gv
vnoremap > >gv

" indent with tab/s-tab
vnoremap <s-tab> <gv
vnoremap <tab> >gv
nnoremap <s-tab> <<
nnoremap <tab> >>
inoremap <s-tab> <Esc><<`]a
inoremap <tab> <Esc>>>`]a

" disable ex mode
nnoremap q <nop>

" navigate around tabs/buffers using control h-l
nnoremap <c-]> :cclose<cr>:bnext<cr>
nnoremap <c-[> :cclose<cr>:bprevious<cr>
inoremap <c-]> <esc>:cclose<cr>:bnext<cr>
inoremap <c-[> <esc>:cclose<cr>:bprevious<cr>

" jj as esc in insert mode
inoremap jj <esc>

" make better use of ;
nnoremap ; :

" leader-f reformats file
nnoremap <leader>f gg=g``<cr><up>

" j and k move around displayed lines (for wrapped text)
nnoremap j gj
nnoremap k gk

" use :w!! to write to a file using sudo if you forgot to sudo vim file
cmap w!! %!sudo tee > /dev/null %

" leader-o go to previous location
nnoremap <leader>o <c-o>

" leader-q closes all buffers
nnoremap <leader>q exe ":bufdo bdelete"

" leader-w closes buffer
nnoremap <leader>w :lclose<cr>:bd<cr>

" alt-s saves buffer
nnoremap <leader>s :lclose<cr>:w<cr>:cclose<cr>

" :v reloads .nvimrc
command! V exe "w | mkview | source ~/.config/nvim/init.vim | filetype detect | echo 'init.vim reloaded'"

" :w closes syntastic error window beforehand
cabbrev <silent> w lclose\|write

" }}}
" autocomplete ----------------------------------------------------------------- {{{

" from https://gist.github.com/qstrahl/7795524

set cot=menu,menuone
inoremap <bs> <bs><c-r>=getline('.')[col('.')-3:col('.')-2]=~#'\k\k'?!pumvisible()?"\<lt>c-n>\<lt>c-p>":'':pumvisible()?"\<lt>c-y>":''<cr>
inoremap <cr> <c-r>=pumvisible()?"\<lt>c-y>":""<cr><cr>
inoremap <tab> <c-r>=pumvisible()?"\<lt>c-n>":"\<lt>tab>"<cr>
inoremap <s-tab> <c-r>=pumvisible()?"\<lt>c-p>":"\<lt>s-tab>"<cr>
inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<cr>"

augroup MyAutoComplete
    autocmd!
    autocmd InsertCharPre * if
    \ !exists('s:complete') &&
    \ !pumvisible() &&
    \ getline('.')[col('.')-2].v:char =~# '\k\k' |
        \ let s:complete = 1 |
        \ noautocmd call feedkeys("\<C-n>\<C-p>", "nt") |
    \ endif
    autocmd CompleteDone * if exists('s:complete') | unlet s:complete | endif
augroup END

" }}}