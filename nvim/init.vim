"
"  ███████╗░██████╗
"  ██╔════╝██╔════╝     felipesuri
"  █████╗░░╚█████╗░			https://felipesuri.com
"  ██╔══╝░░░╚═══██╗     https://github.com/felipesuri
"  ██║░░░░░██████╔╝     https://gitlab.com/felipesuri
"  ╚═╝░░░░░╚═════╝░
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle For Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')
" @basics
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'} " Markdown Preview
Plug 'itchyny/lightline.vim'																			" LightLine
Plug 'luochen1990/rainbow' 																				" Rainbow
Plug 'dracula/vim', { 'as': 'dracula' }	 													" Dracula Theme

" @fileManagement

Plug 'editorconfig/editorconfig-vim'															" Editorconfig
Plug 'preservim/nerdtree'																					" NERDTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     								" Highlighting NERDTree
Plug 'mileszs/ack.vim'																						" Ack

" @lintersAndHelpers

Plug 'w0rp/ale'																										" ALE
Plug 'sheerun/vim-polyglot' 																			" Polyglot
Plug 'ncm2/ncm2'                     															" NCM2
Plug 'ncm2/ncm2-bufword'																					" NCM2 bufoword
Plug 'ncm2/ncm2-path'																							" NCM2 path
Plug 'roxma/nvim-yarp'																						" Yarp
Plug 'jiangmiao/auto-pairs'																				" Auto Pairs
Plug 'mattn/emmet-vim'																						" Emmet
Plug 'honza/vim-snippets'																					" Snippets
Plug 'bronson/vim-trailing-whitespace' 														" Trailing WhiteSpace
Plug 'zivyangll/git-blame.vim'																		" Git Blame

" @syntaxHighlightingAndColors

Plug 'hail2u/vim-css3-syntax' 																		" CSS3 Syntax
Plug 'gko/vim-coloresque'																					" Coloresque
Plug 'tpope/vim-haml'																							" HAML
Plug 'jelera/vim-javascript-syntax'																" Javacript Syntax
Plug 'othree/javascript-libraries-syntax.vim' 										" Javascript Libraries
Plug 'posva/vim-vue'																							" Vue
Plug 'leafOfTree/vim-vue-plugin'																	" Vue Plugin
Plug 'isRuslan/vim-es6'																						" ES6

" @others

Plug 'wakatime/vim-wakatime'																			" WakaTime
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
call plug#end()

" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" Ale Config
let g:ale_fixers = { 'vue': ['prettier'], 'javascript': ['prettier', 'eslint'] }
let b:ale_sign_error = '❌'
let b:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
nnoremap <leader>fx :ALEFix<cr>

" LightLine Config
let g:lightline = { 'colorscheme': 'dracula' }
set laststatus=2

" NERDTree Config
autocmd VimEnter * NERDTree
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

" Add shortcut for Blame
nnoremap <leader>bl :<C-u>call gitblame#echo()<CR>

" Vifm
map <Leader>vv :Vifm<CR>
map <Leader>vs :VsplitVifm<CR>
map <Leader>sp :SplitVifm<CR>
map <Leader>dv :DiffVifm<CR>
map <Leader>tv :TabVifm<CR>

" Vim-Instant Markdown
let g:instant_markdown_autostart = 0         " Turns off auto preview
let g:instant_markdown_browser = "surf"      " Uses surf for preview
map <Leader>md :InstantMarkdownPreview<CR>   " Previews .md file
map <Leader>ms :InstantMarkdownStop<CR>      " Kills the preview

" Vim Global Configs

let mapleader="\<space>"
nnoremap <leader>; A;<esc>
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>
nnoremap <c-p> :files<cr>
nnoremap <c-f> :Ag<space>
nnoremap <c-a> <esc>ggVG<cr>
nnoremap <c-c> :%y+<cr>

set hidden
set number
set relativenumber
set mouse=a
set inccommand=split

set nowrap       								"Don't wrap lines
set linebreak    								"Wrap lines at convenient points
set clipboard=unnamedplus       " Copy/paste between vim and other programs.

let g:rainbow_active = 1
let g:used_javascript_libs = 'vue'
