" =================================================
" vimrc from Lawrence <lawrence.dingxl@gmail.com>
" =================================================

" ----------------------------------------
" Vundle {{{
" ----------------------------------------

set nocompatible " be iMproved
filetype off     " required!

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'
let g:vundle_default_git_proto = 'https'
nmap <Leader>bi :BundleInstall<CR>
nmap <Leader>bu :BundleInstall!<CR> " Because this also updates
nmap <Leader>bc :BundleClean<CR>
"}}}
" ----------------------------------------
" Regular Vim Configuration (No Plugins Needed) {{{
" ----------------------------------------
" Color {{{
" ---------------
" jellybeans.vim colorscheme tweaks {{{
" ---------------
Bundle 'nanotech/jellybeans.vim'
" Make cssAttrs (center, block, etc.) the same color as units
hi! link cssAttr Constant
"}}}
" Theme{{{
set t_Co=256
colorscheme jellybeans
"}}}
"}}}
" Backups {{{
" ---------------
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
"}}}
" Language & encoding{{{
" ---------------
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
set fileencoding=chinese
set langmenu=zh_CN.UTF-8  " chinese menu
"set helplang=cn           " chinese helpdoc
"}}}
" Font {{{
" ---------------
if has('win32') || has('win64')
  set guifont=DejaVu_Sans_Mono_for_Powerline:h10
  set guifontwide=Yahei_Mono:h10:cGB2312
else
  set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10
  set guifontwide=WenQuanYi\ Zen\ Hei\ Mono\ 10
endif
"}}}
" UI {{{
" ---------------
set shortmess=atI  " less thing show at startup
set ruler          " Ruler on
set nu             " Line numbers on
set nowrap         " Line wrapping off
set laststatus=2   " Always show the statusline
set cmdheight=2    " Make the command area two lines high
if exists('+colorcolumn')
  set colorcolumn=80 " Color the 80th column differently
endif
"}}}
" GVIM{{{
" ---------------
set guioptions-=T " Toolbar
set guioptions-=m " Menubar
set guioptions-=L " hide left scroll
set guioptions-=b " hide bottom scroll
set showtabline=0 " hide tab
"}}}
" Behaviors {{{
" ---------------
"source $VIMRUNTIME/mswin.vim
filetype plugin indent on  " Automatically detect file types. (must turn on after Vundle)
syntax enable
syntax on
set autoread           " Automatically reload changes if detected
set autochdir          " Automatically change directory to current directory
set wildmenu           " Turn on WiLd menu
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set autowrite          " Writes on make/shell commands
set timeoutlen=350     " Time to wait for a command (after leader for example)
set foldlevelstart=99  " Remove folds
set formatoptions=crql
set iskeyword+=$,@     " Add extra characters that are valid parts of variables
"}}}
" Text Format {{{
" ---------------
set tabstop=4
set backspace=2   " Delete everything with backspace
set shiftwidth=4  " Tabs under smart indent
set softtabstop=4 " backspace can delete 2 space a time
set cindent
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,1s:1s
set autoindent
set smartindent
set smarttab
set expandtab
"}}}
" Searching {{{
" ---------------
set ignorecase
set smartcase
set infercase
set incsearch
set hlsearch
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache,*.class
"}}}
" Visual {{{
" ---------------
set showmatch   " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink
set list        " show tab and trail
set listchars=tab:▸\ ,trail:¬
"Invisible character colors
highlight NonText guifg=#444444 guibg=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE
highlight SpecialKey guifg=#444444 guibg=NONE gui=NONE ctermfg=238 ctermbg=NONE cterm=NONE

"set cursorcolumn
"set cursorline

"if &term=="xterm"
  "" solid underscore
  "let &t_SI .= "\<Esc>[3 q"
  "" solid block
  "let &t_EI .= "\<Esc>[1 q"
  "" 1 or 0 -> blinking block
  "" 3 -> blinking underscore
  "" change cursor shape in gnome-terminal
  "au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
  "au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
  "au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"elseif &term=="rxvt-unicode-256color"
  "" change cursor color in urxvt
  "let &t_SI = "\<Esc>]12;red\x7"
  "let &t_EI = "\<Esc>]12;grey80\x7"
"endif
"}}}
" Sounds {{{
" ---------------
set noerrorbells
set novisualbell
set t_vb=
"}}}
" Mouse {{{
" ---------------
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes
"}}}
" Better complete options to speed it up {{{
set complete=.,w,b,u,U
"}}}
" Folding{{{
" ---------------
set foldenable
set foldmethod=marker
set foldlevel=0
set foldlevelstart=0
nnoremap <Space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
let g:xml_syntax_folding = 1
autocmd FileType xml set foldmethod=syntax
"}}}
" Path setting {{{
set path+=;,include;inc;
"}}}
" Copy(paste) to(from) system clip board {{{
"Use clipboard '+' can share context with other programs
:vmap <C-c> "+y
:nmap <C-v> "+p
"Use clipboard '*' can share context between windows and ubuntu through
"synergy
":vmap <C-c> "*y
":nmap <C-v> "*p
"}}}
"}}}
" ----------------------------------------
" Platform Specific Configuration {{{
" ----------------------------------------
if has('win32') || has('win64')
  " Set height and width on Windows
  set lines=60
  set columns=120

  " Windows has a nasty habit of launching gVim in the wrong working directory
  "cd ~
elseif has('gui_macvim')
  " MacVim

  " Custom Menlo font for Powerline
  " From: https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts
  set guifont=Menlo\ for\ Powerline:h12

  " Hide Toolbar in MacVim
  if has("gui_running")
    set guioptions=egmrt
  endif

  " Use option (alt) as meta key.
  set macmeta
endif
"}}}
" ----------------------------------------
" Bindings {{{
" ----------------------------------------
" Set leader to , {{{
" Note: This line MUST come before any <leader> mappings
let mapleader=","
"}}}
" Fixes common typos {{{
command W w
command Q q
command WQ wq
command Wq wq
" }}}

" use ; for : {{{
nnoremap ; :
vnoremap ; :
"}}}

" Make line completion easier {{{
imap <C-l> <C-x><C-l>
"}}}
" Show highlighting groups for current word {{{
nmap <C-S-P> : call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
"}}}
" Leader Commands {{{
" ---------------

" Toggle spelling mode with ,s
nmap <silent> <leader>s :set spell!<CR>
" Edit vimrc with ,v
nmap <silent> <leader>v :e ~/.vim/vimrc<CR>

" Window Movement
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
"}}}
" Auto Commands {{{
" ----------------------------------------
if has("autocmd")
  " No formatting on o key newlines
  autocmd BufNewFile,BufEnter * set formatoptions-=o

  " No more complaining about untitled documents
  autocmd FocusLost silent! :wa

  " When editing a file, always jump to the last cursor position.
  " This must be after the uncompress commands.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line ("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
  " vim -b : edit binary using xxd-format!
  augroup Binary
    "au!
    "au BufReadPre  *.bin let &bin=1
    "au BufReadPost *.bin if &bin | %!xxd
    "au BufReadPost *.bin set ft=xxd | endif
    "au BufWritePre *.bin if &bin | %!xxd -r
    "au BufWritePre *.bin endif
    "au BufWritePost *.bin if &bin | %!xxd
    "au BufWritePost *.bin set nomod | endif
  augroup END
endif
"}}}
" <s-k> to open help{{{
set keywordprg=":help"
"}}}
" Quickfix Commands {{{
nnoremap ao :botright copen<cr>
nnoremap ap :cclose<cr>
nnoremap [q :cprev<cr>
nnoremap ]q :cnext<cr>
"}}}
"}}}
" ----------------------------------------
" Plugin Configuration {{{
" ----------------------------------------
" Tagbar{{{
" ---------------
Bundle 'majutsushi/tagbar'
let g:tagbar_width = 30
nnoremap <leader>t :TagbarToggle<cr>
"}}}
" ctags {{{
" ---------------
set tags=tags;,~/_vimtags  "; here let vim go to up folds until find one tags file
if has('win32') || has('win64')
  nnoremap ec :!start ctags -R --fields=+l --c-kinds=+pl --c++-kinds=+pl .<cr>
else
  nnoremap ec :!ctags -R --fields=+l --c-kinds=+pl --c++-kinds=+pl .<cr>
endif
"}}}
" cscope {{{
if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,f-
  endif
  set csto=0

  " auto load cscope.out file (TODO:not work in window now)
  function! LoadCscope()
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
      echo db
      let path = strpart(db, 0, match(db, "/cscope.out$"))
      set nocscopeverbose " suppress 'duplicate connection' error
      exe "cs add " . db . " " . path
      set cscopeverbose
    endif
  endfunction
  "au BufEnter /* call LoadCscope()
autocmd FileType c,cpp call LoadCscope()
  " short command
  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  nmap fs :cs find s <C-R>=expand("<cword>")<CR><CR>:botright copen<CR>
  nmap fg :cs find g <C-R>=expand("<cword>")<CR><CR>
  nmap fc :cs find c <C-R>=expand("<cword>")<CR><CR>:botright copen<CR>
  nmap ft :cs find t <C-R>=expand("<cword>")<CR><CR>:botright copen<CR>
  nmap fe :cs find e <C-R>=expand("<cword>")<CR><CR>:botright copen<CR>
  nmap ff :cs find f <C-R>=expand("<cfile>")<CR><CR>:botright copen<CR>
  nmap fi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:botright copen<CR>
  nmap fd :cs find d <C-R>=expand("<cword>")<CR><CR>:botright copen<CR>
endif
"}}}
" TagHighlight {{{
" ---------------
"Bundle 'abudden/TagHighlight'
nnoremap ut :UpdateTypesFile <cr>
"nnoremap th :UpdateTypesFile <cr>
 "colors for Taghighlight {{{
hi Class guifg=#800080 guibg=NONE gui=NONE ctermfg=90 ctermbg=NONE cterm=NONE
hi DefinedName guifg=#EE82EE guibg=NONE gui=NONE ctermfg=175 ctermbg=NONE cterm=NONE
hi Function guifg=#007777 guibg=NONE gui=NONE ctermfg=30 ctermbg=NONE cterm=NONE
hi EnumerationValue guifg=#C000C0 guibg=NONE gui=NONE ctermfg=164 ctermbg=NONE cterm=NONE
hi EnumerationName guifg=#FF22FF guibg=NONE gui=NONE ctermfg=201 ctermbg=NONE cterm=NONE
hi Member guifg=#A9A9A9 guibg=NONE gui=NONE ctermfg=145 ctermbg=NONE cterm=NONE
hi Structure guifg=#FF8080 guibg=NONE gui=NONE ctermfg=210 ctermbg=NONE cterm=NONE
hi Type guifg=#FF8000 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
hi Union guifg=#808080 guibg=NONE gui=NONE ctermfg=102 ctermbg=NONE cterm=NONE
hi GlobalVariable guifg=#df5f87 guibg=NONE gui=NONE ctermfg=168 ctermbg=NONE cterm=NONE
hi LocalVariable guifg=#AAA14C guibg=NONE gui=NONE ctermfg=143 ctermbg=NONE cterm=NONE
hi GlobalConstant guifg=#df5f87 guibg=NONE gui=NONE ctermfg=168 ctermbg=NONE cterm=NONE
hi cPreCondit guifg=#ff8700 guibg=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
hi cTODO guifg=#ff0000 guibg=#dfff00 gui=NONE ctermfg=196 ctermbg=190 cterm=NONE
"}}}
"}}}
" Xterm-color-table {{{
Bundle 'guns/xterm-color-table.vim'
"}}}
"" vimproc {{{
"" ---------------
"Bundle 'Shougo/vimproc'
""}}}
" vimshell {{{
" ---------------
Bundle 'Shougo/vimshell'
"}}}
" Neocomplete {{{
" ---------------
Bundle 'Shougo/neocomplete'
"Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable omni completion.
autocmd FileType c,cpp setlocal omnifunc=ccomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"}}}
" Unite {{{
" ---------------
Bundle 'Shougo/unite.vim'
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight=10
"}}}
" SuperTab {{{
" ---------------
"Bundle 'ervandew/supertab'
"let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
"let g:SuperTabMappingBackward = '<c-p>'
"}}}
" clang_complete {{{
" ---------------
"Bundle 'Rip-Rip/clang_complete'
"set completeopt=menu,menuone,longest
"set pumheight=15
"let g:clang_complete_auto=1
"let g:clang_use_library=1
"let g:clang_library_path="/usr/lib/llvm/"
"let g:clang_user_options='|| exit 0'
"}}}
" Syntastic {{{
" ---------------
"Bundle 'scrooloose/syntastic'
let g:syntastic_auto_loc_list=1
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': [''],
            \ 'passive_filetypes': [''] }
nnoremap sc :SyntasticCheck<cr>
"}}}
" NERDTree {{{
" ---------------
Bundle 'scrooloose/nerdtree'
let g:NERDTreeDirArrows=0
nnoremap <leader>e :NERDTreeToggle<CR>
"}}}
" Indent Line {{{
" ---------------
Bundle 'Yggdroot/indentLine'
"}}}
" Tabular {{{
" ---------------
Bundle 'godlygeek/tabular'
nmap <Leader>t= :Tabularize /=<CR>
vmap <Leader>t= :Tabularize /=<CR>
nmap <Leader>t: :Tabularize /:\zs<CR>
vmap <Leader>t: :Tabularize /:\zs<CR>
nmap <Leader>t, :Tabularize /,\zs<CR>
vmap <Leader>t, :Tabularize /,\zs<CR>
nmap <Leader>t> :Tabularize /=>\zs<CR>
vmap <Leader>t> :Tabularize /=>\zs<CR>
nmap <Leader>t- :Tabularize /-<CR>
vmap <Leader>t- :Tabularize /-<CR>
nmap <Leader>t" :Tabularize /"<CR>
vmap <Leader>t" :Tabularize /"<CR>
"}}}
" Fugitive {{{
" ---------------
Bundle 'tpope/vim-fugitive'
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gp :Git push<CR>
" Mnemonic, gu = Git Update
nmap <Leader>gu :Git pull<CR>
nmap <Leader>gd :Gdiff<CR>
" Exit a diff by closing the diff window
nmap <Leader>gx :wincmd h<CR>:q<CR>
"}}}
" ctrlp.vim {{{
" ---------------
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<leader>,'
let g:ctrlp_cmd = 'CtrlP'
" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10

nmap <leader>. :CtrlPClearCache<cr>:CtrlP<cr>
nmap <leader>l :CtrlPLine<cr>
nmap <leader>b :CtrlPBuff<cr>
nmap <leader>m :CtrlPBufTag<cr>
nmap <leader>M :CtrlPBufTagAll<cr>
let g:ctrlp_clear_cache_on_exit = 1
" ctrlp leaves stale caches behind if there is another vim process runnin
" which didn't use ctrlp. so we clear all caches on each new vim invocation
cal ctrlp#clra()
" jump to buffer in the same tab if already open
let g:ctrlp_switch_buffer = 1
" if in git repo - use git file listing command, should be faster
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files --exclude-standard -cod']

" open multiple files with <c-z> to mark and <c-o> to open. v - opening in
" vertical splits; j - jump to first open buffer; r - open first in current
buffer
let g:ctrlp_open_multiple_files = 'vjr'

let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'mixed', 'line']
"}}}
" airline {{{
" ---------------
Bundle 'bling/vim-airline'
let g:airline_theme="dark"
" old vim-powerline symbols
let g:airline_symbols = {}
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '⮀'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#fnamemod = ':p:t'
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
"}}}
" colorv {{{
" ---------------
Bundle 'Rykka/colorv.vim'
let g:colorv_has_python=0
"}}}
" vim-surround {{{
" ---------------
Bundle 'tpope/vim-surround'
"}}}
" nerdcommenter {{{
" ---------------
Bundle 'scrooloose/nerdcommenter'
"}}}
" delimitMate {{{
" ---------------
Bundle 'Raimondi/delimitMate'
"}}}
" Gundo {{{
" ---------------
Bundle 'sjl/gundo.vim'
nnoremap au :GundoToggle<CR>
"}}}
" gitv {{{
" ---------------
Bundle 'gregsexton/gitv'
"}}}
" vim-gitgutter {{{
" ---------------
"Bundle 'airblade/vim-gitgutter'
"}}}
" vim-signify {{{
" ---------------
Bundle 'mhinz/vim-signify'
"}}}
" fzf {{{
" ---------------
Bundle 'junegunn/fzf'
nmap <silent> <leader>f  :FZF ~<cr>
"}}}
"}}}
" ----------------------------------------
" Syntax  {{{
Bundle 'vim-ruby/vim-ruby'
Bundle 'tsaleh/vim-tmux'
Bundle 'Puppet-Syntax-Highlighting'
Bundle 'JSON.vim'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vitaly/vim-syntastic-coffee'
Bundle 'vim-scripts/jade.vim'
Bundle 'wavded/vim-stylus'
Bundle 'VimClojure'
Bundle 'skammer/vim-css-color'
Bundle 'xml.vim'
"}}}

" Compatible with windows shortcuts
" Syntax  {{{
  "source $VIMRUNTIME/mswin.vim
  "behave mswin
"}}}
" ----------------------------------------
" transparent bg in vim
hi Normal ctermbg=NONE

autocmd FileType cpp setlocal tabstop=3 shiftwidth=3 softtabstop=3
