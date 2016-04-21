map <F5> :!./testmine.sh <CR>
map <F8> :!./testref.sh <CR>
map <F9> :!./test.sh <CR>
map <F7> :!./run_production.sh <CR>
map <S-F9> :!vimdiff data.cl-ast cldata.cl-ast <CR>

"Vundle settings from the github
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

"Let Vundle managed vundle!
Plugin 'VundleVim/Vundle.vim'

"My bundles here:
Bundle 'sjl/gundo.vim'
nnoremap <F10> :GundoToggle<CR> 
Bundle 'Valloric/YouCompleteMe'
let mapleader = "\<Space>"
nnoremap <leader>t :YcmCompleter GetType<CR>

"Auto tag
Bundle 'craigemery/vim-autotag'

"Targets
Bundle 'wellle/targets.vim'

"Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

let g:airline_powerline_fonts = 1
let g:airline_theme='kolor'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
set fillchars+=stl:\ ,stlnc:\ 
" 256 Colors
Bundle 'noah/vim256-color'

"Set some statusline stuff
set laststatus=2

"messan's
" set statusline=   " clear the statusline for when vimrc is reloaded
" set statusline+=%-3.3n\                      " buffer number
" set statusline+=%f\                          " file name
" set statusline+=%h%m%r%w                     " flags
" set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
" set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
" set statusline+=%{&fileformat}]              " file format
" set statusline+=%=                           " right align
" set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
" set statusline+=%b,0x%-8B\                   " current char
" set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

Plugin 'terryma/vim-expand-region'
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]


"Fix backspace back to the way it was, damn it
set backspace=indent,eol,start

Bundle 'scrooloose/syntastic'
"let g:syntastic_mode_ap = {'more': 'active',
            "\ 'active_filetypes': [],
            "\ 'passive_filetypes': ['html'] }
"highlight SyntasticErrorSign guifg=white guibg=red
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

let g:syntastic_ocaml_checkers = ['merlin']

"If you use `:mksession` to save Vim sessions you should probably make sure to
"remove option "blank" from 'sessionoptions': >
set sessionoptions-=blank


syntax on  "Had to add after vundle stuff

set shiftwidth=4
set expandtab

set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

set incsearch  " Keep matching
set ignorecase
set smartcase  " Only lower: case insensitive; if any upper, case sensitive

"Have the title string show the path and name of the file.
let &titlestring = "vim: " . expand("%:p")
if &term == "screen"
    set t_ts=^[k
    set t_fs=^[\
endif
if &term == "screen" || &term == "xterm"
    set title
endif

"Reindent the whole file
map <F4> mzgg=G`z<CR> 
filetype plugin indent on  "Also required for vundle

"Turn on spell checking for .txt files
autocmd FileType notes setlocal spell
"Turn off annoying blue highlight of uncapitalized sentence start.
set spc=


"Toggle folds with F12, visual select and F12 to fold
set foldmethod=manual
inoremap <F12> <C-O>za 
nnoremap <F12> za
onoremap <F12> <C-C>za 
vnoremap <F12> zf

"Turn on line numbers and change their color. Add map to turn off.  set nu
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
nmap <C-N><C-N> :set invnumber<CR> 

"Programming abbreviations
abbr #i #include
abbr #d #define 

colorscheme oxeded

" augroup reload_vimrc " {
"     autocmd!
"     autocmd BufWritePost $MYVIMRC source $MYVIMRC
" augroup END " }
autocmd! BufWritePost .vimrc source %

set splitbelow
set splitright

"Highlights all instants of search, clear with space
set hlsearch
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR> 
"Custom per directory vim settings, for unusual indentations, perhaps.
if filereadable(".vim.custom")
    so .vim.custom
endif

"Make asm files use nasm stuff
au BufRead,BufNewFile *.asm set filetype=nasm

au BufRead,BufNewFile *.ml,*.mli compiler ocaml


""Remap movement between windows 
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j 
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l 
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j 
nmap <leader>k <C-w>k
nmap <leader>l <C-w>l 
""Remap window rearrangement 
nmap <C-m>h <C-w>H
nmap <C-m>j <C-w>J 
nmap <C-m>k <C-w>K
nmap <C-m>l <C-w>L 

nmap <leader>mh <C-w>H
nmap <leader>mj <C-w>J 
nmap <leader>mk <C-w>K
nmap <leader>ml <C-w>L 

" Fast window resizing with +/- keys (horizontal); / and * keys (vertical)
  map <kPlus> <C-W>+
  map <kMinus> <C-W>-
  map <kDivide> <c-w><
  map <kMultiply> <c-w>>

set so=7
nnoremap e 5<c-e> 
nnoremap k 5<c-y>

"Get rid of expandtab for Makefiles
autocmd FileType make set noexpandtab



set softtabstop=4

" Highlight the line the cursor is one
set cursorline

"Add tab completion to works
"imap <Tab> <C-N>
set wildmode=longest,list,full
set wildmenu

autocmd FileType ocaml setlocal shiftwidth=2 softtabstop=2
autocmd FileType c setlocal shiftwidth=4 softtabstop=4

set autoread

nmap ; :

nnoremap Y y$

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
autocmd FileType zsh              let b:comment_leader = '# '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Nede to add one here for Ocaml

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction


