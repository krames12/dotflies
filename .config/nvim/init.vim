set nocompatible " be iMproved, required
syntax enable

" editor related settings
set number
set expandtab
set shiftwidth=2
set smartindent

" Plugins

call plug#begin('~/.vim/plugged')

" Make sure to use single quotes for plugins

"Ruby Plugins
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-endwise'
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
Plug 'neoclide/coc.nvim', {'branch': 'release'} "code completion drop down

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
let g:NERDTreeShowHidden = 1

"LightLine config
"Shows current mode, branch, and file
let g:lightline = {
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'FugitiveHead'
	\ },
	\ }

"FZF shortcut commands
nnoremap ff :Files<CR>
nnoremap fl :Lines<CR>
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.5, 'highlight': 'Comment' } }
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
let $FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git"'

command! -bang -nargs=* BLines
    \ call fzf#vim#grep(
    \   'rg --with-filename --column --line-number --no-heading --smart-case . '.fnameescape(expand('%:p')), 1,
    \   fzf#vim#with_preview({'options': '--layout reverse --query '.shellescape(<q-args>).' --with-nth=4.. --delimiter=":"'}))

" do not search filename, just file contents
command! -bang -nargs=* Lines
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --colors "path:fg:190,220,255" --colors "line:fg:128,128,128" --smart-case  -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({ 'options': ['--delimiter', ':', '--nth', '4..', '--color', 'hl:123,hl+:222'] }), <bang>0)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
