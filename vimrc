if &compatible
  set nocompatible
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'

call plug#end()

colorscheme lboecker

set expandtab
set softtabstop=2
set shiftwidth=2

set autoindent
set backspace=indent,eol,start
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

let g:vim_markdown_frontmatter = 1

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
au BufWritePre * call s:trim_trailing_whitespace()

au FileType c,gitconfig,go,make set noet sts=0 sw=8
au FileType gitcommit set spell

au FileType *
  \ if &omnifunc == '' |
  \   setlocal omnifunc=syntaxcomplete#Complete |
  \ endif

function s:trim_trailing_whitespace()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l, c)
endfunction

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
