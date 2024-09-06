" Name: Bon Basique
" Description: like Bem Basico, but different. Inspired by: Slate, Gruvbox & Gruber Darker
" Author: CK
" Maintainer: CK
" Website: https://ckdev88.github.io
" License: Vim License (see `:help license`)
" Last Updated: 2024-09-04 02:42
" 
hi clear
let g:colors_name = 'bonbasique'

hi! link netrwExe Normal
hi! link netrwList Normal
hi! link tsxAttrib Normal
hi! link typescriptAsyncFuncKeyword Normal
hi! link typescriptBOMWindowProp Normal
hi! link typescriptBoolean Normal
hi! link typescriptDOMDocProp Normal
hi! link typescriptDOMFormProp Normal
hi! link typescriptDestructureVariable Normal
hi! link typescriptFuncCallArg Normal
hi! link typescriptFuncKeyword Normal
hi! link typescriptURLUtilsProp Normal
hi! link typescriptNull Normal
hi! link phpIdentifier Normal
hi! link vimCommentTitle Normal
hi! link vimFgBgAttrib Normal
hi! link vimHiAttrib Normal
hi! link vimHiGroup Normal
hi! link vimGroup Normal
hi Normal			ctermfg=254 ctermbg=233	 cterm=NONE guifg=#e4e4e4 guibg=#121212 gui=NONE

" hi PreProc 			ctermfg=152 ctermbg=NONE cterm=NONE guifg=#cfbfa6 guibg=NONE gui=NONE cterm=NONE
" hi WarningMsg 		ctermfg=9 ctermbg=NONE cterm=bold guifg=#ff0000 guibg=NONE gui=bold
hi! link DiffAdd Added
hi Added 			ctermfg=fg ctermbg=22 cterm=NONE guifg=#005f00 guibg=fg gui=reverse
hi! link DiffChange Changed
hi Changed			ctermfg=fg ctermbg=4 cterm=NONE guifg=#000080 guibg=fg gui=reverse
hi Character 		ctermfg=253 ctermbg=NONE cterm=NONE guifg=#dadada guibg=NONE gui=NONE
hi CocVirtualText 	ctermfg=240 ctermbg=NONE cterm=NONE guifg=#585858 guibg=NONE gui=NONE
hi ColorColumn 		ctermfg=NONE ctermbg=0 cterm=NONE guifg=NONE guibg=#000000 gui=NONE

hi! link Conceal Comment
hi Comment 			ctermfg=246 ctermbg=237 cterm=NONE guifg=#949494 guibg=#3a3a3a gui=NONE

hi! link Identifier Conditional
hi! link typescriptConditional Conditional
hi! link typescriptImport Conditional
hi! link typescriptPromiseMethod Conditional
hi! link phpInclude Conditional
hi Conditional  	ctermfg=202 ctermbg=NONE cterm=NONE guifg=#ff5f00 guibg=NONE gui=NONE cterm=NONE

hi! link typescriptObjectLabel Constant
hi! link Label Constant
hi! link tsxRegion Constant
hi Constant 		ctermfg=253 ctermbg=NONE cterm=NONE guifg=#dadada guibg=NONE gui=NONE
hi! link lCursor Cursor
hi Cursor 			ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffd700 guibg=#000000 gui=NONE
hi CursorIM 		ctermfg=220 ctermbg=0 cterm=NONE guifg=#ffd700 guibg=#000000 gui=NONE

hi! link CursorColumn CursorLine
hi CursorLine 		ctermfg=NONE ctermbg=234 cterm=NONE guifg=NONE guibg=#1c1c1c gui=NONE
hi CursorLineFold 	ctermfg=40 ctermbg=235 cterm=bold guifg=#00d700 guibg=#262626 gui=bold
hi CursorLineNr 	ctermfg=NONE ctermbg=233 cterm=bold guifg=NONE guibg=#1c1c1c gui=bold
hi CursorLineSign 	ctermfg=39 ctermbg=235 cterm=bold guifg=#00afff guibg=#262626 gui=bold
hi Debug 			ctermfg=88 ctermbg=NONE cterm=NONE guifg=#870000 guibg=NONE gui=NONE
hi! link typescriptVariable Define
hi! link typescriptFuncKeyword Define
hi Define 			ctermfg=187 ctermbg=NONE cterm=NONE guifg=#ffafff guibg=NONE gui=NONE
hi DiffText 		ctermfg=fg ctermbg=208 cterm=NONE guifg=#1c1c1c guibg=#ff8700 gui=NONE
hi! link NonText EndOfBuffer
hi EndOfBuffer 		ctermfg=59 ctermbg=NONE cterm=NONE guifg=#504945 guibg=NONE gui=NONE
hi Error 			ctermfg=124 ctermbg=234 cterm=NONE guifg=#af0000 guibg=#1c1c1c gui=NONE
hi ErrorMsg 		ctermfg=255 ctermbg=124 cterm=NONE guifg=#ffffff guibg=#af0000 gui=NONE

hi! link CocErrorFloat Exception
hi! link CocHintFloat Exception
hi! link CocHintSign Exception
hi! link CocHintVirtualText Exception
hi! link CocInlayHint Exception
hi! link CocInlayHintParameter Exception
hi! link CocInlayHintType Exception
hi! link CocWarningFloat Exception
hi! link FgCocHintFloatBgCocFloating Exception
hi! link typescriptExceptions Exception
hi Exception 		ctermfg=15 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE

hi Float 			ctermfg=253 ctermbg=NONE cterm=NONE guifg=#dadada guibg=NONE gui=NONE
hi FoldColumn 		ctermfg=40 ctermbg=234 cterm=NONE guifg=#00d700 guibg=#1c1c1c gui=NONE
hi Folded 			ctermfg=40 ctermbg=235 cterm=NONE guifg=#00d700 guibg=#262626 gui=NONE

hi! link typescriptOperator Function
hi! link PreProc Function
hi! link tsxEscapeJs Function
hi! link typescriptConsoleMethod Function
hi! link typescriptJSONStaticMethod Function
hi! link phpVarSelector Function
hi Function 		ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffd700 guibg=NONE gui=NONE

hi Ignore 			ctermfg=NONE ctermbg=NONE cterm=NONE guifg=fg guibg=NONE gui=NONE
hi IncSearch 		ctermfg=220 ctermbg=0 cterm=reverse guifg=#ffd700 guibg=#000000 gui=reverse

hi! link typescriptTry Keyword
hi! link vimCommand Keyword
hi! link vimHighlight Keyword
hi! link phpDefine Keyword
hi! link phpStatement Keyword 
hi Keyword  		ctermfg=202 ctermbg=NONE cterm=NONE guifg=#afd700 guibg=NONE gui=NONE cterm=NONE

hi! link typescriptFuncComma Delimiter
hi! link typescriptDestructureComma Delimiter
hi! link typescriptTypeAnnotation Delimiter
hi! link Delimiter LineNr
hi! link netrwComma LineNr
hi! link typescriptBraces LineNr
hi! link javascriptBraces LineNr
hi! link typescriptCastKeyword LineNr
hi! link typescriptEndColons LineNr
hi! link typescriptDotNotation LineNr
hi! link typescriptObjectLiteral LineNr
hi! link typescriptParens LineNr
hi! link typescriptTernaryOp LineNr
hi! link typescriptBinaryOp LineNr
hi! link vimFuncBang LineNr
hi! link vimFuncBody LineNr
hi! link vimHiBang LineNr
hi! link phpComparison LineNr
hi LineNr 			ctermfg=242 ctermbg=NONE cterm=NONE guifg=#6c6c6c guibg=NONE gui=NONE

hi Macro 			ctermfg=107 ctermbg=NONE cterm=NONE guifg=#afd700 guibg=NONE gui=NONE cterm=NONE

hi! link CocListFgBlue MessageWindow
hi! link CocVirtualText MessageWindow
hi! link CocMarkdownLink MessageWindow
hi! link CocFloatActive MessageWindow
hi! link CocFloating MessageWindow
hi! link CocNotificationProgress MessageWindow
hi! link CocSearch MessageWindow
hi! link MoreMsg MessageWindow
hi! link PopupNotification MessageWindow
hi MessageWindow 	ctermfg=254 ctermbg=16 cterm=NONE guifg=#e4e4e4 guibg=#000000 gui=NONE

hi! link Directory Method
hi! link cssFunctionName Method
hi! link netrwClassify Method
hi! link tsxEscJs Method
hi! link typescriptBOM Method
hi! link typescriptBlock Method
hi! link typescriptFuncName Method
hi! link typescriptGlobalMethod Method
hi! link vimFuncName Method
hi! link vimUserFunc Method
hi! link phpRegion Method
hi Method 			ctermfg=220 ctermbg=NONE cterm=bold guifg=#ffd700 guibg=NONE gui=bold

hi ModeMsg			ctermfg=255 ctermbg=NONE cterm=NONE guifg=#ffffff guibg=NONE gui=NONE
hi Number 			ctermfg=253 ctermbg=NONE cterm=NONE guibg=NONE guifg=#dadada gui=NONE 
hi Operator 		ctermfg=fg ctermbg=NONE cterm=NONE guifg=#afd700 guibg=NONE gui=NONE 
hi! link PmenuExtra Pmenu
hi! link WildMenu Pmenu
hi Pmenu 			ctermfg=148 ctermbg=16 cterm=NONE   guifg=#ffaf00 guibg=#000000 gui=NONE

hi! link CocMenuSel PmenuSel
hi PmenuSel 		ctermfg=255 ctermbg=66 cterm=none guifg=#ffffff guibg=#5f8787 gui=NONE 

hi PmenuThumb 		ctermfg=10  ctermbg=NONE guifg=#00ff00 guibg=#ff00ff gui=NONE cterm=NONE 
hi PreCondit 		ctermfg=148 ctermbg=NONE cterm=NONE guifg=#afd700 guibg=NONE gui=NONE cterm=NONE
hi Question 		ctermfg=208 ctermbg=NONE cterm=NONE guifg=#ff8700 guibg=NONE gui=NONE
hi QuickFixLine 	ctermfg=148 ctermbg=NONE cterm=NONE guifg=#afd700 guibg=#1c1c1c gui=reverse cterm=reverse
hi! link DiffDelete Removed
hi Removed			ctermfg=88  ctermbg=fg cterm=reverse guifg=#870000 guibg=fg gui=reverse

hi! link CurSearch Search
hi! link matchParen Search
hi Search 			ctermfg=254 ctermbg=66 cterm=NONE guifg=#e4e4e4 guibg=#5f8787 gui=NONE

hi SignColumn 		ctermfg=138 ctermbg=233 cterm=NONE guifg=#af8787 guibg=#1c1c1c gui=NONE
hi Special 			ctermfg=220 ctermbg=NONE cterm=NONE guifg=#ffd700 guibg=NONE gui=NONE
hi SpellBad 		ctermfg=9   ctermbg=NONE cterm=underline guifg=#ff0000 guibg=NONE guisp=#ff0000 gui=undercurl
hi SpellCap 		ctermfg=220 ctermbg=NONE cterm=underline guifg=#ffd700 guibg=NONE guisp=#ffd700 gui=undercurl 
hi SpellLocal 		ctermfg=148 ctermbg=NONE cterm=underline guifg=#afd700 guibg=NONE guisp=#8ec07c gui=undercurl
hi SpellRare 		ctermfg=213 ctermbg=NONE cterm=underline guifg=#ff87ff guibg=NONE guisp=#ff87ff gui=undercurl 

hi! link CocListBgBlue Statement
hi! link Repeat Statement
hi! link Special Statement
hi Statement 		ctermfg=220 ctermbg=NONE cterm=bold guifg=#ffd700 guibg=NONE gui=NONE cterm=NONE

hi! link ToolbarButton TabLineSel
hi TabLineSel 		ctermfg=220 ctermbg=234 cterm=bold guifg=#ffd700 guibg=#1c1c1c gui=bold
hi! link StatusLineTerm StatusLine
hi StatusLine 		ctermfg=254 ctermbg=0 cterm=reverse guifg=#e4e4e4 guibg=#000000 gui=reverse
hi! link StatusLineTermNC StatusLineNC
hi StatusLineNC 	ctermfg=0 ctermbg=238 cterm=reverse guifg=#000000 guibg=#444444 gui=reverse
hi StorageClass 	ctermfg=208 ctermbg=NONE cterm=NONE guifg=#ff8700 guibg=NONE gui=NONE

hi! link typescriptCall String
hi! link typescriptMember String
hi! link tsxCloseTag String
hi! link htmlEndTag String
hi! link htmlTag String
hi! link tsxTag String
hi! link Boolean String
hi String 			ctermfg=249 ctermbg=NONE cterm=NONE guifg=#b4b4bf guibg=NONE gui=NONE

hi TabLine 			ctermfg=238 ctermbg=0 cterm=NONE guifg=#444444 guibg=#000000 gui=NONE 
hi TabLineFill 		ctermfg=NONE ctermbg=0 cterm=NONE guifg=NONE guibg=#000000 gui=NONE 

hi! link htmlSpecialTagName Tag
hi! link htmlTagName Tag
hi! link tsxCloseString Tag
hi! link tsxIntrinsicTagName Tag
hi! link tsxTagName Tag
hi! link typescriptDOMStorageMethod Tag
hi! link typescriptDomDocMethod Tag
hi! link typescriptDomEventTargetMethod Tag
hi Tag				ctermfg=108 ctermbg=NONE cterm=NONE guifg=#95a99f guibg=NONE gui=NONE

hi! link htmlH1 Title
hi! link VimwikiHeader1 Title
hi Title 			ctermfg=220 ctermbg=234 cterm=bold guifg=#ffd700 guibg=#1c1c1c gui=bold

hi Todo 			ctermfg=10  ctermbg=238 cterm=bold guifg=#ffd700 guibg=#444444 gui=bold
hi ToolbarLine 		ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE 

hi! link Structure Type
hi! link Typedef Type 
hi! link cssTagName Type
hi! link typescriptTypeReference Type
hi Type 			ctermfg=60 ctermbg=NONE cterm=NONE guifg=#5f5f87 guibg=NONE gui=NONE

hi Underlined 		guifg=#83a598 guibg=NONE gui=underline ctermbg=NONE cterm=underline
hi VertSplit 		ctermfg=236 ctermbg=234 cterm=NONE guifg=#303030 guibg=#1c1c1c gui=NONE

hi! link VisualNOS Visual
hi Visual 			ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#303030 gui=NONE

hi typescriptGlobal ctermfg=254 ctermbg=NONE cterm=NONE guifg=#e4e4e4 guibg=NONE gui=NONE

hi! link typescriptExport typescriptStatementKeyword
hi typescriptStatementKeyword ctermfg=46 ctermbg=none cterm=none guifg=#00ff00 gui=none
" hi tsxAttrib		ctermfg=103
" hi typescriptFuncCallArg ctermfg=64 ctermbg=none cterm=none guifg=#95a99f guibg=NONE gui=none

hi VimwikiHeader2 ctermfg=208 cterm=bold
hi VimwikiHeader3 ctermfg=4 cterm=bold
hi VimwikiHeader4 ctermfg=107 cterm=bold
hi VimwikiHeader5 ctermfg=103 cterm=bold
hi VimwikiSuperScript ctermfg=220 cterm=reverse,italic  " abused for highlight marking style 1
hi VimwikiBold ctermfg=15 ctermbg=16 cterm=bold guifg=#ffffff guibg=#000000 gui=bold

" color nominees to add: 190
" color nominees to remove: 101
