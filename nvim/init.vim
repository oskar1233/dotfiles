" NERD FONT to install https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/FantasqueSansMono.zip -- use that in the terminal

nnoremap <SPACE> <Nop>
" let mapleader="<space>"
map <Space> <Leader>

set omnifunc=null
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1

set hidden

if &compatible
  set nocompatible
endif

filetype plugin indent on
syntax enable

"Vundle

filetype off
call plug#begin()

Plug 'peitalin/vim-jsx-typescript'

Plug 'github/copilot.vim'
imap <silent> <C-\> <Plug>(copilot-suggest)
imap <silent> <C-j> <Plug>(copilot-next)
imap <silent> <C-k> <Plug>(copilot-previous)

Plug 'mogelbrod/vim-jsonpath'

Plug 'tikhomirov/vim-glsl'

Plug 'captbaritone/better-indent-support-for-php-with-html'

" Plug 'dyng/ctrlsf.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

Plug 'tpope/vim-projectionist'
Plug 'cakebaker/scss-syntax.vim'

" colorschemes! :)
Plug 'flazz/vim-colorschemes'

" tags
Plug 'majutsushi/tagbar'

" snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

" html5 syntax
Plug 'othree/html5.vim'

" .NET
Plug 'OmniSharp/omnisharp-vim'
Plug 'nickspoons/vim-sharpenup'

" javascript syntax
Plug 'pangloss/vim-javascript'

" Svelte
Plug 'evanleck/vim-svelte', {'branch': 'main'}

Plug 'elixir-editors/vim-elixir'
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}

Plug 'benmills/vimux'
Plug 'chaoren/vim-wordmotion'

Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

Plug 'posva/vim-vue'
Plug 'mbbill/undotree'

Plug 'easymotion/vim-easymotion'
map , <Plug>(easymotion-prefix)

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-git'

Plug 'airblade/vim-gitgutter'

Plug 'tikhomirov/vim-glsl'

" Syntax
Plug 'HerringtonDarkholme/yats.vim'

" Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Icons!!!
Plug 'ryanoasis/vim-devicons'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" GraphQL
Plug 'jparise/vim-graphql'

" Rust
Plug 'rust-lang/rust.vim'

call plug#end()
filetype plugin indent on

"---

au BufNewFile,BufRead *.ctp set filetype=html syntax=php
au BufNewFile,BufRead *.heex set filetype=eelixir syntax=eelixir
" au BufNewFile,BufRead *.heex set filetype=html syntax=eelixir

" autocmd BufWritePost *.html.heex !mix format <afile>

"---

set shiftwidth=2
set tabstop=2
set expandtab
set wildmenu

autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 expandtab

"---

au FileType php set omnifunc=phpcomplete#CompletePHP

"---

"---

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'component': {
      \   'readonly': '%{&readonly? "\ue0a2" :""}',
      \   'separator': {'left': '\ue0b0', 'right': '\ue0b2'},
      \   'subseparator': {'left': '\ue0b1', 'right': '\ue0b3'}
      \   }
      \ }

set noshowmode

"---

set cindent

set ruler
set number

syntax on filetype on filetype plugin on

set laststatus=2

colorscheme darkZ

"---

map <Leader>t :call VimuxRunCommand("clear; py.test")<CR>
map <Leader>q :call VimuxRunCommand("clear; npm test")<CR>
map <Leader>t :call VimuxRunCommand("clear; mix test")<CR>

map <Leader>T :call VimuxRunCommand("clear; mix test " . @%)<CR>
map <Leader>C :call VimuxRunCommand("clear; mix test --only current")<CR>
" map <Leader>F :call VimuxRunCommand("clear; mix test --failed")<CR>

map <silent> <Leader>F :!mix format %<CR>

map <Leader>G :call VimuxRunCommand("go run " . @%)<CR>
map <Leader>R :call VimuxRunCommand("cargo run")<CR>
map <Leader>N :call VimuxRunCommand("node .")<CR>

"--- html5 highlight
syn keyword htmlTagName contained transition component

"--- wrapping
set nowrap

"--- inc search
set incsearch

"--- scroll X lines earlier
set scrolloff=18

"--- genuis stuff ---" ,D - open _absolute_ directory in Vimux
map <silent> <Leader>D :call VimuxRunCommand('cd $(dirname ' . @% . ')')<CR>
" ,d - open _relative_ directory in Vimux
map <silent> <Leader>d :call VimuxRunCommand('cd ' . getcwd() . '/$(dirname '. @% . ')')<CR>
" ,f - open working directory directory in Vimux
" map <silent> <Leader>f :call VimuxRunCommand('cd ' . getcwd())<CR>
" ,g - start grepping in Vimux
" map <Leader>g :call VimuxRunCommand('grep ')<left><left>

set nohlsearch
set encoding=UTF-8

" Mouse for everything (y)
set mouse=a

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=50

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show sign column
set signcolumn=yes

" COC completion ctrl + space
inoremap <silent><expr> <c-space> coc#refresh()

" COC Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Create mappings for function text object, requires document symbols feature
" of languageserver.
xmap if <Plug>(coc-funcobj-i) xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i) omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like:
" coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
nnoremap <silent> <Leader>f :Format<cr>

" Using CocList
" Show diagnostics info
nnoremap <silent> <space>d  <Plug>(coc-refactor)
" Show all diagnostics
nnoremap <silent> <Leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <Leader>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <Leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <Leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <Leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <Leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <Leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <Leader>p  :<C-u>CocListResume<CR>

hi! CocErrorSign guifg=#d1666a
hi! CocInfoSign guibg=#353b45
hi! CocWarningSign guifg=#d1cd66

" Better display for messages
set cmdheight=2

" Open this config
nmap <space>1 :tabe ~/.config/nvim/init.vim<CR>

" Source this config
nmap <space>2 :so ~/.config/nvim/init.vim<CR>

" SPELL CHECK <3
set spell spelllang=en_gb
hi clear SpellBad
hi SpellBad cterm=underline
hi CocErrorFloat guifg=#00ff00

"let g:ctrlsf_ignore_dir = ['node_modules', '.nuxt', 'target', 'dist', 'DS_Store', '_build', 'deps', 'vendor', 'coverage', '.elixir_ls', 'erl_crash.dump']

autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

" confirm completion with enter but maybe better to memorize <Ctrl - y>
" imap <silent><expr> <CR> coc#float#has_float() ? coc#_select_confirm() : '<CR>'

"
inoremap <silent><expr> <c-space> coc#refresh()

command Glol :G log "--graph" "--pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'\'"

"--- chatgpt
luafile ~/.config/nvim/packer.lua

"--- nvim-tree
luafile ~/.config/nvim/nvim-tree.lua
map <silent> <Leader>n :NvimTreeFindFile<CR>:NvimTreeFocus<CR>

"--- Telescope
luafile ~/.config/nvim/telescope.lua
