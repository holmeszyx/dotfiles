" autocmd BufWritePost $MYVIMRC source $MYVIMRC

" Plugins

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'altercation/vim-colors-solarized'

Plugin 'Valloric/YouCompleteMe'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

" Plugin sets

" YCM
let g:ycm_key_invoke_completion = '<c-space>'

" Put your non-Plugin stuff after this line

" custom settings

" Encoding
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1
set fileencoding=utf-8
set fencs=utf-8,chinese

set nu

" Change mapleader
let mapleader=","

"Optimize for fast terminal connections
set ttyfast

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent
set smartindent

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

" Enable mouse in all modes
set mouse=a

" Search
set hlsearch
set incsearch
set smartcase
set ignorecase

set cursorline
set showmatch
set wildmenu
set laststatus=2 " The value of this option influences when the last window will have a
"                  status line:
"                    0: never
"                    1: only if there are at least two windows
"                    2: always
highlight Cursor guifg=white guibg=red
highlight iCursor guifg=white guibg=red
set completeopt=menu
set ruler

" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" broken ycm
" set paste
set pastetoggle=<F10>

if !has("gui_running")
    inoremap <C-@> <C-x><C-o>
endif


" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>


filetype plugin indent on

" file property

autocmd FileType crontab setlocal nowritebackup
autocmd FileType make set noexpandtab

autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

autocmd BufRead,BufNewFile nginx.conf set ft=nginx
autocmd BufRead,BufNewFile */nginx*/*.conf set ft=nginx

" Treat .md files as Markdown
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown


" color scheme
syntax enable
set background=dark
let g:solarized_termcolors=256
" transparent background colorSchema
let g:solarized_termtrans=0	
colorscheme solarized




