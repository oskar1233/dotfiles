"Vundle

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"PLUGINS HERE
"Bundle 'vim-ruby/vim-ruby'
"Bundle 'thoughtbot/vim-rspec'
"Bundle 'tpope/vim-rails'
"Bundle 'tpope/vim-haml'
"Bundle 'violetyk/cake.vim'
"Bundle 'groenewege/vim-less'
"Bundle 'kchmck/vim-coffee-script'
"Bundle 'severin-lemaignan/vim-minimap'
Bundle 'captbaritone/better-indent-support-for-php-with-html'
"Bundle 'vim-syntastic/syntastic'
"Bundle 'artur-shaik/vim-javacomplete2'

" colorschemes! :)
Plugin 'flazz/vim-colorschemes'

" tags
Plugin 'majutsushi/tagbar'

" snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

" html5 syntax
Bundle 'othree/html5.vim'

" expand html (css like syntax)
Plugin 'mattn/emmet-vim'

" javascript syntax
Bundle 'pangloss/vim-javascript'

Bundle 'elixir-editors/vim-elixir'

Bundle 'benmills/vimux'
Bundle 'chaoren/vim-wordmotion'

Bundle 'scrooloose/nerdtree'
Bundle 'EvanDotPro/nerdtree-symlink'
Bundle 'Xuyuanp/nerdtree-git-plugin'

Bundle 'posva/vim-vue'
Bundle 'mbbill/undotree'

Bundle 'kien/ctrlp.vim'

Bundle 'easymotion/vim-easymotion'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-git'

Bundle 'airblade/vim-gitgutter'

Bundle 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"--- TS
" Completion
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'mhartington/nvim-typescript', {'do': './install.sh'}
" For async completion
Plugin 'Shougo/deoplete.nvim'
" For Denite features
Plugin 'Shougo/denite.nvim'

"--- PHP
Plugin 'vim-vdebug/vdebug'

call vundle#end()
filetype plugin indent on

"---

"if !empty(matchstr($MY_RUBY_HOME, 'jruby'))
"	let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/rubysite_ruby/*'), "\n"), ',')
"endif
"
"autocmd FileType ruby compiler ruby
"autocmd FileType eruby compiler eruby
"autocmd FileType rubyunit compiler rubyunit
"
":map <Leader>t :call RunCurrentSpecFile() <CR>
":map <Leader>s :call RunNearestSpec() <CR>
":map <Leader>l :call RunLastSpec() <CR>
":map <Leader>a :call RunAllSpecs() <CR>

"---

au BufNewFile,BufRead *.ctp set filetype=html syntax=php

map <Leader>h :set ft=html <CR>
map <Leader>p :set ft=php <CR>

"---

set shiftwidth=4
set tabstop=4
set expandtab
set wildmenu

autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 expandtab

"---

au FileType php set omnifunc=phpcomplete#CompletePHP
au FileType java set omnifunc=javacomplete#Complete
let php_sql_query=1
let php_htmlInStrings=1

"---

if has("wildmenu")
    set wildignore+=*~,*.swp,*.swo
    set wildmenu
    set wildmode=longest:full
endif

"---

"let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1 "auto open list (split)
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"
"let g:syntastic_sass_checkers = ["sass"]
"let g:syntastic_scss_checkers = ["sass"]

"---

let g:lightline = {
            \ 'colorscheme': 'seoul256',
            \ 'component': {
            \   'readonly': '%{&readonly? "\ue0a2" :""}',
            \   'separator': {'left': '\ue0b0', 'right': '\ue0b2'},
            \   'subseparator': {'left': '\ue0b1', 'right': '\ue0b3'}
            \ }
            \ }

set noshowmode

"---

set cindent

set ruler
set number

syntax on
filetype on
filetype plugin on

set laststatus=2

colorscheme apprentice

"---

let mapleader=","

map <Leader>t :call VimuxRunCommand("clear; composer test")<CR>
map <Leader>t :call VimuxRunCommand("clear; mix test")<CR>
map <Leader>t :call VimuxRunCommand("clear; yarn test")<CR>
" map <Leader>T :call VimuxRunCommand("clear; NODE_OPTIONS=\"--trace-warnings\" yarn run jest " . @% . " --collectCoverageFrom=" . "$(dirname " . @% . ")/* --coverage")<CR>
map <Leader>T :call VimuxRunCommand("clear; NODE_OPTIONS=\"--trace-warnings\" yarn run jest " . @%)<CR>

"---

set nohlsearch

"--- PHP 4 chars indent
set shiftwidth=2 tabstop=2
autocmd FileType php setlocal shiftwidth=4 tabstop=4

"--- ctrl+p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPTag'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=10

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist'

"--- html5 highlight
syn keyword htmlTagName contained transition component

"--- nerdtree
map <silent> <Leader>n :NERDTreeFind<CR>:NERDTreeFocus<CR>

"--- tags
map <silent> <Leader>y :TagbarToggle<CR>

"--- wrapping
set nowrap

"--- inc search
set incsearch

"--- scroll X lines earlier
set scrolloff=18

"--- genuis stuff ---"
" ,D - open _absolute_ directory in Vimux
map <silent> <Leader>D :call VimuxRunCommand('cd $(dirname ' . @% . ')')<CR>
" ,d - open _relative_ directory in Vimux
map <silent> <Leader>d :call VimuxRunCommand('cd ' . getcwd() . '/$(dirname ' . @% . ')')<CR>
" ,g - start grepping in Vimux
map <Leader>g :call VimuxRunCommand('grep ')<left><left>

" CTRL+P default to Most Recently Used
let g:ctrlp_cmd = 'CtrlPMRU'

let g:NERDTreeWinSize=45

"--- linters
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1

"--- airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme = "base16"

"--- completion
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
let deoplete#tag#cache_limit_size = 20000000 " 20MB

call deoplete#custom#option({
      \ 'auto_complete_delay': 10,
      \ 'async_timeout': 150,
      \ 'camel_case': v:true,
      \ 'smart_case': v:true,
      \ 'num_processes': 8,
      \ })

call deoplete#custom#option('tags', 'rank', 99)
set complete-=i

"--- typescript completion
"let g:nvim_typescript#server_options = ['--resolveJsonModule']
