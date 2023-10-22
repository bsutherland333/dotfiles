""" Neovim Configuration """

" Setup plugins
call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    Plug 'chrisbra/csv.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'simnalamburt/vim-mundo'
    Plug 'simeji/winresizer'
call plug#end()

" Configure csv.vim
augroup filetype_csv
    autocmd!
    autocmd BufRead,BufWritePost *.csv :%ArrangeColumn!
    autocmd BufWritePre *.csv :%UnArrangeColumn
augroup END

" Allow pasting from OS clipboard
set clipboard+=unnamedplus

" Disable swap file, disabling simulanious-editing restriction
set noswapfile

" Modify unto tree behavior
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=10000
set undoreload=10000

" Show line numbers
set number

" Set indent behavior
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
