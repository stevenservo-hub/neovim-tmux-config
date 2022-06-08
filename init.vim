call plug#begin('~/.local/share/nvim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'sbdchd/neoformat'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'machakann/vim-highlightedyank'
Plug 'christoomey/vim-tmux-navigator'
Plug 'pearofducks/ansible-vim'
call plug#end()
call neomake#configure#automake('nrwi', 500)
let g:deoplete#enable_at_startup = 1
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"
let g:neomake_python_enabled_makers = ['pylint']

autocmd VimEnter * NERDTree
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
imap jj <Esc>
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

colorscheme gruvbox
set background=dark

let g:highlightedyank_highlight_duration = 1000
hi HighlightedyankRegion cterm=reverse gui=reverse

set number

