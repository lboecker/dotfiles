hi clear
if exists('syntax_on')
  syntax reset
endif

"
" UI highlight groups
"

hi ColorColumn  cterm=NONE ctermbg=236  ctermfg=NONE gui=NONE guibg=#303030 guifg=NONE
hi CursorColumn cterm=NONE ctermbg=236  ctermfg=NONE gui=NONE guibg=#303030 guifg=NONE
hi CursorLine   cterm=NONE ctermbg=236  ctermfg=NONE gui=NONE guibg=#303030 guifg=NONE

hi Directory    cterm=NONE ctermbg=NONE ctermfg=4    gui=NONE guibg=NONE    guifg=#3465a4

hi DiffAdd      cterm=NONE ctermbg=2    ctermfg=0    gui=NONE guibg=#4e9a06 guifg=#2e3436
hi DiffChange   cterm=NONE ctermbg=NONE ctermfg=NONE gui=NONE guibg=NONE    guifg=NONE
hi DiffDelete   cterm=NONE ctermbg=1    ctermfg=0    gui=NONE guibg=#cc0000 guifg=#2e3436
hi DiffText     cterm=NONE ctermbg=3    ctermfg=0    gui=NONE guibg=#c4a000 guifg=#2e3436

hi ErrorMsg     cterm=NONE ctermbg=NONE ctermfg=1    gui=NONE guibg=NONE    guifg=#cc0000
hi VertSplit    cterm=NONE ctermbg=15   ctermfg=NONE gui=NONE guibg=#eeeeec guifg=NONE

hi Folded       cterm=NONE ctermbg=8    ctermfg=15   gui=NONE guibg=#555753 guifg=#eeeeec
hi FoldColumn   cterm=NONE ctermbg=8    ctermfg=15   gui=NONE guibg=#555753 guifg=#eeeeec

hi IncSearch    cterm=NONE ctermbg=6    ctermfg=15   gui=NONE guibg=#06989a guifg=#eeeeec

hi LineNr       cterm=NONE ctermbg=NONE ctermfg=8    gui=NONE guibg=NONE    guifg=#555753
hi CursorLineNr cterm=NONE ctermbg=NONE ctermfg=15   gui=NONE guibg=NONE    guifg=#eeeeec

hi MatchParen   cterm=NONE ctermbg=6    ctermfg=NONE gui=NONE guibg=#06989a guifg=NONE
hi ModeMsg      cterm=bold ctermbg=NONE ctermfg=10   gui=NONE guibg=NONE    guifg=#8ae234
hi MoreMsg      cterm=NONE ctermbg=15   ctermfg=0    gui=NONE guibg=#eeeeec guifg=#2e3436
hi NonText      cterm=bold ctermbg=NONE ctermfg=8    gui=bold guibg=NONE    guifg=#555753
hi Normal       cterm=NONE ctermbg=NONE ctermfg=15   gui=NONE guibg=NONE    guifg=#eeeeec

hi Pmenu        cterm=NONE ctermbg=8    ctermfg=15   gui=NONE guibg=#555753 guifg=#eeeeec
hi PmenuSel     cterm=NONE ctermbg=6    ctermfg=15   gui=NONE guibg=#06989a guifg=#eeeeec
hi PmenuSbar    cterm=NONE ctermbg=8    ctermfg=NONE gui=NONE guibg=#555753 guifg=NONE
hi PmenuThumb   cterm=NONE ctermbg=15   ctermfg=NONE gui=NONE guibg=#eeeeec guifg=NONE

hi Question     cterm=NONE ctermbg=NONE ctermfg=4    gui=NONE guibg=NONE    guifg=#3465a4
hi Search       cterm=NONE ctermbg=15   ctermfg=0    gui=NONE guibg=#eeeeec guifg=#2e3436
hi SpecialKey   cterm=NONE ctermbg=NONE ctermfg=8    gui=NONE guibg=NONE    guifg=#555753

hi SpellBad     cterm=NONE ctermbg=1    ctermfg=15   gui=NONE guibg=#cc0000 guifg=#eeeeec
hi SpellCap     cterm=NONE ctermbg=1    ctermfg=15   gui=NONE guibg=#cc0000 guifg=#eeeeec
hi SpellLocal   cterm=NONE ctermbg=3    ctermfg=0    gui=NONE guibg=#c4a000 guifg=#2e3436
hi SpellRare    cterm=NONE ctermbg=3    ctermfg=0    gui=NONE guibg=#c4a000 guifg=#2e3436

hi StatusLine   cterm=NONE ctermbg=15   ctermfg=0    gui=NONE guibg=#eeeeec guifg=#2e3436
hi StatusLineNC cterm=NONE ctermbg=8    ctermfg=15   gui=NONE guibg=#2e3436 guifg=#eeeeec

hi Title        cterm=bold ctermbg=NONE ctermfg=10   gui=bold guibg=NONE    guifg=#8ae234
hi Visual       cterm=NONE ctermbg=6    ctermfg=15   gui=NONE guibg=#06989a guifg=#eeeeec
hi WarningMsg   cterm=NONE ctermbg=NONE ctermfg=3    gui=NONE guibg=NONE    guifg=#c4a000
hi WildMenu     cterm=NONE ctermbg=6    ctermfg=15   gui=NONE guibg=#06989a guifg=#eeeeec

"
" Syntax highlight groups
"

hi Comment    cterm=NONE ctermbg=NONE ctermfg=8  gui=NONE guibg=NONE    guifg=#555753

hi Constant   cterm=NONE ctermbg=NONE ctermfg=12 gui=NONE guibg=NONE    guifg=#729fcf
hi String     cterm=NONE ctermbg=NONE ctermfg=3  gui=NONE guibg=NONE    guifg=#c4a000
hi Number     cterm=NONE ctermbg=NONE ctermfg=3  gui=NONE guibg=NONE    guifg=#c4a000

hi Identifier cterm=NONE ctermbg=NONE ctermfg=12 gui=NONE guibg=NONE    guifg=#729fcf
hi Statement  cterm=NONE ctermbg=NONE ctermfg=10 gui=NONE guibg=NONE    guifg=#8ae234
hi PreProc    cterm=NONE ctermbg=NONE ctermfg=10 gui=NONE guibg=NONE    guifg=#8ae234
hi Type       cterm=NONE ctermbg=NONE ctermfg=12 gui=NONE guibg=NONE    guifg=#729fcf

hi Special    cterm=NONE ctermbg=NONE ctermfg=6  gui=NONE guibg=NONE    guifg=#06989a
hi Delimiter  cterm=NONE ctermbg=NONE ctermfg=15 gui=NONE guibg=NONE    guifg=#eeeeec

hi Underlined cterm=NONE ctermbg=NONE ctermfg=5  gui=NONE guibg=NONE    guifg=#75507b
hi Ignore     cterm=NONE ctermbg=NONE ctermfg=8  gui=NONE guibg=NONE    guifg=#555753
hi Error      cterm=NONE ctermbg=NONE ctermfg=1  gui=NONE guibg=NONE    guifg=#cc0000
hi Todo       cterm=NONE ctermbg=15   ctermfg=0  gui=NONE guibg=#eeeeec guifg=#2e3436

"
" Language-specific syntax highlight groups
"

hi link gitrebasePick   Statement
hi link gitrebaseReword Statement
hi link gitrebaseEdit   Statement
hi link gitrebaseSquash Statement
hi link gitrebaseFixup  Statement
hi link gitrebaseExec   Statement
hi link gitrebaseDrop   Statement

"
" Custom highlight groups
"

hi LongLine cterm=NONE ctermbg=16 ctermfg=NONE gui=NONE guibg=#000000 guifg=NONE

let g:colors_name = 'lboecker'
set background=dark
