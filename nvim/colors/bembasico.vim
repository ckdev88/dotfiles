" Name:         bembasico
" Description:  CK theme, inspired by: Slate, Gruvbox & Gruber Darker
" Author:       CK 
" Maintainer:   CK
" Website:      CK
" License:      Same as Vim
" Last Updated: Sun Mar 17 11:37:34 AM -03 2024

set background=dark

hi clear

let g:colors_name = 'bembasico'

" hi! link @property Identifier
hi! link @function.css Method
hi! link @lsp.type.comment Comment
hi! link @property.css Statement
hi! link @string.css Identifier
hi! link @tag.attribute.tsx Type
hi! link @tag.css Type
hi! link @tag.tsx Method
hi! link @type.css Function
hi! link Boolean String
hi! link Constant Identifier
hi! link CurSearch Search
hi! link CursorLineFold CursorLine
hi! link CursorLineNr CursorLine
hi! link CursorLineSign CursorLine
hi! link Debug Exception
hi! link DiagnosticHint DiagnosticWarn
hi! link Directory Method
hi! link ErrorMsg Exception
hi! link Float Exception
hi! link FoldColumn Folded
hi! link Label Exception
hi! link MatchParen Search
hi! link MessageWindow Pmenu
hi! link NvimDapVirtualTextChanged DapUIModifiedValue
hi! link PopupNotification Todo
hi! link PreProc Function
hi! link SpecialKey Type
hi! link Structure Type
hi! link Tag Identifier
hi! link Terminal Normal
hi! link WarningMsg Exception
hi! link hmtlTab Normal
hi! link htmlString Normal
hi! link htmlTest diffRemoved

hi @lsp.type.enum guifg=#70b2a1
hi @lsp.type.function guifg=#ffdd33 gui=bold cterm=bold
hi @lsp.type.property guifg=#e4e4e4
hi @lsp.type.variable guifg=#f4f4f4 guibg=NONE gui=NONE cterm=NONE 
hi Character guifg=#df0000 guibg=NONE gui=NONE cterm=NONE
hi ColorColumn guifg=NONE guibg=#0c0c0c gui=NONE cterm=NONE
hi Comment guifg=#999999 guibg=#333333 gui=NONE cterm=NONE
hi CommentLine guifg=Lime
hi Conceal guifg=#83a598 guibg=NONE gui=NONE cterm=NONE
hi Conditional guifg=#d16e22 guibg=NONE gui=NONE cterm=NONE
hi Cursor gui=reverse cterm=reverse
hi CursorColumn guifg=NONE guibg=#333333 gui=NONE cterm=NONE
hi CursorIM guifg=#1c1c1c guibg=#fbf1c7 gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#262626 gui=NONE cterm=NONE
hi DapUIModifiedValue guifg=Cyan guibg=#504945 gui=bold
hi Define guifg=#ffd700 guibg=NONE gui=bold cterm=NONE
hi Delimiter guifg=#6f6f67 guibg=NONE gui=NONE cterm=NONE
hi DiagnosticError guifg=white guibg=#df0000
hi DiagnosticWarn guifg=black guibg=DarkOrange 
hi DiffAdd guibg=#008000 guifg=#fafafa gui=none
hi DiffAdded guibg=#008000 guifg=#fafafa gui=none
hi DiffChange guibg=#70b2a1 guifg=#fafafa gui=none
hi DiffDelete guibg=#df0000 guifg=#fafafa gui=none
hi EndOfBuffer guifg=#504945 guibg=NONE gui=NONE cterm=NONE
hi Error guifg=#df0000 guibg=#e4e4e4 gui=reverse cterm=reverse
hi Exception guifg=#df0000 guibg=NONE gui=NONE cterm=NONE
hi Folded guifg=#928374 guibg=#121212 gui=NONE cterm=NONE
hi Function	ctermfg=187 ctermbg=NONE cterm=NONE guifg=#d7d7af guibg=NONE gui=NONE
hi Identifier guifg=#e4e4e4 guibg=NONE gui=NONE cterm=NONE
hi Ignore guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi IncSearch guifg=#ffd700 guibg=#000000 gui=reverse
hi Keyword guifg=#ff5f00 guibg=NONE gui=NONE cterm=NONE
hi LineNr guifg=#504945 guibg=NONE gui=NONE cterm=NONE
hi Method guifg=#ffdd00 guibg=NONE gui=bold cterm=bold
hi ModeMsg guifg=#e4e4e4 guibg=NONE gui=NONE cterm=NONE
hi MoreMsg guifg=#fabd2f guibg=NONE gui=bold cterm=bold
hi NonText guifg=#504945 guibg=NONE gui=NONE cterm=NONE
hi Normal guifg=#fafafa guibg=#121212 gui=NONE cterm=NONE
hi NvimDapVirtualText guifg=#70b2a1 guibg=#504945 gui=NONE
hi Operator guifg=#ffffff 
hi Pmenu guifg=#fabd2f guibg=#5a0914 gui=NONE cterm=NONE
hi PmenuExtra guifg=#a89984 guibg=#3c3836 gui=NONE cterm=NONE
hi PmenuExtraSel guifg=#303030 guibg=#83a598 gui=NONE cterm=NONE
hi PmenuKind guifg=#fb4934 guibg=#3c3836 gui=NONE cterm=NONE
hi PmenuKindSel guifg=#fb4934 guibg=#83a598 gui=NONE cterm=NONE
hi PmenuSbar guifg=NONE guibg=#262626 gui=NONE cterm=NONE
hi PmenuSel guifg=#ffffff guibg=#5a0914 gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE guibg=#7c6f64 gui=NONE cterm=NONE
hi Question guifg=orange guibg=NONE gui=NONE cterm=none
hi QuickFixLine guifg=#8ec07c guibg=#1c1c1c gui=reverse cterm=reverse
hi Search guifg=#5f8787 guibg=#e4e4e4 gui=reverse
hi SignColumn guifg=#928374 guibg=#0c0c0c gui=NONE cterm=NONE
hi Special guifg=#ffd700 guibg=NONE gui=NONE cterm=NONE
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
hi String guifg=#79bf46 guibg=NONE gui=NONE cterm=NONE
hi TabLine guifg=#666666 guibg=#0c0c0c gui=NONE cterm=NONE
hi TabLineFill guifg=#ff8787 guibg=#0c0c0c gui=NONE cterm=NONE
hi TabLineSel guifg=#000000 guibg=#afaf87 gui=NONE cterm=NONE
hi Title guifg=#ffdd33 guibg=NONE gui=bold cterm=bold
hi Todo guifg=#df0000 guibg=#ffdd33 gui=NONE cterm=bold
hi ToolbarButton guifg=#fbf1c7 guibg=#303030 gui=bold cterm=bold
hi ToolbarLine guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Type guifg=#afafd7 guibg=NONE gui=NONE cterm=NONE
hi Typedef guifg=#fabd2f guibg=NONE gui=NONE cterm=NONE
hi Underlined guifg=#504945 guibg=NONE gui=underline cterm=underline
hi VertSplit guifg=#fbf1c7 guibg=black gui=NONE cterm=NONE
hi Visual guibg=#504945 gui=NONE cterm=reverse
hi VisualNOS guifg=#d7d787 guibg=#5f8700 gui=NONE cterm=NONE
hi WhichKeyValue guifg=#d16e22
hi WildMenu guifg=#83a598 guibg=#504945 gui=bold cterm=bold
hi diffFile guifg=White
hi diffRemoved guibg=#df0000 guifg=#fafafa gui=none
hi lCursor guifg=#262626 guibg=#ffafaf gui=NONE cterm=NONE


