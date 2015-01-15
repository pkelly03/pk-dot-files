set nocompatible

" Load Vundle plugins {{{1
" ------------------------
"
" Vundle config
"
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Repos on github
Bundle 'mileszs/ack.vim'
Bundle 'rking/ag.vim'
" vim-fugitive adds to tags - not sure why
Bundle 'tpope/vim-fugitive' 	

Bundle 'tpope/vim-commentary'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'

Bundle 'altercation/vim-colors-solarized'

Bundle 'vim-ruby/vim-ruby'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-markdown'
Bundle 'groenewege/vim-less'

Bundle 'kchmck/vim-coffee-script'

Bundle 'mattn/zencoding-vim'

Bundle 'vim-scripts/VimClojure'
Bundle 'derekwyatt/vim-scala'

Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'michaeljsmith/vim-indent-object'

Bundle 'Lokaltog/vim-easymotion'
Bundle 'goldfeld/vim-seek'

" To consider:

" Bundle 'tpope/vim-eunuch'

" Consider tabline to display number in tab

" ------------------------

let mapleader = ","
" noremap \ ,

" Load Vim plugins {{{1
runtime macros/matchit.vim
runtime ftplugin/man.vim

" Behaviour {{{1

filetype indent plugin on
syntax on

set hidden

set wildmenu
set wildmode=longest,list

set incsearch
set hlsearch
set ignorecase
set smartcase

set backspace=indent,eol,start

set gdefault

set nofoldenable

set nojoinspaces

set history=200

set wildignore+=*.class

" Vestiges from http://vim.wikia.com/wiki/Example_vimrc {{{1

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Enable use of the mouse for all modes
set mouse=a

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Useful for html and css
set iskeyword+=-

" Appearance {{{1

set listchars=tab:▸\ ,eol:¬
set cursorline
set ruler
set laststatus=2
set showcmd
set number
set cmdheight=2
set visualbell
set t_vb=
set scrolloff=5
set sidescroll=1
set sidescrolloff=5

set background=dark
colorscheme solarized

let NERDTreeWinSize=50

" Indentation {{{1

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Mappings {{{1

" Not needed if using "+p
" set pastetoggle=<F11>
map Y y$
nmap <silent> <leader>n :silent :nohlsearch<CR>
map <leader>l :set list!<CR>
call togglebg#map("<F6>")
map <F7> :set relativenumber!<CR>

" Operate on display lines by default
nnoremap j gj
nnoremap gj j
nnoremap k gk
nnoremap gk k

" Ease window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nnoremap ]a :next<CR>
nnoremap [a :prev<CR>
nnoremap [A :first<CR>
nnoremap ]A :last<CR>

nnoremap ]t :tnext<CR>
nnoremap [t :tprev<CR>
nnoremap [T :tfirst<CR>
nnoremap ]T :tlast<CR>

nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

nnoremap <Tab><Up> <C-w><Up>
nnoremap <Tab><Down> <C-w><Down>
nnoremap <Tab><Left> <C-w><Left>
nnoremap <Tab><Right> <C-w><Right>

" resize current buffer by +/- 5 
nnoremap <C-left> :vertical resize -5<cr>
nnoremap <C-down> :resize +5<cr>
nnoremap <C-up> :resize -5<cr>
nnoremap <C-right> :vertical resize +5<cr>

" Scroll through history command using Emacs chords while preserving the
" filtering offered by the cursor keys. For example, if the command contains
" ':h ', typing <Up> would only show those commands starting with ':h '.
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <leader>k :Ack! 
nnoremap <leader>a :Ag 

map <leader>t :NERDTreeToggle<CR>
map <leader>f :NERDTreeFind<CR>

map - <C-W>-
map + <C-W>+

" Mnemonic is m for method, f for function or t for tag would be better
nnoremap <leader>m :tag 

nnoremap <leader>p :CtrlPClearCache<CR>

nnoremap <silent> <leader>c :wa <bar> :silent :!coffee -bc %<CR>
vnoremap <leader>x :!coffee -bps<CR>

nnoremap <leader>z :Tabularize /

nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>

" Filter the current file through ack - better than :g/
" map filter :%! ack 

map <leader>r :wa <bar> !bin/testunit %<CR>

" Abbreviations {{{1

iabbr destory destroy
iabbr reponse response

" Useful for Jasmine specs
"
abbr desc describe '', -><ESC>F'i
abbr itsh it 'should ', -><ESC>F'i


" Whitespace prefs and filetypes {{{1

autocmd BufNewFile,BufRead *.tmpl       set filetype=html
autocmd BufNewFile,BufRead *.mustache   set filetype=html
autocmd BufNewFile,BufRead *.handlebars set filetype=html
autocmd BufNewFile,BufRead *.ejs        set filetype=html
autocmd BufNewFile,BufRead *.god        set filetype=ruby
autocmd BufNewFile,BufRead *.gradle     set filetype=groovy


autocmd BufNewFile,BufRead *.coffee set includeexpr=CoffeeScriptIncludeExpr()

" Setting local FileType
" autocmd FileType javascript setlocal ts=4 sts=4 sw=4 et

" Netrw config {{{1

let g:netrw_liststyle = 3

" CtrlP config {{{1

let g:ctrlp_switch_buffer = 'et'


" Disable the startup message
set shortmess+=I

" Plugin config {{{1

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Lifted from Practical Vim {{{1

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Source proj specific setup {{{1
if filereadable(".vimrc.paulcarey.custom")
  so .vimrc.paulcarey.custom
endif

" Inline plugins {{{1

" Visual star - * and # search for the visual selection
function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

" Qargs - populate args with each of the files named in the quickfix list
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(map(values(buffer_numbers), 'fnameescape(v:val)'))
endfunction

let g:netrw_liststyle=4


" Add support for gf with CoffeeScript
function! CoffeeScriptIncludeExpr()
  let match = '\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)'
  let fqn = substitute(v:fname, match, '\l\1_\l\2', 'g')
  let parts = split(fqn, '\.')
  let fn = parts[-1]
  return join([fn, '.js.coffee'], '')
endfunction

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
