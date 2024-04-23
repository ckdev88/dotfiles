" Name: Bon Basique
" Description: like Bem Basico, but different
" Author: CK
" Maintainer: CK
" Website: https://ckdev88.github.io
" License: Vim License (see `:help license`)
" Last Updated: Mon 23 Apr 2024 05:36:55 AM -03

hi clear
let g:colors_name = 'bonbasique'

hi! link Boolean String
hi! link CocErrorFloat ErrorMsg 
hi! link CocFloatActive MessageWindow 
hi! link CocFloating MessageWindow
hi! link CocHintFloat MessageWindow 
hi! link CocHintSign MessageWindow 
hi! link CocHintVirtualText MessageWindow 
hi! link CocInlayHint MessageWindow 
hi! link CocInlayHintParameter MessageWindow 
hi! link CocInlayHintType MessageWindow 
hi! link CocListBgBlue Statement
hi! link CocListFgBlue CocFloating
hi! link CocMarkdownLink MessageWindow 
hi! link CocMenuSel PmenuSel
hi! link CocNotificationProgress MessageWindow 
hi! link CocSearch MessageWindow 
hi! link CocVirtualText CocFloating
hi! link CocWarningFloat MessageWindow 
hi! link Conceal Comment
hi! link CurSearch Search
hi! link CursorColumn CursorLine
hi! link Delimiter LineNr
hi! link Directory Method
hi! link FgCocHintFloatBgCocFloating MessageWindow 
hi! link Identifier Conditional
hi! link Include Function
hi! link Label Constant
hi! link MoreMsg MessageWindow
hi! link NonText EndOfBuffer
hi! link PmenuExtra Pmenu
hi! link PopupNotification MessageWindow
hi! link PreProc Constant
hi! link Repeat Statement
hi! link Special Statement
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link Structure Type
hi! link ToolbarButton TabLineSel
hi! link Typedef Type 
hi! link VisualNOS Visual
hi! link WildMenu Pmenu
hi! link htmlEndTag Tag
hi! link htmlH1 Title
hi! link htmlSpecialTagName Tag
hi! link htmlTag Tag
hi! link htmlTagName Tag
hi! link javaScriptLabel Constant
hi! link javaScriptMember Type
hi! link javaScriptNull Type
hi! link lCursor Cursor
hi! link netrwExe Function
hi! link netrwList netrwPlain
hi! link tsxCloseString Tag
hi! link tsxCloseTag Tag
hi! link tsxIntrinsicTagName Tag
hi! link tsxRegion Constant
hi! link tsxTag Tag
hi! link tsxTagName Method
hi! link typescriptArrowFunc typescriptAssign
hi! link typescriptBlock Method
hi! link typescriptBoolean Boolean
hi! link typescriptBraces LineNr
hi! link typescriptCastKeyword Keyword
hi! link typescriptConditional Conditional
hi! link typescriptDOMStorageMethod Method
hi! link typescriptDotNotation LineNr
hi! link typescriptEndColons typescriptDotNotation
hi! link typescriptExport Keyword
hi! link typescriptFuncName Method
hi! link typescriptGlobal Constant
hi! link typescriptImport Conditional
hi! link typescriptJSONStaticMethod Method
hi! link typescriptJSONStaticMethod Method
hi! link typescriptObjectLabel Label
hi! link typescriptParens LineNr
hi! link typescriptStatementKeyword Keyword
hi! link typescriptTypeReference Type
hi! link vimCommand Keyword
hi! link vimFuncBang LineNr
hi! link vimFuncBody LineNr
hi! link vimFuncName Method
hi! link vimHiBang LineNr
hi! link vimHighlight Keyword
hi! link vimUserFunc Method

hi Character 		ctermfg=253 ctermbg=NONE cterm=NONE guifg=#dadada guibg=NONE gui=NONE
hi CocVirtualText 	ctermfg=240 ctermbg=NONE cterm=NONE guifg=NONE guibg=#585858 gui=NONE
hi ColorColumn 		ctermfg=NONE ctermbg=0 cterm=NONE guifg=NONE guibg=#000000 gui=NONE
hi Comment 			ctermfg=246 ctermbg=237 cterm=NONE guifg=#949494 guibg=#303030 gui=NONE
hi Conditional  	ctermfg=202 ctermbg=NONE cterm=NONE guifg=#ff5f00 " guibg=NONE gui=NONE cterm=NONE
hi Constant 		ctermfg=253 ctermbg=NONE cterm=NONE guifg=#dadada guibg=NONE gui=NONE
hi Cursor 			ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffd700 guibg=#000000 gui=NONE
hi CursorIM 		ctermfg=220 ctermbg=0 cterm=NONE guifg=#ffd700 guibg=#000000 gui=NONE
hi CursorLine 		ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#262626 gui=NONE
hi CursorLineFold 	ctermfg=40 ctermbg=235 cterm=bold guifg=#00d700 guibg=#262626 gui=bold
hi CursorLineNr 	ctermfg=NONE ctermbg=235 cterm=bold guifg=NONE guibg=#262626 gui=bold
hi CursorLineSign 	ctermfg=39 ctermbg=235 cterm=bold guifg=#00afff guibg=#262626 gui=bold
hi Debug 			ctermfg=88 ctermbg=NONE cterm=NONE guifg=#870000 guibg=NONE gui=NONE
hi Define 			ctermfg=187 ctermbg=NONE cterm=NONE guifg=#ffafff guibg=NONE gui=NONE
hi DiffAdd 			ctermfg=2 ctermbg=234 cterm=reverse guifg=#008000 guibg=#1c1c1c gui=reverse
hi DiffChange 		ctermfg=4 ctermbg=234 cterm=reverse guifg=#000080 guibg=#1c1c1c gui=reverse
hi DiffDelete 		ctermfg=1 ctermbg=234 cterm=reverse guifg=#800000 guibg=#1c1c1c gui=reverse
hi DiffText 		ctermfg=208 ctermbg=234 cterm=reverse guifg=#ff8700 guibg=#1c1c1c gui=reverse
hi EndOfBuffer 		ctermfg=59 ctermbg=NONE cterm=NONE guifg=#504945 guibg=NONE gui=NONE
hi Error 			ctermfg=124 ctermbg=234 cterm=NONE guifg=#af0000 guibg=#1c1c1c gui=NONE
hi ErrorMsg 		ctermfg=255 ctermbg=124 cterm=NONE guifg=#ffffff guibg=#af0000 gui=NONE
hi Exception 		ctermfg=NONE ctermbg=124 cterm=NONE guifg=#af0000 guibg=NONE gui=NONE
hi Float 			ctermfg=253 ctermbg=NONE cterm=NONE guifg=#dadada guibg=NONE gui=NONE
hi FoldColumn 		ctermfg=40 ctermbg=234 cterm=NONE guifg=#00d700 guibg=#1c1c1c gui=NONE
hi Folded 			ctermfg=40 ctermbg=235 cterm=NONE guifg=#00d700 guibg=#262626 gui=NONE
hi Function 		ctermfg=187 ctermbg=NONE cterm=NONE guifg=#d7d7ad guibg=NONE gui=NONE
hi Ignore 			ctermfg=NONE ctermbg=NONE cterm=NONE guifg=fg guibg=NONE gui=NONE
hi IncSearch 		ctermfg=220 ctermbg=0 cterm=reverse guifg=#ffd700 guibg=#000000 gui=reverse
hi Keyword  		ctermfg=202 ctermbg=NONE cterm=NONE guifg=#ff5f00 guibg=NONE gui=NONE cterm=NONE
hi LineNr 			ctermfg=242 ctermbg=NONE cterm=NONE guifg=#6c6c6c guibg=NONE gui=NONE
hi Macro 			ctermfg=107 ctermbg=NONE cterm=NONE guifg=#afd700 guibg=NONE gui=NONE cterm=NONE
hi MatchParen 		ctermfg=220 ctermbg=NONE cterm=bold guifg=#ffd700 guibg=NONE gui=bold
hi MessageWindow 	ctermfg=254 ctermbg=52 cterm=NONE guifg=#e4e4e4 guibg=#5f0000 gui=NONE
hi Method 			ctermfg=220 ctermbg=NONE cterm=bold guifg=#ffd700 guibg=NONE gui=bold
hi ModeMsg			ctermfg=255 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi Number 			ctermfg=253 ctermbg=NONE cterm=NONE guibg=NONE guifg=#dadada gui=NONE 
hi Normal			ctermfg=254 ctermbg=234	 cterm=NONE guifg=#e4e4e4 guifg=#121212 gui=NONE
hi Operator 		ctermfg=fg ctermbg=NONE cterm=NONE guifg=#afd700 guibg=NONE gui=NONE 
hi Pmenu 			ctermfg=214 ctermbg=52 cterm=NONE   guifg=#ffaf00 guibg=#5f0000 gui=NONE
hi PmenuSel 		ctermfg=255 ctermbg=0 guifg=#ffffff guibg=#000000 gui=NONE cterm=NONE 
hi PmenuThumb 		ctermfg=10  ctermbg=NONE guifg=#00ff00 guibg=#ff00ff gui=NONE cterm=NONE 
hi PreCondit 		ctermfg=148 ctermbg=NONE cterm=NONE guifg=#afd700 guibg=NONE gui=NONE cterm=NONE
hi Question 		ctermfg=208 ctermbg=NONE cterm=NONE guifg=#ff8700 guibg=NONE gui=NONE
hi QuickFixLine 	ctermfg=148 ctermbg=NONE cterm=NONE guifg=#afd700 guibg=#1c1c1c gui=reverse cterm=reverse
hi Search 			ctermfg=254 ctermbg=66 cterm=NONE guifg=#e4e4e4 guibg=#5f8787 gui=NONE
hi SignColumn 		ctermfg=138 ctermbg=233 cterm=NONE guifg=#af8787 guibg=#1c1c1c gui=NONE
hi Special 			ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffd700 guibg=NONE gui=NONE
hi SpellBad 		ctermfg=9   ctermbg=NONE cterm=underline guifg=#ff0000 guibg=NONE guisp=#ff0000 gui=undercurl
hi SpellCap 		ctermfg=220 ctermbg=NONE cterm=underline guifg=#ffd700 guibg=NONE guisp=#ffd700 gui=undercurl 
hi SpellLocal 		ctermfg=148 ctermbg=NONE cterm=underline guifg=#afd700 guibg=NONE guisp=#8ec07c gui=undercurl
hi SpellRare 		ctermfg=213 ctermbg=NONE cterm=underline guifg=#ff87ff guibg=NONE guisp=#ff87ff gui=undercurl 
hi Statement 		ctermfg=220 ctermbg=NONE cterm=bold guifg=#ffd700 guibg=NONE gui=NONE cterm=NONE
hi StatusLine 		ctermfg=0   ctermbg=253 cterm=reverse guifg=#8787af guibg=#dadada gui=reverse
hi StatusLineNC 	ctermfg=240 ctermbg=251 cterm=reverse guifg=#585858 guibg=#c6c6c6 gui=reverse
hi StorageClass 	ctermfg=208 ctermbg=NONE cterm=NONE guifg=#ff8700 guibg=NONE gui=NONE
hi String 			ctermfg=108 ctermbg=NONE cterm=NONE guifg=#87af87 guibg=NONE gui=NONE
hi TabLine 			ctermfg=238 ctermbg=0 cterm=NONE guifg=#444444 guibg=#000000 gui=NONE 
hi TabLineFill 		ctermfg=NONE ctermbg=0 cterm=NONE guifg=NONE guibg=#000000 gui=NONE 
hi TabLineSel 		ctermfg=220 ctermbg=234 cterm=bold guifg=#ffd700 guibg=#1c1c1c gui=bold
hi Tag				ctermfg=254 ctermbg=NONE cterm=NONE guifg=#e4e4e4 guibg=NONE gui=NONE
hi Title 			ctermfg=220 ctermbg=234 cterm=bold guifg=#ffd700 guibg=#1c1c1c gui=bold
hi Todo 			ctermfg=220 ctermbg=238 cterm=bold guifg=#ffd700 guibg=#444444 gui=bold
hi ToolbarLine 		ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE 
hi Type 			ctermfg=146 ctermbg=NONE cterm=NONE guifg=#afafd7 guibg=NONE gui=NONE
hi Underlined 		guifg=#83a598 guibg=NONE gui=underline ctermbg=NONE cterm=underline
hi VertSplit 		ctermfg=236 ctermbg=234 cterm=NONE guifg=#303030 guibg=#1c1c1c gui=NONE
hi Visual 			ctermfg=NONE ctermbg=240 cterm=NONE guifg=NONE guibg=#585858 gui=NONE
hi WarningMsg 		ctermfg=9 ctermbg=NONE cterm=bold guifg=#ff0000 guibg=NONE gui=bold

