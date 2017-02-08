" General {{{
:let maplocal = ","
" }}}

" Indentation and File Encoding {{{
" setlocal tabstop widths
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal noexpandtab

" use indentation of previous line
setlocal autoindent
" use intelligent indentation for C
setlocal smartindent


" set UTF-8 encoding
setlocal enc=utf-8
setlocal fenc=utf-8
setlocal termencoding=utf-8
" }}}

" Color & Highlighting {{{

" draw vertical bar to see line width
setlocal colorcolumn=120
highlight ColorColumn ctermbg=darkgray

setlocal t_Co=256
let b:PaperColor_Dark_Override = { 'background' : '#000000', 'cursorline' : '#abcdef', 'matchparen' : '#3a3a3a', 'comment' : '#5f875f' }
let b:PaperColor_Light_Override = { 'background' : '#abcdef', 'cursorline' : '#dfdfff', 'matchparen' : '#d6d6d6' , 'comment' : '#8e908c' }
syntax on
setlocal background=dark                                                                                                     
colorscheme PaperColor
" }}}

" Mist {{{
" turn on line numbers
setlocal number

" highlight matching braces
setlocal showmatch

" let $path.="src/include,/usr/inblude/AL,"

" fixes YouCompleteMe issues with tabs after auto-complete
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" }}}

" General Mappings {{{

" F2		Switch from .h to .c file and vice-versa
" C-F2		Open corresponding .h or .c file in vertical split buffer
noremap <buffer> <F2> :e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>
noremap <buffer> <C-F2> :vsp %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>


" }}}

" Build Mappings {{{
" F10		Build
" C-F10		Clean && Build
" F11		Debug Build
" C-F11		Clean && Debug Build
" F12		Create CTags file
noremap <buffer> <F10> :!clear && echo '*** Build ***' && make<CR>
noremap <buffer> <C-F10> :!clear && echo '*** Clean & Build ***' && make clean && make<CR>
noremap <buffer> <F11> :!clear && echo '*** Debug Build ***' && make debug<CR>
noremap <buffer> <C-F11> :!clear && echo '*** Clean & Debug Build ***' && make clean && make debug<CR>
noremap <buffer> <F12> :!clear && ./main<CR>
" }}}


