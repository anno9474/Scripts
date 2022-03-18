set nocompatible              " be Improved
filetype off                  " required!

" ### BASIC SETTINGS
let mapleader="_"

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set softtabstop=2
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
set hlsearch                      " activate search result highlighting
set wildmenu
set wildignore+=tags,doc,tmp,log
set ic                            " case insensitivity on
set number                        " set line-number
set laststatus=2                  " Always show status bar
set showcmd                       " show <leader>-commands
set timeoutlen=3000               " set length of leader timeout

set splitbelow                    " split opens below
set splitright                    " split opens right
set guioptions-=r                 " remove right-hand scroll bar
set guioptions-=L                 " remove left-hand scroll bar

set backupdir^=~/.vim/_backup//   " where to put backup files.
set directory^=~/.vim/_temp//     " where to put swap files.
"set colorcolumn=101               " color at sign 101

set t_Co=256
set term=xterm-256color
set termencoding=utf-8
set encoding=utf-8

set mouse+=a
set ttymouse=xterm2               " tmux knows the extended mouse mode
set noeol                         " no freakin' end of line

" ### VUNDLE
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'L9'
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ervandew/supertab'
Plugin 'flazz/vim-colorschemes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'junegunn/fzf'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'neomake/neomake'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'Xuyuanp/nerdtree-git-plugin'

call vundle#end()

filetype plugin indent on

" ### GRAPHICAL-SETTINGS
set guifont=Inconsolata\ for\ Powerline:h12
colorscheme atom
set listchars=nbsp:¬,extends:»,precedes:«,trail:•

syntax on

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

let g:syntastic_ruby_checkers          = ['rubocop', 'mri']
let g:syntastic_ruby_rubocop_exec      = '/Users/bwalter/.rbenv/shims/rubocop'

highlight ColorColumn ctermbg=darkgrey

" disable vim internal filebrowser
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" ### PLUGINS
" Gitgutter
let g:gitgutter_sign_added = '✭'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '◄'
let g:gitgutter_sign_removed_first_line = '◄'
let g:gitgutter_sign_modified_removed = '▼'
set updatetime=500

let g:gitgutter_override_sign_column_highlight = 0
" for vim
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow
" for mvim
highlight GitGutterAdd guifg=green
highlight GitGutterChange guifg=yellow
highlight GitGutterDelete guifg=red
highlight GitGutterChangeDelete guifg=yellow

" NerdTree
let g:NERDTreeShowHidden=1

" airline
"let g:airline_theme='powerlineish'
"let g:airline_powerline_fonts = 1
"let g:airline_skip_empty_sections = 1
"let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])

" neomake
"call neomake#configure#automake('nrw')
"let g:neomake_open_list = 2
"let g:neomake_python_enabled_makers = ['pylint']

" ### COMMANDS
command Pry :normal orequire 'pry'<CR>binding.pry<ESC>:w<CR>
command Pvry :normal o- binding.pry<ESC>:w<CR>
command Iry :normal orequire 'pry'<CR>it { binding.pry}<ESC>:w<CR>
command Deb :normal odebugger;<ESC>:w<CR>
command Break :normal obreakpoint()<ESC>:w<CR>

command -nargs=1 Node :edit nodes/dedirrs<args>.fuchs-gewuerze.local.json

autocmd BufWritePre * :%s/\s\+$//e
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd CursorHold * checktime
autocmd WinEnter * checktime

" ### KEY-MAPPING
map <C-F> :Ack<space>
map <C-T> :FZF<CR>
map <C-L> zl
map <C-H> zh

vnoremap Y "*y
nnoremap Y "*y

nnoremap <C-Up> :m-2<CR>
nnoremap <C-Down> :m+<CR>
inoremap <C-Up> <Esc>:m-2<CR>
inoremap <C-Down> <Esc>:m+<CR>
vnoremap <C-Up> :m '<-2<CR>gv=gv
vnoremap <C-Down> :m '>+1<CR>gv=gv
