""" Neovim Configuration """

" Setup plugins
call plug#begin("$XDG_CONFIG_HOME/nvim/plugged")
    " CSV formatting
    Plug 'chrisbra/csv.vim'
    " Undo tree
    Plug 'simnalamburt/vim-mundo'
    " Window resizor
    Plug 'simeji/winresizer'
    " Main theme
    Plug 'NLKNguyen/papercolor-theme'
    " Status bar
    Plug 'itchyny/lightline.vim'
    " LSP stuff
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    " Snippets
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'L3MON4D3/LuaSnip'
    " Git
    Plug 'airblade/vim-gitgutter'
    " Github Copilot
    Plug 'github/copilot.vim'
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
set number relativenumber

" Set indent behavior
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Keep cursor away from edges
set scrolloff=5

" Highlight current line
set cursorline

" Sets current theme
set background=dark
colorscheme PaperColor

" Save when window focus is lost
":au FocusLost * :wa

" Show whitespace
set list
set listchars=tab:>-,trail:⋅

" Disable mode bar, since status bar shows it
set noshowmode

" Set status bar theme
let g:lightline = {
      \ 'colorscheme': 'PaperColor',
      \ }

" Setup parameters for git plugins
set updatetime=100

" Source lua setup file (must be at end of file)
lua require('init')
