
set exrc
set number
set ruler
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:<
set incsearch
set hlsearch
set nowrap
set showmatch
set whichwrap=h,l
set nowrapscan
set ignorecase
set smartcase
set hidden
set history=2000
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set helplang=en

nnoremap <Space>w  :<C-u>w<CR>
nnoremap <Space>q  :<C-u>q<CR>
nnoremap <Space>Q  :<C-u>q!<CR>

nnoremap ;  :
nnoremap :  ;
vnoremap ;  :
vnoremap :  ;

nnoremap <Space>h  ^
nnoremap <Space>l  $
nnoremap <Space>/  *<C-o>
nnoremap g<Space>/ g*<C-o>

autocmd FileType java,js,coffee,py,css,less,scss autocmd BufWritePre <buffer> :%s/\s\+$//e

"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'

NeoBundle 'Shougo/unite.vim'
let g:unite_source_history_yank_enable=1

nmap     <Space>u [unite]
nnoremap [unite]c :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]p :<C-u>Unite file_rec/git<CR>
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer file_mru<CR>
nnoremap <silent> [unite]r :<C-u>Unite<Space>register<CR>
nnoremap <silent> [unite]t :<C-u>Unite<Space>tab<CR>
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
nnoremap <silent> [unite]o :<C-u>Unite<Space>outline<CR>

"NeoBundle 'scrooloose/nerdtree'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'kchmck/vim-coffee-script'

NeoBundle 'bling/vim-airline'
set laststatus=2
let g:airline_theme='bubblegum'

NeoBundle 'tpope/vim-surround'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/vimfiler'
nnoremap <Space>e :VimFilerExplore -split -winwidth=30 -find -no-quit<CR>
nnoremap <Space>f :VimFiler<CR>
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'ujihisa/unite-colorscheme'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
"End NeoBundle Scripts-------------------------

syntax enable
set background=dark
colorscheme jellybeans
