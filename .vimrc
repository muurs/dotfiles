" General --------------------------------------- {{{

" load local .vimrc files
set exrc
set secure

" Import settings from ftplugin
filetype plugin on

" Pathogen
execute pathogen#infect()

" Necessary for lots of cool vim things
"set nocompatible

" sets how many lines of history vim has to remember
set history=1000

" automatically read file when it is changed from the outside
set autoread

" make backspace work as expected
" set backspace=indent,eol,start

:let mapleader = ","
:let maplocalleader = ","
" }}}

" vim user interface --------------------------- {{{

" turn on wild menu
set wildmenu

" ignore compiled files
set wildignore=*.o,*~,*.pyc

" always show current position
set ruler

" set update delay to 250ms
set updatetime=250

" ignore case when searching
set ignorecase

" makes search act like search in modern browsers
set incsearch

" show matching braces when cursor over them
set showmatch

" highlight search reults
set hlsearch

" disable highlight when leader<cr> is pressed
map <silent> <leader><cr> :noh<cr>

noremap <C-j> <c-W>j
noremap <C-k> <c-W>k
noremap <C-h> <c-W>h
noremap <C-l> <C-W>l
" }}}

" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Text, tab and indent {{{
" set tabstop rules
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" auto-indentation
"set ai

" highlight current line
"set cursorline

" }}}

" Statusline {{{
" Status Line
set ls=2					" show status line
set statusline=%.40F\ 		" path to file
set statusline+=%y\ 		" filetype of file
set statusline+=%h%m%r%w\   " flags
set statusline+=%=			" switch to right side
set statusline+=(%l,%c)		" line and column
set statusline+=/	 		" separator
set statusline+=%L\ 		" total number of lines
set statusline+=%3.p			" percentage
" }}}

" Color and Fonts {{{
" draw vertical bar to see line width
syntax enable

set colorcolumn=120
highlight ColorColumn ctermbg=darkgray

" set color scheme PaperColor
set t_Co=256
let g:PaperColor_Dark_Override = { 'background' : '#000000', 'cursorline' : '#abcdef', 'matchparen' : '#3a3a3a', 'comment' : '#5f875f' }
let g:PaperColor_Light_Override = { 'background' : '#abcdef', 'cursorline' : '#dfdfff', 'matchparen' : '#d6d6d6' , 'comment' : '#8e908c' }
set background=dark
colorscheme PaperColor
" }}}

" General Mappings {{{
" Uppercase current word in insert mode
noremap <c-u> <esc>viwU<esc>ea

" Edit and save current vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" move vertically by visual line -- won't skip over wrapped lines
nnoremap j gj
nnoremap k gk

" move in insert mode
"imap <C-h> <C-o>h
"imap <C-j> <C-o>j
"imap <C-k> <C-o>k
"imap <C-l> <C-o>l

" <Leader>% - Search and Replace Highlighted Text
vnoremap <Leader>% "hy:%s/<C-r>h//gc<left><left><left>

" Open definition in new tab (ctags)
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Toggle line numbers
noremap <F3> :set nonumber!<CR>


" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Surround current word in double quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" Open NerdTree
nnoremap <leader>n :NERDTree<cr>

" Open TagBar
nnoremap <leader>t :Tagbar<cr>

:imap kj <Esc>
:noremap <leader>w :w<cr>
:noremap <leader>q :q<cr>
" }}}

" Files, Backups & Undo{{{

" Turn backups off
set nobackup
set noswapfile
set nowb

" set undo history size
set history=1000

" persistent undo
if exists("&undodir")
    set undofile                " Save undo's after file closes
    set undodir=~/.vim/undo     " where to save undo histories
    set undolevels=1000         " How many undos
    set undoreload=10000        " number of lines to save for undo
endif

" }}}

