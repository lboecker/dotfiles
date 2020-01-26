if &compatible
  set nocompatible
endif

call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'junegunn/vim-easy-align'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

call plug#end()

colorscheme lboecker

set expandtab
set softtabstop=2
set shiftwidth=2

set autoindent
set backspace=indent,eol,start
set backupcopy=yes
set encoding=utf-8
set formatoptions+=j
set history=1000
set hlsearch
set ignorecase
set incsearch
set list
set nofoldenable
set nomodeline
set nowrap
set nrformats-=octal
set number
set ruler
set showcmd
set smartcase
set spelllang=en_us
set ttimeout
set ttimeoutlen=100
set wildmenu
set wildmode=longest,full

let &listchars = "tab:\ \ ,nbsp:\u00b7"
let mapleader = ','

let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:vim_markdown_frontmatter = 1

let g:ale_linters = {
  \   'go': ['gofmt', 'golint', 'go vet'],
  \   'graphql': ['eslint'],
  \   'javascript': ['eslint'],
  \   'sh': ['shellcheck'],
  \   'typescript': ['eslint', 'tsserver'],
  \   'typescriptreact': ['eslint', 'tsserver']
  \ }

let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'css': ['prettier'],
  \   'go': ['goimports'],
  \   'graphql': ['eslint'],
  \   'javascript': ['eslint'],
  \   'json': ['prettier'],
  \   'typescript': ['eslint'],
  \   'typescriptreact': ['eslint']
  \ }

nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
nmap <silent> <Leader>i :call <SID>toggle_invisibles()<CR>
nmap <silent> <Leader>ss :set stl=%{string(<SID>get_synstack())} ls=2<CR>

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

inoremap <expr> <Up> pumvisible() ? '<C-p>' : '<Up>'
inoremap <expr> <Down> pumvisible() ? '<C-n>' : '<Down>'
inoremap <expr> <Tab> pumvisible() ? '<C-n>' : '<Tab>'
inoremap <expr> <CR> pumvisible() ? '<C-y>' : '<CR>'

au BufWinEnter * let w:m0 = matchadd('LongLine', '\%>80v.\+', -1)

au BufNewFile,BufRead .babelrc,.eslintrc,.prettierrc set ft=json
au FileType c,gitconfig,go,make set noet sts=0 sw=8
au FileType gitcommit set spell

au FileType *
  \ if &omnifunc == '' |
  \   setlocal omnifunc=syntaxcomplete#Complete |
  \ endif

function s:toggle_invisibles()
  if !exists('g:old_listchars')
    let g:old_listchars = &listchars
    let &listchars = &listchars.",eol:$,tab:>\ ,space:\u00b7"
  else
    let &listchars = g:old_listchars
    unlet g:old_listchars
  endif
endfunction

function s:get_synstack()
  let ss = synstack(line('.'), col('.'))
  return map(ss, 'synIDattr(v:val, "name")')
endfunction
