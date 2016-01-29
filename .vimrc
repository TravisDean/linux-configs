"Vundle settings from the github
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

"Let Vundle managed vundle!
Plugin 'VundleVim/Vundle.vim'

"My bundles here:
"Bundle 'Valloric/YouCompleteMe'
Bundle 'sjl/gundo.vim'
nnoremap <F10> :GundoToggle<CR> 

"A smooth scrolling  plugin?
"Bundle 'terryma/vim-smooth-scroll'
"And associated bindings!
"noremap <silent> <c-u> :call smooth_scroll#up(&scroll/3, 2, 4)<CR> 
"noremap <silent> <c-e> :call smooth_scroll#down(&scroll/3, 2,4)<CR>
"noremap <silent> <c-u> :call smooth_scroll#up(&scroll*2, 0, 10)<CR> 
"noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
"TODO: Check out if those faster ones seem worth it

"Fix backspace back to the way it was, damn it
set backspace=indent,eol,start

"Bundle 'scrooloose/syntastic'
"let g:syntastic_mode_ap = {'more': 'active',
            "\ 'active_filetypes': [],
            "\ 'passive_filetypes': ['html'] }
"highlight SyntasticErrorSign guifg=white guibg=red

syntax on  "Had to add after vundle stuff

set shiftwidth=4
set expandtab

set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

set incsearch  " Keep matching
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

map <F5> :!python %:t<CR> 
"map <F6> :!make<CR>
"map <F7> :!make && ./a.out :t<CR> 
"map <F8> :!make && mono run.exe :t<CR>
"map <F9> :!./run :t<CR> 

"Some autoheaders, mainly for file types with comments deliminated by //
"autocmd bufnewfile *.* so /home/travis/configs/header.txt
"autocmd bufnewfile *.* exe "1," . 9 . "g/File Name :.*/s//File Name : " .expand("%")
"autocmd bufnewfile *.* exe "1," . 9 . "g/Creation Date :.*/s//Creation Date : " .strftime("%a %b %d %Y")
"autocmd Bufwritepre,filewritepre *.*, execute "normal mz"
"autocmd Bufwritepre,filewritepre *.*, exe "1," . 9 . "g/File Name :.*/s/File Name :.*/File Name : " .expand("%")."/e"
"autocmd Bufwritepre,filewritepre *.*, exe "1," . 9 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%a %b %d %Y %T")."/e"
"autocmd bufwritepost,filewritepost *.*, execute "normal `z"

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

colorscheme evening

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

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


""Remap movement between windows 
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j 
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l 
""Remap window rearrangement 
nmap <C-m>h <C-w>H
nmap <C-m>j <C-w>J 
nmap <C-m>k <C-w>K
nmap <C-m>l <C-w>L 
"Get rid of expandtab for Makefiles
autocmd FileType make set noexpandtab

"Set some statusline stuff
set laststatus=2

"messan's
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset


set softtabstop=4

" Highlight the line the cursor is one
set cursorline

"Add tab completion to works
"imap <Tab> <C-N>
set wildmode=longest,list,full
set wildmenu

autocmd FileType ocaml setlocal shiftwidth=2 softtabstop=2

nmap ; :
