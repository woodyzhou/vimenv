" ========== Vim Basic Settings ============="
set nocompatible              " be iMproved
syn on
syntax enable
colorscheme molokai
filetype off
call pathogen#infect()
call pathogen#helptags()
Helptags
filetype plugin indent on

" Make vim incompatbile to vi.
set nocompatible
set modelines=0

"TAB settings.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noexpandtab
set smarttab

" More Common Settings.
set encoding=utf-8
set scrolloff=3
" set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell

set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

set number
set numberwidth=5
set relativenumber
function! ToggleNumbersOn()
    set nonumber!
    set relativenumber
endfunction
function! ToggleRelativeOn()
    set relativenumber
    set number
endfunction
function! ToggleRelativeOff()
    set norelativenumber
    set number
endfunction
function! NumbersToggle()
    set nonumber!
    set norelativenumber!
endfunction
function! ListToggle()
	set nolist!
endfunction

nnoremap <F2> :call NumbersToggle()<cr>
vnoremap <F2> :call NumbersToggle()<cr>
vnoremap <F4> :call ListToggle()<cr>
nnoremap <F4> :call ListToggle()<cr>

" Make pasting done without any indentation break."
set pastetoggle=<F3>

autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOff()
autocmd InsertEnter * call ToggleRelativeOff()
autocmd InsertLeave * call ToggleRelativeOn()

set shell=/bin/bash
set lazyredraw
set matchtime=3

"Changing Leader Key
let mapleader = "\<space>"

set dictionary=/usr/share/dict/words

if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"
map <silent><C-v> :set paste<CR>o<esc>"*]p:set nopaste<cr>"

" Make Vim able to edit corntab fiels again.
set backupskip=/tmp/*,/private/tmp/*"


"Settings for Searching and Moving
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <tab> %
vnoremap <tab> %
nnoremap <F5> :noh<cr>

" Make Vim to handle long lines nicely.
set wrap
set textwidth=100
set formatoptions=qrn1
set colorcolumn=100

" Naviagations using keys up/down/left/right
" Disabling default keys to learn the hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap j gj
nnoremap k gk

set showbreak=↪\
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Rope settings."
" inoremap <leader>j <ESC>:RopeGotoDefinition<cr>

" Get Rid of stupid Goddamned help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Map : to ; also in command mode.
"nnoremap ; :

" Set vim to save the file on focus out.
au FocusLost * :wa

" Working with split screen nicely
" Resize Split When the window is resized"
au VimResized * :wincmd =


" Wildmenu completion "
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"


"Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END

augroup filetypedetect
      au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
      au BufReadPost *.scala set syntax=scala
			au BufNewFile,BufRead *.hql set filetype=hive expandtab
			au BufNewFile,BufRead *.q set filetype=hive expandtab
augroup END


set nobackup
set nowb
set noswapfile

" set cursorline
" only show cursorline in current active buffer
" au BufEnter * setlocal cursorline
" au BufLeave * setlocal nocursorline
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

augroup CursorColumn
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
    au WinLeave * setlocal nocursorcolumn
augroup END

" =========== END Basic Vim Settings ===========


" ========== Plugin Settings =========="
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-easymotion'
Plugin 'tomtom/tcomment_vim'
Bundle 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'shougo/vimproc.vim'
Bundle 'Shougo/neocomplete'
Bundle 'Shougo/neocomplcache'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/neoyank.vim'
Plugin 'Shougo/unite.vim'
Plugin 'majutsushi/tagbar'
" Plugin 'brookhong/cscope.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'derekwyatt/vim-scala'
Plugin 'valloric/vim-indent-guides'
Plugin 'raimondi/delimitmate'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ntpeters/vim-better-whitespace'

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  " imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  " imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:unite_source_history_yank_enable = 1
let g:unite_source_history_yank_limit=10000
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom_source('file,file_rec,file_rec/async,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ '\.bundle/',
      \ '\.rubygems/',
      \ 'target/',
      \ 'vendor/',
      \ ], '\|'))
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
nnoremap <leader>w :<C-u>Unite -no-split tab<cr>

" Mapping to NERDTree
" nnoremap <C-n> :NERDTreeToggle<cr>
nnoremap <C-n> :NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$']
let g:NERDTreeWinSize =  60

set tags=tags;/
let g:scala_sort_across_groups=1
let g:scala_first_party_namespaces='\(com.ebay.bpe\|controllers\|views\|models\|util\|de.\)'

nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_scala = {
    \ 'ctagstype' : 'scala',
    \ 'sro'       : '.',
    \ 'kinds'     : [
      \ 'p:packages',
      \ 'T:types:1',
      \ 't:traits',
      \ 'o:objects',
      \ 'O:case objects',
      \ 'c:classes',
      \ 'C:case classes',
      \ 'm:methods',
      \ 'V:values:1',
      \ 'v:variables:1'
    \ ]
		\ }

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:neomru#file_mru_ignore_pattern =
      \'\~$\|\.\%(o\|exe\|dll\|bak\|zwc\|pyc\|sw[po]\)$'.
      \'\|\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)'.
      \'\|^\%(\\\\\|/mnt/\|/temp/\|/tmp/\|\%(/private\)\=/var/folders/\)'.
      \'\|\%(^\%(fugitive\)://\)'.
      \'\|\%(^\%(term\)://\)'

" neocomplete settings
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

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
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType scala setlocal omnifunc=scalacomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete@=#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
" let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" enable Delimite Mate
let delimitMate_expand_cr = 1

" settings for vim-indent-guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

nnoremap <F6> :IndentGuidesToggle<cr>


" " cscope.vim settings
" let g:cscope_ignored_dir = 'node_modules$\|dist$\|target$'
" let g:cscope_interested_files = '\.c$\|\.cpp$\|\.h$\|\.hpp\|\.java|.\scala'
"
" nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
" nnoremap <leader>l :call ToggleLocationList()<CR>
"
" " s: Find this C symbol
" nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" " g: Find this definition
" nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" " d: Find functions called by this function
" nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" " c: Find functions calling this function
" nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" " t: Find this text string
" nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" " e: Find this egrep pattern
" nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" " f: Find this file
" nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" " i: Find files #including this file
" nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>

function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter * call LoadCscope()

" =========== END Plugin Settings =========="
