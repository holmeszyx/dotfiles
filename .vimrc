" autocmd BufWritePost $MYVIMRC source $MYVIMRC

" Plugins

set nocompatible
filetype off

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plug 'L9'

Plug 'altercation/vim-colors-solarized'

Plug 'vim-airline/vim-airline'

" auto-completion
Plug 'jayli/vim-easycomplete'
Plug 'SirVer/ultisnips'

let g:easycomplete_tab_trigger="<c-space>"

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" PlugInstall [name ...] [#threads]  Install plugins
" PlugUpdate [name ...] [#threads]  Install or update plugins
" PlugClean[!]  Remove unlisted plugins (bang version will clean without prompt)
" PlugUpgrade  Upgrade vim-plug itself
" PlugStatus  Check the status of plugins
" PlugDiff  Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path]  Generate script for restoring the current snapshot of the plugins

" Plugin sets

" YCM
" let g:ycm_key_invoke_completion = '<c-space>'

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

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"


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




