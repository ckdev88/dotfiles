" Name:         bembasico
" Description:  CK theme, inspired by: slate, gruvbox and tsoding's emacs theme
" Author:       CK 
" Maintainer:   CK
" Website:      CK
" License:      Same as Vim
" Last Updated: Fri Mar 15 07:46:16 PM -03 2024

set background=dark

hi clear
let g:colors_name = 'bembasico'

hi! link Terminal Normal
hi! link CurSearch Search
hi! link CursorLineFold CursorLine
hi! link CursorLineSign CursorLine
hi! link MessageWindow Pmenu
hi! link PopupNotification Todo
hi! link Constant Identifier
hi! link @property Identifier
hi! link Structure Type
hi! link FoldColumn Folded
hi! link SpecialKey Type
hi! link Boolean String
hi! link Directory Function
hi! link Float Exception
hi! link Debug Exception
hi! link Label Exception
hi! link ErrorMsg Exception
hi! link WarningMsg Exception
hi! link CursorLineNr CursorLine
hi! link NvimDapVirtualTextChanged DapUIModifiedValue
hi! link DiagnosticHint DiagnosticWarn
hi! link @lsp.type.comment Comment

hi Identifier guifg=#e4e4e4 guibg=NONE gui=NONE cterm=NONE
hi Operator guifg=#ffffff 
hi String guifg=#79bf46 guibg=NONE gui=NONE cterm=NONE
hi Function guifg=#ffdd00 guibg=NONE gui=NONE cterm=NONE
hi Keyword guifg=Tan  guibg=NONE gui=NONE cterm=NONE
hi Character guifg=#e699ae guibg=NONE gui=NONE cterm=NONE
hi ColorColumn guifg=NONE guibg=#000000 gui=NONE cterm=NONE
hi Comment guifg=#504945 guibg=NONE gui=NONE cterm=NONE
hi Conceal guifg=#83a598 guibg=NONE gui=NONE cterm=NONE
hi Cursor gui=reverse cterm=reverse
hi Conditional guifg=#d16e22 guibg=NONE gui=NONE cterm=NONE
hi CursorColumn guifg=NONE guibg=#333333 gui=NONE cterm=NONE
hi CursorIM guifg=#1c1c1c guibg=#fbf1c7 gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#241e1d gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#241e1d gui=NONE cterm=NONE
hi Define guifg=#ffd700 guibg=NONE gui=bold cterm=NONE
hi Delimiter guifg=#6f5f46 guibg=NONE gui=NONE cterm=NONE
hi EndOfBuffer guifg=#504945 guibg=NONE gui=NONE cterm=NONE
hi Error guifg=#df0000 guibg=#e4e4e4 gui=reverse cterm=reverse
hi Exception guifg=#df0000 guibg=NONE gui=NONE cterm=NONE
hi Folded guifg=#928374 guibg=#121212 gui=NONE cterm=NONE
hi Ignore guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Search guibg=#8db9e2 guifg=Black 
hi LineNr guifg=#504945 guibg=NONE gui=NONE cterm=NONE
hi MatchParen guifg=#ffdd33 guibg=NONE gui=NONE gui=bold cterm=bold,reverse
hi ModeMsg guifg=#e4e4e4 guibg=NONE gui=NONE cterm=NONE
hi MoreMsg guifg=#fabd2f guibg=NONE gui=bold cterm=bold
hi NonText guifg=#504945 guibg=NONE gui=NONE cterm=NONE
hi Normal guifg=#cfbfa6 guibg=NONE gui=NONE cterm=NONE
hi Pmenu guifg=#fdedc4 guibg=#5a0914 gui=NONE cterm=NONE
hi PmenuExtra guifg=#a89984 guibg=#3c3836 gui=NONE cterm=NONE
hi PmenuExtraSel guifg=#303030 guibg=#83a598 gui=NONE cterm=NONE
hi PmenuKind guifg=#fb4934 guibg=#3c3836 gui=NONE cterm=NONE
hi PmenuKindSel guifg=#fb4934 guibg=#83a598 gui=NONE cterm=NONE
hi PmenuSbar guifg=NONE guibg=#262626 gui=NONE cterm=NONE
hi PmenuSel guifg=#262626 guibg=#d7d787 gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE guibg=#7c6f64 gui=NONE cterm=NONE
hi PreProc guifg=#cfbfa6 guibg=NONE gui=NONE cterm=NONE
hi Question guifg=orange guibg=NONE gui=NONE cterm=none
hi QuickFixLine guifg=#8ec07c guibg=#1c1c1c gui=reverse cterm=reverse
hi SignColumn guifg=#928374 guibg=black gui=NONE cterm=NONE
hi Special guifg=#c0c0a0 guibg=NONE gui=NONE cterm=NONE
hi SpecialChar guifg=#ffff00 guibg=NONE gui=NONE cterm=NONE
hi SpecialComment guifg=#fb4934 guibg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=#df0000 guibg=NONE guisp=#df0000 gui=undercurl cterm=underline
hi SpellCap guifg=#83a598 guibg=NONE guisp=#83a598 gui=undercurl cterm=underline
hi SpellLocal guifg=#8ec07c guibg=NONE guisp=#8ec07c gui=undercurl cterm=underline
hi SpellRare guifg=#e699ae guibg=NONE guisp=#e699ae gui=undercurl cterm=underline
hi Statement guifg=#d16e22 guibg=NONE gui=NONE cterm=NONE
hi StatusLine guifg=#918674 guibg=#202020 gui=NONE cterm=NONE
hi StatusLineNC guifg=#504945 guibg=NONE gui=NONE cterm=NONE
hi StatusLineTerm guifg=#df0000 guibg=#222222 gui=NONE cterm=bold,reverse
hi StatusLineTermNC guifg=NONE guibg=#222222 gui=reverse cterm=reverse
hi StorageClass guifg=#ffb049 guibg=NONE gui=NONE cterm=NONE
hi TabLine guifg=#666666 guibg=#000000 gui=NONE cterm=NONE
hi TabLineFill guifg=#ff8787 guibg=#000000 gui=NONE cterm=NONE
hi TabLineSel guifg=#000000 guibg=#afaf87 gui=NONE cterm=NONE
hi Title guifg=#ffdd33 guibg=NONE gui=bold cterm=bold
hi Todo guifg=#df0000 guibg=#ffdd33 gui=NONE cterm=bold
hi ToolbarButton guifg=#fbf1c7 guibg=#303030 gui=bold cterm=bold
hi ToolbarLine guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Type guifg=#6f5f46 guibg=NONE gui=NONE cterm=NONE
hi Typedef guifg=#fabd2f guibg=NONE gui=NONE cterm=NONE
hi Underlined guifg=#504945 guibg=NONE gui=underline cterm=underline
hi VertSplit guifg=#fbf1c7 guibg=black gui=NONE cterm=NONE
hi Visual guifg=#cfbfa6 guibg=#504945 gui=NONE cterm=reverse
hi VisualNOS guifg=#d7d787 guibg=#5f8700 gui=NONE cterm=NONE
hi WildMenu guifg=#83a598 guibg=#504945 gui=bold cterm=bold
hi lCursor guifg=#262626 guibg=#ffafaf gui=NONE cterm=NONE

hi @lsp.type.enum guifg=#70b2a1
hi @lsp.type.function guifg=#ffdd33 gui=bold cterm=NONE
hi @lsp.type.property guifg=#efdfc6
hi @lsp.type.variable guifg=#efdfc6 guibg=NONE gui=NONE cterm=NONE 

hi NvimDapVirtualText guifg=#70b2a1 guibg=#504945 gui=NONE
hi DapUIModifiedValue guifg=Cyan guibg=#504945 gui=bold

hi DiagnosticWarn guifg=black guibg=DarkOrange 
hi DiagnosticError guifg=white guibg=#df0000

hi DiffAdd guifg=Lime guibg=Black gui=NONE
hi DiffAdded guifg=Lime guibg=Black gui=NONE
hi DiffDelete guifg=Red guibg=Black gui=NONE
hi diffRemoved guifg=Red guibg=Black gui=NONE
hi diffFile guifg=White

hi CommentLine guifg=Lime
hi WhichKeyValue guifg=#d16e22
