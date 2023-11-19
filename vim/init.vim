set number
set termguicolors
set updatetime=100

call plug#begin('~/.vim/plugged')
    Plug 'airblade/vim-gitgutter'
    Plug 'airblade/vim-rooter'
    Plug 'dense-analysis/ale'
    Plug 'honza/vim-snippets'
    Plug 'itchyny/lightline.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'joshdick/onedark.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'kassio/neoterm'
    Plug 'mbbill/undotree'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'sheerun/vim-polyglot'
    Plug 'SirVer/ultisnips'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
    Plug 'Yggdroot/indentLine'
call plug#end()

autocmd VimEnter * execute 'NERDTree'
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
let g:NERDTreeGitStatusUseNerdFonts = 1
let NERDTreeShowHidden = 1
if argc() == 0 || argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
    autocmd vimenter * NERDTree
else
    autocmd vimenter * NERDTree | wincmd p
endif

colorscheme onedark
let g:ale_fix_on_save = 1
let g:lightline = {'colorscheme': 'onedark'}
let g:neoterm_autoscroll=1
let g:neoterm_default_mod='belowright'
let g:neoterm_size=10

tnoremap <silent> <C-w> <C-\><C-n><C-w>
nnoremap <silent> <C-n> :TREPLSendLine<CR>j0
vnoremap <silent> <C-n> V:TREPLSendSelection<CR>'>j0

nmap <C-e> :NERDTreeToggle<CR>
nmap <C-p> :History<CR>
nmap <C-r> :UndotreeToggle<CR>
nmap s <Plug>(easymotion-overwin-f2)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction