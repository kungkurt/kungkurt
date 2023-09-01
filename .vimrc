set nocompatible
filetype off
set encoding=utf-8
set rtp+=~/.vim/bundle/Vundle.vim
let mapleader = ","
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kergoth/vim-bitbake'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'alvan/vim-closetag'
Plugin 'svg.vim'
Plugin 'suoto/vim-hdl'
Plugin 'jasonshell/vim-svg-indent'
Plugin 'posva/vim-vue'
call vundle#end()
filetype plugin indent on

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" YCM Java
let g:syntastic_java_checkers=[]
let g:EclimFileTypeValidate=0

" Nerd tree
let NERDTreeIgnore=['\.pyc$', '\~$', '\.bak$', '\.qar$', '\.qpf$', '\.bsf$']
map <C-n> :NERDTreeToggle<CR>

" Unknown file
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Python
let python_highlight_all=1
au BufNewFile,BufRead *.py set tabstop=4
au BufNewFile,BufRead *.py set softtabstop=4
au BufNewFile,BufRead *.py set shiftwidth=4
au BufNewFile,BufRead *.py set expandtab
au BufNewFile,BufRead *.py set autoindent
au BufNewFile,BufRead *.py set fileformat=unix

" Kivy kv
au BufNewFile,BufRead *.kv set tabstop=4
au BufNewFile,BufRead *.kv set softtabstop=4
au BufNewFile,BufRead *.kv set shiftwidth=4
au BufNewFile,BufRead *.kv set expandtab
au BufNewFile,BufRead *.kv set autoindent

" JavaScript
au BufNewFile,BufRead *.js set tabstop=2
au BufNewFile,BufRead *.js set softtabstop=2
au BufNewFile,BufRead *.js set shiftwidth=2

" SCSS
au BufNewFile,BufRead *.scss set tabstop=2
au BufNewFile,BufRead *.scss set softtabstop=2
au BufNewFile,BufRead *.scss set shiftwidth=2

" CSS
au BufNewFile,BufRead *.css set tabstop=2
au BufNewFile,BufRead *.css set softtabstop=2
au BufNewFile,BufRead *.css set shiftwidth=2

" HTML
au BufNewFile,BufRead *.html set tabstop=2
au BufNewFile,BufRead *.html set softtabstop=2
au BufNewFile,BufRead *.html set shiftwidth=2

" SVG
au BufNewFile,BufRead *.svg set tabstop=2
au BufNewFile,BufRead *.svg set softtabstop=2
au BufNewFile,BufRead *.svg set shiftwidth=2

" C
au BufRead,BufNewFile *.c,*.h set expandtab
au BufRead,BufNewFile *.c,*.h set tabstop=4
au BufRead,BufNewFile *.c,*.h set shiftwidth=4
au BufRead,BufNewFile *.c,*.h set autoindent
au         BufNewFile *.c,*.h set fileformat=unix
au BufRead,BufNewFile *.c,*.h let b:comment_leader = '/* '

" VHDL
au BufRead,BufNewFile *.vhd,*.vht,*.vho set filetype=vhdl
au BufRead,BufNewFile *.vhd,*.vht,*.vho set expandtab
au BufRead,BufNewFile *.vhd,*.vht,*.vho set tabstop=2
au BufRead,BufNewFile *.vhd,*.vht,*.vho set softtabstop=2
au BufRead,BufNewFile *.vhd,*.vht,*.vho set shiftwidth=2
au BufRead,BufNewFile *.vhd,*.vht,*.vho set autoindent
au BufRead            *.vhd,*.vht,*.vho map <C-p> :!quartus_pgmw<CR>
au BufRead            *.vhd,*.vht,*.vho map <C-t> :!quartus_staw<CR>
au BufRead            *.vhd,*.vht,*.vho map <C-s> :!quartus_stpw<CR>
au BufRead            *.vhd,*.vht,*.vho map <C-e> :!eclipse-nios2<CR>
"au BufRead,BufNewFile *.vhd,*.vht,*.vho match BadWhitespace /^\t\+/
"au BufRead,BufNewFile *.vhd,*.vht,*.vho match BadWhitespace /\s\+$/

" TCL
au BufRead,BufNewFile *.tcl,*.qpf,*.sdc,*.do set filetype=tcl
au BufRead,BufNewFile *.tcl,*.qpf,*.sdc,*.do set syntax=tcl
au BufRead,BufNewFile *.tcl,*.qpf,*.sdc,*.do set expandtab
au BufRead,BufNewFile *.tcl,*.qpf,*.sdc,*.do set autoindent
au BufRead,BufNewFile *.tcl,*.qpf,*.sdc,*.do set softtabstop=2
au BufRead,BufNewFile *.tcl,*.qpf,*.sdc,*.do set shiftwidth=2
au BufRead,BufNewFile *.tcl,*.qpf,*.sdc,*.do set tabstop=2

" YAML
au BufNewFile,BufRead *.yaml,*.yml set filetype=yaml
au BufNewFile,BufRead *.yaml,*.yml set tabstop=2
au BufNewFile,BufRead *.yaml,*.yml set softtabstop=2
au BufNewFile,BufRead *.yaml,*.yml set shiftwidth=2
au BufNewFile,BufRead *.yaml,*.yml set autoindent
au BufNewFile,BufRead *.yaml,*.yml set expandtab

" Java
au BufNewFile,BufRead *.java set tabstop=4
au BufNewFile,BufRead *.java set softtabstop=4
au BufNewFile,BufRead *.java set shiftwidth=4
au BufNewFile,BufRead *.java set autoindent
au BufNewFile,BufRead *.java set expandtab

" Bash
au BufNewFile,BufRead *.sh,*.bash set tabstop=4
au BufNewFile,BufRead *.sh,*.bash set softtabstop=4
au BufNewFile,BufRead *.sh,*.bash set shiftwidth=4
au BufNewFile,BufRead *.sh,*.bash set autoindent
au BufNewFile,BufRead *.sh,*.bash set expandtab

" set theme
if has('gui_running')
	set background=dark
	colorscheme solarized
else
	colorscheme zenburn
endif
call togglebg#map("<F5>")

" extra stuff
syntax on
set nu
set backspace=2
set clipboard=unnamed
