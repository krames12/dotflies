set nocompatible " be iMproved, required
syntax enable


" Plugins

call plug#begin('~/.vim/plugged')

" Make sure to use single quotes for plugins

"Ruby Plugins
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'vim-ruby/vim-ruby'

"Javascript Plugins
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'styled-components/vim-styled-components'

"Misc Plugins
Plug 'tpope/vim-haml'
Plug 'leshill/vim-json'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-sensible'
Plug 'rondale-sc/vim-spacejam' "removes trailing whitespace on save
Plug 'jiangmiao/auto-pairs' "auto complete / delete of bracket pairs
"File explorer w/ extensions
Plug 'preservim/nerdtree' |
          \ Plug 'Xuyuanp/nerdtree-git-plugin' |
          \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight' |
          \ Plug 'ryanoasis/vim-devicons'
let g:WebDevIconsOS = 'Darwin'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } |
           \ Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep' "easier way to search through a directory
Plug 'itchyny/lightline.vim' "status bar at the bottom
Plug 'tpope/vim-fugitive' "git companion for vim

"Theme
Plug 'ayu-theme/ayu-vim'

call plug#end()

"Theme Related Jargon
"set t_Co=256
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let ayucolor="dark"
colorscheme ayu

"NERDTree Configuration
" Start NERDTree and leave the cursor in it.
nnoremap <C-b> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = "42"

"LightLine config
"Shows current mode, branch, and file
let g:lightline = {
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'FugitiveHead'
	\ },
	\ }

"FZF shortcut commands
nnoremap ff :Files<CR>
nnoremap fl :Lines<CR>
let g:fzf_layout = { 'down': '~40%' }
