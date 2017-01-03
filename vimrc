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
Bundle 'Shougo/neocomplete'
Bundle 'Shougo/neocomplcache'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/neoyank.vim'
Plugin 'Shougo/unite.vim'
Plugin 'majutsushi/tagbar'
Plugin 'brookhong/cscope.vim'
Plugin 'junegunn/vim-easy-align'

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
nnoremap <C-n> :NERDTreeToggle<cr>
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
" =========== END Plugin Settings =========="
