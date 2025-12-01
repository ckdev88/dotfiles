" Name: BonBasi OLD
" Description: I use this one at home. Inspired by: Slate, Gruvbox, mostly Gruber Darker
" Author: CK
" Maintainer: CK
" Website: https://ckdev88.github.io
" License: Vim License (see `:help license`)
" Last Updated: 2025-05-13 05:28

" File: bonbasi.vim
" Author: Ckdev
" Description: I use this one myself. Inspired by: Slate, Gruvbox, mostly Gruber Darker
" Last Modified: May 17, 2025

hi clear
let g:colors_name = 'bonbasi'

" variable colors

" NEW SCHEME
"
" base colors
" quartz #95a99f
" brown #a9a58f
" gray #97a8ae
" mint #83a194
" greendry #83a194
" graymat #8e969b
" grayred #a9a6a7
" turquoise #93b2b1

let s:black1 = [232,'#080808'] " .03
let s:black2 = [233,'#121212'] " .07
let s:black3 = [234,'#1c1c1c'] " .11
let s:black4 = [235,'#262626'] " .15
let s:black5 = [237,'#3a3a3a'] " .23
let s:creme = [229,'#f3f2cc']
let s:orangedark = [208,'#ff8700']
let s:orangedarker = [208,'#dd6500'] " TODO: mod 208
let s:deepskyblue = [103,'#7979a0']
let s:gold = [220,'#ffd700']

let s:gray1 = [242,'#6c6c6c']
let s:gray2 = [254,'#e4e4e4']
let s:gray3 = [238,'#444444']
let s:gray4 = [240,'#585858']
let s:gray5 = [246,'#949494']
let s:gray6 = [10,'#9ca7a9'] " TODO: mod 10

let s:green1 = [10,'#00ff00'] " .5
let s:green2 = [22,'#005f00'] " .19
let s:green3 = [40,'#00d700'] " .42 
let s:green4 = [2,'#008000'] " .25
let s:green5 = [108,'#95a99f'] " .62 very matte (quartz)
let s:green6 = [112,'#8ec07c'] " .62 more greenish
let s:green7 = [65,'#53655c'] " .36 dark greenblueish
let s:green8 = [71,'#8ba986'] " .59 light matte
let s:green9 = [43,'#83a598'] " .58 light matte green blueish
let s:green10 = [43,'#adc2aa'] " .71 light matte green
let s:green11 = [43,'#44ff44'] " .71 light matte green
let s:maroon = [1,'#800000'] " .25
let s:navy = [4,'#000080']
let s:orange = [214,'#ffaf00']
let s:orangered = [202,'#ff5f00']
let s:orchid = [213,'#ff87ff']
let s:paletpurple = [103,'#7979a0']
let s:paleturquoise =  [66,'#5f8787']
let s:red1 = [9,'#ff0000']
let s:red2 = [88,'#870000']
let s:red3 = [124,'#af0000']
let s:red4  = [9,'#ff0029'] " gold > analogous > analogous
let s:rosybrown = [138,'#af8787']
" let s:rosybrown = [138,'#ff0000']  " quartzc
let s:turquoise = [45,'#58c4dc']
let s:white1 = [15,'#ffffff'] " 1
let s:white2 = [253,'#dadada'] " .85
let s:yellow0 = [11,'#ffff00']
let s:yellow1 = [148,'#afd700']
let s:brown = [172,'#cc8c3c']
let s:quartz04 = [108,'#dfe5e2'] " TODO: mod 108
let s:quartz03 = [108,'#cad4cf'] " TODO: mod 108
let s:quartz02 = [108,'#b4c2bb'] " TODO: mod 108
let s:quartz01 = [108,'#aabab2'] " TODO: mod 108
let s:quartz = [108,'#95a99f']
let s:quartz1 = [108,'#86988f'] " TODO: mod 108
let s:quartz2 = [108,'#77877f'] " TODO: mod 108
let s:quartz3 = [108,'#68766f'] " TODO: mod 108
let s:niagara01=[147,'#abb7d3'] " TODO: mod 147
let s:niagara=[147,'#96a6c8']
let s:niagara1=[147,'#7884a0'] " TODO: mod 147
let s:niagara2=[147,"#565f73"] " TODO: mod 147
let s:niagara3=[147,"#303540"] " TODO: mod 147
let s:niagara8=[147,"#1e2128"] " TODO: mod 147
let s:niagara9=[147,"#0f1014"] " TODO: mod 147
let s:greengb=[10,"#73c936"] " TODO: mod 10

let s:wisteria = [108,'#9e95c7']
let s:wisteria8 = [108,'#1f1d27'] " TODO: mod 108
let s:wisteria9 = [108,'#0f0e13'] " TODO: mod 108

" let s:bluegh01 = [108,'#00ffd7'] " TODO: mod 108
let s:bluegh01 = [108,'#ff5700'] " TODO: mod 108
let s:bluegh = [108,'#4493f8'] " TODO: mod 108

let s:NONE = ['NONE','NONE']

" analogous of #ffd700
let s:greena=['10','#a8ff00'] " TODO: mod 10
let s:orangea=['10','#ff5700'] " TODO: mod 10

" triadous of #ffd700
let s:cyant=['10','#00ffd7'] " TODO: mod 10
" magenta: #d700ff

" complimentous of #ffd700
let s:bluec=['10','#0028ff'] " TODO: mod 10
let s:blueca=['10','#00a8ff'] " bluec analogous ... TODO: mod 10
let s:quartzc=['10','#a9959f'] " quartz complimentary ... TODO: mod 10

" LEGEND of added letters:
" c: complimentary
" a: analogous
" t: triadous
" see: https://www.color-hex.com/color/ffd700

let s:fg = s:white1
let s:bg = s:wisteria9

function! <sid>hi(group, fg=[], bg=[], attr="")
  if !empty(a:fg)
    exec "hi " . a:group . " ctermfg=" . a:fg[0]
    exec "hi " . a:group . " guifg=" .  a:fg[1]
  endif
  if !empty(a:bg)
    exec "hi " . a:group . " ctermbg=" . a:bg[0]
    exec "hi " . a:group . " guibg=" .  a:bg[1]
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" .   a:attr
    exec "hi " . a:group . " cterm=" . a:attr
  endif
endfunction



" call <sid>hi('Identifier',s:brown,'','bold')
" call <sid>hi('typescriptGlobal',s:green8)
call <sid>hi('AliasKeyword',s:creme,'','BOLD')
call <sid>hi('Boolean',s:red4,'','')
call <sid>hi('Changed',s:navy,s:white1,'reverse')
call <sid>hi('Character',s:white2,'','NONE')
call <sid>hi('CocErrorVirtualText',s:red1,s:black4,'')
call <sid>hi('CocFloatingDiagnostic','',s:red2)
call <sid>hi('CocFloatingDiagnosticBorder',s:yellow0,s:white1)
call <sid>hi('CocListLine',s:NONE,s:NONE,'NONE')
call <sid>hi('CocVirtualText',s:gray4)
call <sid>hi('Comment',s:gray5,s:black5)
call <sid>hi('Conceal',s:fg,s:gray4,'underline')
call <sid>hi('Constant',s:white2)
call <sid>hi('CssAttrRegion',s:quartz)
call <sid>hi('phpStaticClasses',s:quartz01)
call <sid>hi('vue_typescript',s:quartz)
call <sid>hi('phpFunction',s:quartz04)
call <sid>hi('phpFunctions',s:quartz04)
call <sid>hi('phpMethod',s:quartz04)
call <sid>hi('Cursor',s:gold)
call <sid>hi('CursorLine',s:NONE,s:NONE,'NONE')
call <sid>hi('CursorLineFold',s:green3,s:black4,'bold')
call <sid>hi('CursorLineNr',s:fg,s:NONE,'NONE')
call <sid>hi('CursorLineSign',s:deepskyblue,s:black4,'bold')
call <sid>hi('Debug',s:red2,s:NONE,'NONE')
call <sid>hi('DiffAdded',s:white1,s:green4,'NONE')
call <sid>hi('DiffChange',s:NONE,s:gray3,'NONE')
call <sid>hi('DiffText',s:white1,s:orangedarker,'NONE')
call <sid>hi('defineVariable',s:orangea,s:NONE,'bold')
call <sid>hi('EndOfBuffer',s:bg)
call <sid>hi('Error',s:red3,s:black3,'NONE')
call <sid>hi('ErrorMsg',s:white1,s:red3,'NONE')
call <sid>hi('Float',s:white2,s:NONE,'')
call <sid>hi('FoldColumn',s:green3 ,s:black3,'NONE')
call <sid>hi('Folded',s:green3,s:black4,'NONE')
call <sid>hi('FuncName',s:quartz04)
call <sid>hi('HighlightedyankRegion',s:black1,s:gold,'')
call <sid>hi('Identifier',s:fg)
call <sid>hi('IncSearch',s:gold,s:black1,'reverse')
call <sid>hi('Keyword',s:gold,s:NONE,'bold')
call <sid>hi('Macro',s:yellow1,s:NONE,'NONE')
call <sid>hi('MatchParen',s:fg,s:bluegh,'bold')
call <sid>hi('MessageWindow','',s:maroon,'NONE')
call <sid>hi('Method',s:fg,s:NONE,'NONE')
call <sid>hi('ModeMsg',s:white1,s:NONE,'NONE')
call <sid>hi('Normal',s:fg,s:bg,'NONE')
call <sid>hi('Number',s:white2,s:NONE,'NONE')
call <sid>hi('Pmenu','',s:maroon,'NONE')
call <sid>hi('PmenuSel',s:white1,s:paleturquoise,'NONE')
call <sid>hi('PreCondit',s:yellow1,s:NONE,'NONE')
call <sid>hi('Question',s:orangedark,s:NONE,'bold')
call <sid>hi('QuickfixActive','',s:paleturquoise,'NONE')
call <sid>hi('QuickfixLine','',s:paleturquoise,'NONE')
call <sid>hi('Removed',s:red2,s:fg,'reverse')
call <sid>hi('RubyRoute',s:green5,'','')
call <sid>hi('RubySymbol',s:green5,'','')
call <sid>hi('Search',s:fg,s:paleturquoise,'NONE')
call <sid>hi('SignColumn',s:rosybrown ,s:black3,'NONE')
call <sid>hi('SpellBad',s:red1,s:NONE,'underline')
call <sid>hi('SpellCap',s:gold,s:NONE,'underline')
call <sid>hi('SpellLocal',s:yellow1,s:NONE,'underline')
call <sid>hi('SpellRare',s:orchid,s:NONE,'underline')
call <sid>hi('Statement',s:gold,s:NONE,'NONE')
call <sid>hi('StatusLine',s:gray2,s:black1,'reverse')
call <sid>hi('StatusLineNC',s:black1,s:gray3,'reverse')
call <sid>hi('String',s:green6,s:NONE,'NONE')
" call <sid>hi('phpStringSingle',s:greengb,s:NONE,'NONE')
call <sid>hi('Subtle',s:gray1,s:NONE,'NONE')
call <sid>hi('TabLine',s:gray3,s:black1,'NONE')
call <sid>hi('TabLineFill',s:NONE,s:black1,'NONE')
call <sid>hi('TabLineSel',s:gold,s:black3,'bold')
call <sid>hi('Title',s:gold,s:black3,'bold')
call <sid>hi('Todo',s:green1,s:gray3,'bold')
call <sid>hi('Todo2',s:gold,s:gray3,'bold')
call <sid>hi('Todo3',s:red1,s:gray3,'bold')
call <sid>hi('Todo4',s:orangered,s:gray3,'bold')
call <sid>hi('Type',s:wisteria,s:NONE,'NONE')
call <sid>hi('Underlined',s:turquoise,s:NONE,'underline')
call <sid>hi('VertSplit',s:black3,s:black3,'NONE')
call <sid>hi('VimwikiSuperScript',s:gold,s:NONE,'reverse,italic')
call <sid>hi('Visual',s:fg,s:paleturquoise,'') 
call <sid>hi('cssIdentifier',s:quartz)
call <sid>hi('diffRemoved',s:white1,s:red2,'NONE')
call <sid>hi('erubyExpression',s:green5)
" call <sid>hi('htmlTag',s:niagara01)
call <sid>hi('htmlTag',s:rosybrown)
" call <sid>hi('htmlArg',s:niagara01)

" call <sid>hi('htmlArg',s:quartz03)
call <sid>hi('htmlStrike',s:black5)
" call <sid>hi('htmlString',s:niagara1)
" call <sid>hi('htmlTag',s:fg)
call <sid>hi('javascriptBraces',s:quartz3)
call <sid>hi('markdownBold',s:green11,s:black1,'bold')
call <sid>hi('markdownCode',s:green1)
call <sid>hi('markdownH2',s:orangedark,'','bold')
call <sid>hi('markdownH3',s:turquoise,'','bold')
call <sid>hi('markdownH4',s:green6,'','bold')
call <sid>hi('markdownH5',s:orchid,'','bold')
call <sid>hi('shRepeat',s:green1)
call <sid>hi('tsxTagName',s:turquoise)
call <sid>hi('typescriptBranch',s:red3)
call <sid>hi('typescriptDocParamType',s:wisteria,s:black5)
call <sid>hi('typescriptDocTags',s:gold,s:black5)
call <sid>hi('typescriptObjectLiteral',s:quartz,s:NONE,'NONE')
call <sid>hi('typescriptObjectLabel',s:quartz,s:NONE,'NONE')
call <sid>hi('typescriptStatementKeyword',s:greena,s:NONE,'bold')


" hi! link Repeat Statement
" hi! link RubyRepeat FuncName
" hi! link typescriptDomNodeMethod Method

" hi! link typescriptCall Constant
" hi! link typescriptInterfaceKeyword AliasKeyword
" hi! link typescriptVariable Identifier
hi! link Class Keyword
hi! link phpClasses Keyword
" hi! link phpMethodsVar Keyword
hi! link CocErrorFloat Exception
hi! link CocFloatActive MessageWindow
hi! link CocFloating MessageWindow
hi! link CocHintFloat Exception
hi! link CocHintSign Exception
hi! link CocHintVirtualText Exception
hi! link CocInlayHint Exception
hi! link CocInlayHintParameter Exception
hi! link CocInlayHintType Exception
hi! link CocListBgBlue Statement
hi! link CocListFgBlue MessageWindow
hi! link CocMarkdownLink MessageWindow
hi! link CocMenuSel PmenuSel
hi! link CocNotificationProgress MessageWindow
hi! link CocSearch MessageWindow
hi! link CocWarningFloat Exception
hi! link ColorColumn CocListLine
hi! link Conditional Keyword
hi! link cssBorderProp cssStyle
hi! link cssBackgroundProp cssStyle
hi! link cssPseudoClassId cssStyle
hi! link CurSearch Search
hi! link CursorIM Cursor
hi! link Define Subtle
hi! link BladeDelimiter Delimiter
hi! link BladeKeyword Keyword
hi! link Delimiter Subtle
hi! link DiffAdd DiffAdded
hi! link DiffDelete Removed
hi! link Directory Normal
hi! link FgCocHintFloatBgCocFloating Exception
hi! link Label Constant
hi! link LineNr Subtle
hi! link MoreMsg MessageWindow
hi! link NonText EndOfBuffer
hi! link PmenuExtra Pmenu
hi! link PmenuThumb	CocListLine
hi! link PopupNotification MessageWindow
hi! link PreProc Normal
hi! link RubyClass Class
hi! link RubyControl Keyword
hi! link RubyDefine Keyword
hi! link RubyInstanceVariable FuncName
hi! link RubyMethodName FuncName
hi! link RubyPredefinedConstant typescriptObjectLiteral
hi! link RubyViewHelper Keyword
hi! link Special Type
hi! link SpecialKey Pmenu
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link StorageClass Question
hi! link Structure Type
hi! link ToolbarButton TabLineSel
hi! link Typedef Type 
hi! link VimWikiDelText htmlStrike
hi! link VimwikiBold markdownBold
hi! link VimwikiCode markdownCode
hi! link VimwikiHeader2 markdownH2
hi! link VimwikiHeader3 markdownH3
hi! link VimwikiHeader4 markdownH4
hi! link VimwikiHeader5 markdownH5
hi! link VisualNOS Visual
hi! link WildMenu Pmenu
hi! link cssAtKeyword Keyword
hi! link cssBraces Subtle
hi! link cssClassName defineVariable
hi! link cssClassNameDot defineVariable
hi! link cssCustomProp cssIdentifier
hi! link cssFunctionName FuncName
hi! link cssPseudoClassId Constant
hi! link cssTagName Type
hi! link fugitiveSymbolicRef Keyword
hi! link htmlArg htmlTag
" hi! link htmlTag htmlArg
" hi! link htmlTagName htmlArg
hi! link htmlEndTag htmlTag
hi! link vueSurroundingTag htmlTag
hi! link htmlEventDQ String
" hi! link htmlString String
hi! link htmlH1 Title
hi! link htmlTagN tsxTagName
hi! link htmlTagName htmlTag 
hi! link htmlScriptTag htmlTag
hi! link htmlSpecialTagName htmlTag
hi! link htmlSpecialChar Normal
hi! link javaScript Normal
hi! link javaScriptGlobal Normal
hi! link javaScriptMember Normal
hi! link javascriptFunction Keyword
hi! link javascriptIdentifier Identifier
hi! link jsOperator javascriptOperator
hi! link javascriptOperator generalOperator
hi! link shOperator generalOperator
hi! link javascriptReserved Keyword
hi! link javascriptStatement Keyword
hi! link jsonQuote Subtle
hi! link lCursor Cursor
hi! link netrwClassify Method
hi! link netrwComma Subtle
hi! link netrwDir Keyword
hi! link netrwExe Normal
hi! link netrwList Normal
hi! link phpComparison Subtle
hi! link phpDefine Keyword
hi! link phpIdentifier Identifier
hi! link phpInclude Keyword
hi! link phpRegion FuncName
hi! link phpStatement Keyword 
hi! link phpOperator generalOperator
hi! link phpVarSelector Normal
" hi! link phpStaticClasses FuncName
hi! link shOption FuncName
hi! link phpMethodsVar FuncName
hi! link shQuote String
hi! link shVariable FuncName
hi! link tsxAttrib Normal
hi! link tsxCloseString htmlTag
hi! link tsxEscJs Keyword
hi! link tsxEscapeJs Normal
hi! link tsxRegion Constant
hi! link tsxTag htmlTag
hi! link typescriptAliasDeclaration Normal
hi! link typescriptArrayMethod Method
hi! link typescriptArrowFunc Normal
hi! link typescriptAsyncFuncKeyword Subtle
hi! link typescriptBOM Method
hi! link typescriptBOMWindowMethod Method
hi! link typescriptBOMWindowProp Normal
hi! link typescriptBlock Normal
hi! link typescriptBomLocationMethod Method
hi! link typescriptBoolean Boolean
hi! link jsFuncBraces javascriptBraces
hi! link jsIfElseBraces javascriptBraces
hi! link typescriptBraces javascriptBraces
hi! link typescriptCacheMethod Method
hi! link typescriptCase Keyword
hi! link typescriptCastKeyword Subtle
hi! link typescriptConditional Keyword
hi! link typescriptConditional Keyword
hi! link typescriptConsoleMethod Method
hi! link typescriptConsoleMethod typescriptGlobal
hi! link typescriptDOMDocProp Normal
hi! link typescriptDOMEventProp htmlTag
hi! link typescriptDOMFormProp Normal
hi! link typescriptDOMStorageMethod Method
hi! link typescriptDateMethod Method
hi! link typescriptDateStaticMethod Method
hi! link typescriptDefault Keyword
hi! link typescriptDestructureComma Subtle
hi! link typescriptDestructureVariable typescriptVariableDeclaration
hi! link typescriptDocNamedParamType typescriptDocParamType
hi! link typescriptDocNotation typescriptDocTags
hi! link typescriptDomDocMethod Method
hi! link typescriptDomEventTargetMethod Method
hi! link typescriptDotNotation Subtle
hi! link typescriptEndColons Subtle
hi! link typescriptExceptions Exception
hi! link typescriptExport Keyword
hi! link typescriptFuncCallArg Constant
hi! link typescriptFuncComma Subtle
hi! link typescriptFuncKeyword Keyword
hi! link typescriptFuncName FuncName
hi! link typescriptFuncTypeArrow typescriptArrowFunc
hi! link typescriptGlobal Normal
hi! link typescriptGlobalConsoleDot typescriptDotNotation 
hi! link typescriptGlobalMethod Method
hi! link typescriptHeadersMethod Method
hi! link typescriptImport Keyword
hi! link typescriptInterfaceName typescriptAliasDeclaration
hi! link typescriptJSONStaticMethod Method
hi! link typescriptMember Normal
hi! link typescriptNull Boolean
" hi! link typescriptObjectLabel Constant
hi! link typescriptOperator generalOperator
hi! link jsParens typescriptParens
hi! link phpParent typescriptParens
hi! link typescriptParens javascriptBraces
hi! link phpMemberSelector javascriptBraces
hi! link typescriptPaymentShippingOptionProp Normal
hi! link typescriptPromiseMethod Keyword
hi! link typescriptProperty Subtle
hi! link typescriptRepeat Keyword
" hi! link typescriptStatementKeyword Keyword
hi! link typescriptStringMethod Method
hi! link typescriptTernaryOp Subtle
hi! link typescriptTry Keyword
hi! link typescriptTypeAnnotation Subtle
hi! link typescriptTypeReference Type
hi! link typescriptURLStaticMethod Method
hi! link typescriptURLUtilsProp Normal
hi! link typescriptUnion TypescriptAssign
hi! link vimCommand Keyword
hi! link vimCommentTitle Normal
hi! link vimFgBgAttrib Normal
hi! link vimFuncBang Subtle
hi! link vimFuncBody Subtle
hi! link vimFuncKey Keyword
hi! link vimFuncName FuncName
hi! link vimFuncParam Constant
hi! link vimGroup Normal
hi! link vimHiAttrib Normal
hi! link vimHiBang Subtle
hi! link vimHiGroup Normal
hi! link vimOption Normal
hi! link vimTodo Todo
hi! link vimUserFunc Method
hi! link vimVar Normal
hi! link yamlBlockMappingKey Keyword

" link to custom definition
hi! link typescriptVariable defineVariable
hi! link jsStorageClass defineVariable
hi! link generalOperator Normal


" TODO: define list
" CursorColumn ... ', ctermfg=60 ctermbg=fg cterm=reverse '.blackred_fg.' guibg=fg gui=reverse'
" link CursorColumn CursorLine
" hi typescriptVariableDeclaration ctermfg=fg ctermbg=NONE cterm=NONE guifg=fg guibg=NONE gui=NONE
" hi DiffChange ctermfg=fg ctermbg=bg cterm=NONE guibg=bg gui=NONE
" hi Ignore ctermfg=NONE ctermbg=NONE cterm=NONE guifg=fg guibg=NONE gui=NONE
" hi Operator ctermfg=fg ctermbg=NONE cterm=NONE guifg=fg guibg=NONE gui=NONE" hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
" define Exception
