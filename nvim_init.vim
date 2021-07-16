set omnifunc=ale#completion#OmniFunc
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
"PLUGINS HERE Bundle 'vim-ruby/vim-ruby' Bundle 'thoughtbot/vim-rspec' Bundle
"'tpope/vim-rails' Bundle 'tpope/vim-haml' Bundle 'violetyk/cake.vim' Bundle
"'groenewege/vim-less' Bundle 'kchmck/vim-coffee-script' Bundle
"'severin-lemaignan/vim-minimap'
Plug 'captbaritone/better-indent-support-for-php-with-html'
"Bundle 'vim-syntastic/syntastic' Bundle 'artur-shaik/vim-javacomplete2'

Plug 'tpope/vim-projectionist'
Plug 'cakebaker/scss-syntax.vim'

" colorschemes! :)
Plug 'flazz/vim-colorschemes'

" tags
Plug 'majutsushi/tagbar'

" snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

" html5 syntax
Plug 'othree/html5.vim'

" javascript syntax
Plug 'pangloss/vim-javascript'

Plug 'elixir-editors/vim-elixir'
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}

Plug 'benmills/vimux'
Plug 'chaoren/vim-wordmotion'

Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'

Plug 'scrooloose/nerdtree'
Plug 'EvanDotPro/nerdtree-symlink'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'posva/vim-vue'
Plug 'mbbill/undotree'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-git'

Plug 'airblade/vim-gitgutter'

" Lint
Plug 'w0rp/ale'

" Syntax
Plug 'HerringtonDarkholme/yats.vim'

" Typescript
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }

" Completion Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugs' } Plug
" 'Shougo/denite.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Icons!!!
Plug 'ryanoasis/vim-devicons'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" GraphQL
Plug 'jparise/vim-graphql'

" Rust
Plug 'rust-lang/rust.vim'

" let g:deoplete#enable_at_startup = 1

call plug#end()
filetype plugin indent on

"---

"if !empty(matchstr($MY_RUBY_HOME, 'jruby')) let g:ruby_path =
"join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/rubysite_ruby/*'),
""\n"), ',') endif
"
"autocmd FileType ruby compiler ruby autocmd FileType eruby compiler eruby
"autocmd FileType rubyunit compiler rubyunit
"
":map <Leader>t :call RunCurrentSpecFile() <CR> :map <Leader>s :call
"RunNearestSpec() <CR> :map <Leader>l :call RunLastSpec() <CR> :map <Leader>a
":call RunAllSpecs() <CR>

"---

au BufNewFile,BufRead *.ctp set filetype=html syntax=php

map <Leader>h :set ft=html <CR> map <Leader>p :set ft=php <CR>

"---

set shiftwidth=2
set tabstop=2
set expandtab
set wildmenu

autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 expandtab

"---

au FileType php set omnifunc=phpcomplete#CompletePHP
"au FileType java set omnifunc=javacomplete#Complete let php_sql_query=1 let php_htmlInStrings=1

"---

if has("wildmenu")
  set wildignore+=*~,*.swp,*.swo
  set wildmenu
  set wildmode=longest,list
endif

"---

"let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1 "auto open list (split)
"let g:syntastic_check_on_open = 1 let g:syntastic_check_on_wq = 0
"
"let g:syntastic_sass_checkers = ["sass"] let g:syntastic_scss_checkers =
"["sass"]

"---

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'component': {
      \   'readonly': '%{&readonly? "\ue0a2" :""}',
      \   'separator': {'left': '\ue0b0', 'right': '\ue0b2'},
      \   'subseparator': {'left': '\ue0b1', 'right': '\ue0b3'}
      \   }
      \ }

set statusline+=%{gutentags#statusline()}

set noshowmode

"---

set cindent

set ruler
set number

syntax on filetype on filetype plugin on

set laststatus=2

colorscheme darkZ

"---

let mapleader=","

map <Leader>t :call VimuxRunCommand("clear; py.test")<CR>
map <Leader>t :call VimuxRunCommand("clear; mix test")<CR>

map <Leader>T :call VimuxRunCommand("clear; mix test " . @%)<CR>

"--- PHP 4 chars indent
autocmd FileType php setlocal shiftwidth=4 tabstop=4

"--- ctrl+p
let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlPTag'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=10

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
else
  let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|DS_Store|_build|deps|vendor|coverage)|(\.(swp|ico|git|svn))$'
endif

"--- html5 highlight
syn keyword htmlTagName contained transition component

"--- snippets
imap <C-J> <Plug>snipMateNextOrTrigger imap <C-K> <Plug>snipMateBack

"let g:snipMate.scope_aliases['vue'] = 'javascript,html,css,scss,sass'

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

"--- genuis stuff ---" ,D - open _absolute_ directory in Vimux
map <silent> <Leader>D :call VimuxRunCommand('cd $(dirname ' . @% . ')')<CR>
" ,d - open _relative_ directory in Vimux
map <silent> <Leader>d :call VimuxRunCommand('cd ' . getcwd() . '/$(dirname '. @% . ')')<CR>
" ,g - start grepping in Vimux
map <Leader>g :call VimuxRunCommand('grep ')<left><left>

let g:NERDTreeWinSize=45

set nohlsearch
set encoding=UTF-8

" Mouse for everything (y)
set mouse=a

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show sign column
set signcolumn=yes

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
nnoremap <silent> <space>f :Format<cr>

" Using CocList
" Show diagnostics info
nnoremap <silent> <space>d  <Plug>(coc-refactor)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Better display for messages
set cmdheight=2

" Open this config
nmap <space>1 :tabe /Users/oskar1233/.config/nvim/init.vim<CR>

" Source this config
nmap <space>2 :so /Users/oskar1233/.config/nvim/init.vim<CR>

" SPELL CHECK <3
set spell spelllang=en_gb
hi clear SpellBad
hi SpellBad cterm=underline
