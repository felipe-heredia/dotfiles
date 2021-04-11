call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'hail2u/vim-css3-syntax'
Plug 'gko/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'posva/vim-vue'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'editorconfig/editorconfig-vim'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'wakatime/vim-wakatime'

" Testes nos próximos dias
Plug 'bronson/vim-trailing-whitespace'
Plug 'isRuslan/vim-es6'
Plug 'zivyangll/git-blame.vim'
Plug 'luochen1990/rainbow'
Plug 'mileszs/ack.vim'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
call plug#end()

set hidden
set number
set relativenumber
set mouse=a
set inccommand=split

let mapleader="\<space>"
nnoremap <leader>; A;<esc>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

nnoremap <c-p> :files<cr>
nnoremap <c-f> :Ag<space>
nnoremap <c-a> <esc>ggVG<cr>
nnoremap <c-c> :%y+<cr>

let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetsDir = '~/config/nvim/UltiSnips'

" Ale Config
let g:ale_fixers = { 'vue': ['prettier'], 'javascript': ['prettier', 'eslint'] }
let b:ale_sign_error = '❌'
let b:ale_sign_warning = '⚠️'
nnoremap <leader>fx :ALEFix<cr>

let g:lightline = { 'colorscheme': 'wombat' }

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

nnoremap <leader>bl :<C-u>call gitblame#echo()<CR>

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points
