call plug#begin('~/.local/share/nvim/plugged')
Plug 'machakann/vim-highlightedyank'
Plug 'jiangmiao/auto-pairs'
Plug 'sbdchd/neoformat'
"Plug 'github/copilot.vim'
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'neomake/neomake'
Plug 'machakann/vim-highlightedyank'
Plug 'christoomey/vim-tmux-navigator'
Plug 'pearofducks/ansible-vim'
Plug 'scrooloose/nerdcommenter'
call plug#end()
"neomake basic config, need to customize
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
" Custom tmux mapping for seemless movment through windows
let g:tmux_navigator_no_mappings = 1
"Nerdtree Opens to right side.
let g:NERDTreeWinPos = "right"

"Tmux navigation seemless and directional movement between 
"vim windows and tmux windows
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-0> :TmuxNavigatePrevious<cr>

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
imap jj <Esc>
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
colorscheme gruvbox
set background=dark
" setting basic airline theme
"let g:airline_theme=simple

let g:neomake_python_enabled_makers = ['pylint']
call neomake#configure#automake('nrwi', 500)

let g:highlightedyank_highlight_duration = 1000
hi HighlightedyankRegion cterm=reverse gui=reverse

set number
set mouse=a

hi HighlightedyankRegion cterm=reverse gui=reverse
" set highlight duration time to 1000 ms, i.e., 1 second
let g:highlightedyank_highlight_duration = 1000

let mapleader = "," " map leader to comma
set timeoutlen=1500  " Set timeout length to 500 ms

" Custom function
function! ToggleLineNumber()
	if v:version > 703
		set norelativenumber!
	endif
	set nonumber!
endfunction

" Custom shortcuts
map <leader>h :noh<CR>
map <leader>r :call ToggleLineNumber()<CR>
map <leader>t :NERDTreeToggle<CR>
map <leader>n :set number<CR>

" Alternative leader and shortcut
let mapleader="-"
map <leader>n :set nonumber<CR>

" Open nerdtree window on opening Vim and have cursor default to open file and
autocmd VimEnter * if argc() == 1 | NERDTree | wincmd p | else | NERDTree | endif
" not nerdtree
" Refresh the current folder if any changes
autocmd BufEnter NERD_tree_* | execute 'normal R'
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

"Reload the window if directory is changed
augroup DIRCHANGE
    au!
    autocmd DirChanged global :NERDTreeCWD
augroup END

"Close nerdtree automatically if it is theonly window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

