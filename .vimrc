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
"Bundle 'captbaritone/better-indent-support-for-php-with-html'
"Bundle 'vim-syntastic/syntastic'
"Bundle 'artur-shaik/vim-javacomplete2'

" tags
Plugin 'majutsushi/tagbar'

" snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

" html5 syntax
Bundle 'othree/html5.vim'

" javascript syntax
Bundle 'pangloss/vim-javascript'

Bundle 'elixir-editors/vim-elixir'

Bundle 'benmills/vimux'
Bundle 'chaoren/vim-wordmotion'

Bundle 'itchyny/lightline.vim'
Bundle 'edkolev/tmuxline.vim'

Bundle 'scrooloose/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'

Bundle 'posva/vim-vue'
Bundle 'mbbill/undotree'

Bundle 'kien/ctrlp.vim'

Bundle 'easymotion/vim-easymotion'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-git'

Bundle 'airblade/vim-gitgutter'

call vundle#end()
filetype plugin indent on

execute pathogen#infect()

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

set shiftwidth=2
set tabstop=2
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
    set wildmode=longest,list
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

set statusline+=%{gutentags#statusline()}

set noshowmode

"---

set cindent

set ruler
set number

syntax on
filetype on
filetype plugin on

set laststatus=2

colorscheme peachpuff

"---

let mapleader=","

map <Leader>t :call VimuxRunCommand("clear; composer test")<CR>
map <Leader>t :call VimuxRunCommand("clear; mix test")<CR>

"--- PHP 4 chars indent
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

"--- snippets
imap <C-J> <Plug>snipMateNextOrTrigger
imap <C-K> <Plug>snipMateBack

"let g:snipMate.scope_aliases['vue'] = 'javascript,html,css,scss,sass'

"--- nerdtree
map <silent> <Leader>n :NERDTreeFind<CR>:NERDTreeFocus<CR>

"--- tags
map <silent> <Leader>y :TagbarToggle<CR>

"--- wrapping
set nowrap

"--- genuis stuff ---"
" ,D - open _absolute_ directory in Vimux
map <silent> <Leader>D :call VimuxRunCommand('cd $(dirname ' . @% . ')')<CR>
" ,d - open _relative_ directory in Vimux
map <silent> <Leader>d :call VimuxRunCommand('cd ' . getcwd() . '/$(dirname ' . @% . ')')<CR>

