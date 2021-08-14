"
"  ███████╗░██████╗
"  ██╔════╝██╔════╝     felipesuri
"  █████╗░░╚█████╗░			https://felipesuri.com
"  ██╔══╝░░░╚═══██╗     https://github.com/felipesuri
"  ██║░░░░░██████╔╝     https://gitlab.com/felipesuri
"  ╚═╝░░░░░╚═════╝░
"
" My customized config for Neovim;

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle For Managing Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')
" @basics
Plug 'itchyny/lightline.vim'																			" LightLine
Plug 'luochen1990/rainbow' 																				" Rainbow
Plug 'dracula/vim', { 'as': 'dracula' }	 													" Dracula Theme

" @fileManagement

Plug 'editorconfig/editorconfig-vim'															" Editorconfig
Plug 'preservim/nerdtree'																					" NERDTree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     								" Highlighting NERDTree
Plug 'ryanoasis/vim-devicons'                      								" Icons for Nerdtree
Plug 'mileszs/ack.vim'																						" Ack
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'																			" CTRLP
Plug 'Xuyuanp/nerdtree-git-plugin'

" @lintersAndHelpers

Plug 'w0rp/ale'																										" ALE
Plug 'sheerun/vim-polyglot' 																			" Polyglot
"Plug 'ncm2/ncm2'                     															" NCM2
"Plug 'ncm2/ncm2-bufword'																					" NCM2 bufoword
"Plug 'ncm2/ncm2-path'																							" NCM2 path
"Plug 'roxma/nvim-yarp'																						" Yarp
Plug 'jiangmiao/auto-pairs'																				" Auto Pairs
Plug 'mattn/emmet-vim'																						" Emmet
Plug 'honza/vim-snippets'																					" Snippets
Plug 'bronson/vim-trailing-whitespace' 														" Trailing WhiteSpace
Plug 'zivyangll/git-blame.vim'																		" Git Blame
Plug 'airblade/vim-gitgutter/'																		" GitGutter
"Plug 'ycm-core/YouCompleteMe'
"Plug 'ackyshake/VimCompletesMe'

" @syntaxHighlightingAndColors

Plug 'hail2u/vim-css3-syntax' 																		" CSS3 Syntax
Plug 'gko/vim-coloresque'																					" Coloresque
Plug 'tpope/vim-haml'																							" HAML
Plug 'jelera/vim-javascript-syntax'																" Javacript Syntax
Plug 'othree/javascript-libraries-syntax.vim' 										" Javascript Libraries
Plug 'leafOfTree/vim-vue-plugin'																	" Vue Plugin
Plug 'isRuslan/vim-es6'																						" ES6
Plug 'mboughaba/i3config.vim'																			" i3 config Highlighting

" @others

Plug 'wakatime/vim-wakatime'																			" WakaTime
Plug 'junegunn/vim-emoji'                          								" Vim needs emojis!
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
call plug#end()

" enable ncm2 for all buffers
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=noinsert,menuone,noselect

" Ale Config
let g:ale_fixers = {
\	'vue': ['prettier'],
\	'javascript': ['prettier', 'eslint'],
\	'css': ['prettier'],
\}
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
let g:NERDTreeIgnore = ['^node_modules$']

" Add shortcut for Blame
nnoremap <leader>bv :<C-u>call gitblame#echo()<CR>

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
let g:user_emmet_leader_key=','

" Others Stuff

set guioptions-=m  							"remove menu bar
set guioptions-=T  							"remove toolbar
set guioptions-=r  							"remove right-hand scroll bar
set guioptions-=L  							"remove left-hand scroll bar
"set guifont=SauceCodePro\ Nerd\ Font:h15
"set guifont=Mononoki\ Nerd\ Font:h15

let g:neovide_transparency = 0.95
let g:vim_vue_plugin_use_scss = 1
let g:vim_vue_plugin_use_sass = 1
let g:vim_vue_plugin_highlight_vue_keyword = 1
let g:ctrlp_custom_ignore = 'node_modules\|git'

let g:vim_vue_plugin_config = {
\ 'syntax': {
\   'template': ['html'],
\   'script': ['javascript'],
\   'style': ['css', 'scss'],
\ },
\ 'foldexpr': 1,
\}


map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
nmap <leader>p :CtrlP<CR>
map <leader>nt :NERDTreeToggle<Enter>
map <leader>vs :split<Enter>

let g:coc_global_extensions = [
\ 'coc-snippets',
\ 'coc-pairs',
\ 'coc-eslint',
\ 'coc-prettier',
\ 'coc-json',
\ 'coc-vetur',
\]

