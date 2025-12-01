vim9script

# Name: BonBasi
# Description: I use this one at home. Inspired by: Slate, Gruvbox, mostly Gruber Darker
# Works only with vim9+ and terminals supporting hex color codes
# Author: CK
# Maintainer: CK
# Website: https_//ckdev88.github.io
# License: Vim License (see `:help license`)
# Last Updated: 2025-10-13 23:31

hi clear
g:colors_name = 'bonbasi'

# Base Colors_ Bright
var s_gold = '#ffd700'
var s_blue = '#0028ff' # gold complimentary
var s_springbud = '#a8ff00' # gold analogous - green yellow
var s_harlequin = '#29ff00' # springbud analogous - bright green
var s_seagull = '#99C1D6'
var s_internationalorange: string = '#ff5700' # gold analogous
var s_torchred = '#ff0029' # internationalorange analogous
var s_venetianred = '#bf001e' # torchred analogous
var s_darkpastelgreen = '#00bf1e' # venetianred GRB
var s_deepskyblue = '#00d7ff' # gold BGR

# Base Colors Brightness_ tints
var s_birdflower = '#ccac00' # gold tint, 1 darker
var s_carmine = '#990018' # venetianred shade+1
var s_green = '#007a13' # darkpastelgreen shade+2

# Base Colors_ Matte
var s_towergrey = '#95a99f' # quartz  - gruber
var s_zorba = '#a99f95' # towergrey triadic
var s_eagle = '#a9a58f'
var s_botticelli = '#97a8ae'
var s_acapulco = '#83a194'
var s_bouquet = '#A18394' # acapulco GRB
var s_balihai = '#8e969b'
var s_shadylady = '#a9a6a7'
var s_lily = '#baaab2' # shadylady tint 1
var s_conch = '#93b2b1' 

# Gold: Monochromatic
var s_goldmono = '#bfa100' # gold mono 4
var s_goldmonoshade1 = '#998100'
var s_goldmonoshade2 = '#7A6700'
var s_goldmonoshade3 = '#625200'
var s_mairemono3 = '#6A6960'
var s_mairemono3tint5 = '#cecdca'
var s_mairemono3shade2 = '#44433E'
var s_harp = '#baaab2' # gold mono 0 > analogous > monochromatic 0 > shade 1

# Deepskyblue: Monochromatic
var s_deepskybluemono = '#00A1BF'
var s_deepskybluemonoshade1 = '#008199' # gold BGR

# Base Colors Matte: tints
# var s_maire = '#161200' # gold shade-11
var s_swamp = '#141616' # towergrey shade-9
var s_maire = '#1b1700' # gold shade 10
var s_mairelight = '#2A2400' # gold shade 9
var s_mairedark = '#161200'
var s_mairedarker = '#0e0b00'
var s_woodsmoke = '#313735' # towergrey shade-5
var s_swansdown = '#ffffff' # towergrey shade+5
var s_taupegrey = '#878586' # shadylady shade-1
var s_scorpion = '#6C6A6B' # shadylady shade-2
var s_norway = '#9FA995' # towergrey BGR
var s_greychateau = '#959FA9' # towergrey RBG

# Misc Colors_
var s_lime = '#00ff00'
var s_grubergreen = '#73c936' 

var s_black = '#000000'
var s_black1 = '#080808'
var s_black2 = '#121212'
var s_black3 = '#1c1c1c'
var s_black4 = '#262626'
var s_orangedark = '#ff8700'

var s_gray1 = '#6c6c6c'
var s_gray2 = '#e4e4ef' # gruber fg
var s_gray3 = '#444444'
var s_gray4 = '#585858'
var s_gray5 = '#949494'

var s_gd_bg01 =   '#101010'
var s_gd_bg   =   '#181818'
var s_gd_bg1  =   '#282828'
var s_gd_bg2  =   '#453d41'
var s_gd_bg3  =   '#484848'
var s_gd_bg4  =   '#52494e'

var s_bb_bg = '#1b1718'

var s_green3 = '#00d700' # .42 
var s_green5 = '#95a99f' # .62 very matte (towergrey)
var s_green11 = '#44ff44' # .71 light matte green
var s_maroon = '#800000' # .25
var s_sealbrown = '#520000' # .25 maroon tint+2
var s_navy = '#000080'
var s_orange = '#ffaf00'
var s_orangered = '#ff5f00'
var s_orchid = '#ff87ff'
var s_paletpurple = '#7979a0'
var s_paleturquoise =  '#5f8787'
var s_red1 = '#ff0000'
var s_red2 = '#ff0029'
var s_red3 = '#af0000'
var s_red4 = '#b3001d' # gold > analogous > analogous
var s_rosybrown = '#af8787'
# var s_rosybrown = '#ff0000'  # towergreyc
var s_turquoise = '#58c4dc'
var s_lightblue = '#00a8ff' #Deep Sky Blue
var s_glacier = '#71a4bf' 
var s_white0 = '#ffffff'
var s_white1 = '#f5f5f5' # gruber fg+2
var s_white2 = '#f4f4ff' # gruber fg+1
var s_white3 = '#e4e4ef' # gruber fg
var s_white4 = '#aab2ba'
var s_white5 = '#fafafa'
var s_yellow0 = '#ffff00'
var s_yellow1 = '#afd700'
var s_brown = '#cc8c3c'              # gruber

var s_quartz01 = '#aabab2'
var s_niagara = '#96a6c8'            # gruber
var s_niagara1 = '#7884a0'
var s_niagara2 = '#565f73'          # gruber
var s_niagara3 = '#303540'           # gruber         
var s_niagara8 = '#1e2128'
var s_niagara9 = '#0f1014'
var s_greengb = '#73c936' 

# var s_vue_blue = '#34495E'
# var s_vue_mint = '#42b883'


var s_wisteria = '#9e95c7'          # gruber
# var s_wisteria01 = '#655F7F'
# var s_wisteria01 = '#766F95'
var s_wisteria01 = '#7E779F'
var s_wisteria9 = '#0f0e13'

var s_bluegh = '#4493f8'

var s_NONE = 'NONE'

# analogous of #ffd700
var s_greena =  '#a8ff00'
var s_orangea =  '#ff5700' 

var s_acht = '#808080'
var s_acht_reversed = '#c0c0c0'
var s_c8 = '#c8c8c8'
var s_b8 = '#b8b8b8'

# triadous of #ffd700
var s_cyant = '#00ffd7' 

# misc
var s_faffie = '#babccf'

var s_fg = s_white2
var s_bg = s_bb_bg

def Hi(group: string, fg: string = '', bg: string = '', attr: string = '')
  var cmd = 'hi ' .. group
  if !empty(fg)
    cmd ..= ' guifg=' .. fg
  endif
  if !empty(bg)
    cmd ..= ' guibg=' .. bg
  endif
  if !empty(attr) 
    cmd ..= ' gui=' .. attr  .. ' cterm=' .. attr
  endif
  execute cmd
enddef

# Hi('Constant', s_swansdown)
# Hi('typescriptBOMWindowMethod', s_lily)
# Hi('typescriptConditional', s_quartz01, s_NONE, 'bold')
Hi('AliasKeyword', s_internationalorange, '', 'BOLD')
Hi('Boolean', s_bouquet)
Hi('Changed', s_navy, s_white1, 'reverse')
Hi('Character', s_white2, '', 'NONE')
Hi('CocErrorVirtualText', s_red1, s_black4, '')
Hi('CocFloatingDiagnostic', '', s_red2)
Hi('CocFloatingDiagnosticBorder', s_yellow0, s_white1)
Hi('CocInlayHintParameter', s_white1, s_red1)
Hi('CocListLine', s_NONE, s_NONE, 'NONE')
Hi('ColorColumn', s_NONE, s_mairedark, 'NONE')
Hi('CocVirtualText', s_gray4)
Hi('Comment', s_gray5, s_woodsmoke)
Hi('Conceal', s_fg, s_gray4, 'underline')
Hi('Constant', s_fg, s_NONE, 'NONE')
Hi('Cursor', s_gold)
Hi('CursorLine', s_NONE, s_mairedarker, 'none')
Hi('CursorLineFold', s_green3, s_black4, 'bold')
Hi('CursorLineNr', s_fg, s_NONE, 'none')
Hi('CursorLineSign', s_red2, s_NONE, 'bold')
Hi('Debug', s_red2, s_NONE, 'NONE')
Hi('DiffAdded', s_white1, s_green, 'NONE')
Hi('DiffChange', s_NONE, s_gray3, 'NONE')
Hi('DiffText', s_white1, s_internationalorange, 'NONE')
Hi('EndOfBuffer', s_bg)

Hi('SpecialKey', s_scorpion)
Hi('Include', s_acapulco)
Hi('DiffSubName', s_orangea)

Hi('tsxEscJs', s_zorba)
Hi('tsxEscapeJs', s_zorba)

Hi('ErrorMsg', s_white1, s_red3, 'NONE')
Hi('Exception', s_torchred, '', 'bold')
Hi('Float', s_white2, s_NONE, '')
Hi('FoldColumn', s_green3, s_black3, 'NONE')
Hi('Folded', s_green3, s_black4, 'NONE')
Hi('FuncName', s_fg, '', 'bold')
Hi('HighlightedyankRegion', s_bg, s_gold)
# Hi('Identifier', s_turquoise, '', 'NONE')
# Hi('Identifier', s_white2, s_red3, 'NONE')
Hi('IncSearch', s_gold, s_bg, 'reverse')
Hi('Macro', s_yellow1, s_NONE, 'NONE')

Hi('MatchParen', s_orangea, s_NONE, 'bold')

Hi('MessageWindow', '', s_sealbrown, 'NONE')
Hi('Pmenu', '', s_sealbrown, 'NONE')

Hi('ModeMsg', s_white1, s_NONE, 'NONE')
Hi('Normal', s_fg, s_bg, 'NONE')
Hi('Number', s_white2, s_NONE, 'NONE')
Hi('PmenuSel', s_white1, s_paleturquoise, 'NONE')
Hi('PreCondit', s_yellow1, s_NONE, 'NONE')
Hi('Question', s_orangedark, s_NONE, 'bold')
Hi('QuickfixActive', '', s_paleturquoise, 'NONE')
Hi('QuickfixLine', '', s_niagara2, 'NONE')
Hi('Removed', s_carmine, s_fg, 'reverse')
Hi('Search', s_fg, s_paleturquoise, 'NONE')
Hi('SignColumn', s_rosybrown, s_bg, 'NONE')
Hi('SpellBad', s_white1, s_red1, 'underline')
Hi('SpellCap', s_gold, s_NONE, 'underline')
Hi('SpellLocal', s_yellow1, s_NONE, 'underline')
Hi('SpellRare', s_orchid, s_NONE, 'underline')

# Hi('htmlArg', s_acht)
# Hi('htmlString', s_acht_reversed)

Hi('Statement', s_gold, '', 'bold') # TODO: EXPERIMENTAL
Hi('TabLineSel', s_bg, s_lime, 'NONE')

Hi('StatusLine', s_maroon, s_fg, 'reverse')
Hi('StatusLineTerm', s_maroon, s_fg, 'reverse')

Hi('StatusLineNC', s_sealbrown, s_rosybrown, 'reverse')
Hi('StatusLineTermNC', s_sealbrown, s_rosybrown, 'reverse')

Hi('String', s_grubergreen, s_NONE, 'NONE')

# Hi('Subtle', s_gray1, s_NONE, 'NONE')

Hi('TabLine', s_gray3, s_black1, 'NONE')
Hi('TabLineFill', s_NONE, s_black1, 'NONE')
Hi('TexSuperscript', s_gold, s_NONE, 'reverse') #  'reverse, italic'
Hi('Todo', s_lime, s_woodsmoke, 'bold')
# TODO 
Hi('Todo2', s_greengb, s_woodsmoke, 'bold')
Hi('Todo3', s_red1, s_woodsmoke, 'bold')
Hi('Todo4', s_orangered, s_gray3, 'bold')

hi link vimType typescriptTypeReference
hi link typescriptTypeBracket typescriptTypeReference
hi link typescriptPredefinedType typescriptTypeReference
hi link typescriptTypeBrackets typescriptTypeReference
Hi('typescriptTypeReference', s_wisteria01, s_NONE, 'NONE')

Hi('Underlined', s_turquoise, s_NONE, 'underline')
Hi('VertSplit', s_woodsmoke, s_bg, 'NONE')
Hi('Visual', s_fg, s_paleturquoise, '') 
Hi('cssPseudoClassId', s_gold)
Hi('defineVariable', s_orangea, s_NONE, 'bold')
Hi('diffRemoved', s_white1, s_venetianred, 'NONE')
Hi('htmlBold', s_yellow1, '', 'bold')
# Hi('htmlItalic', s_acapulco, s_NONE, 'italic')
Hi('htmlLink', s_glacier, s_NONE, 'underline')
# strike only possible with mapping <leader>strike
Hi('htmlStrike', s_maire, s_maroon)
Hi('jsBooleanTrue', s_darkpastelgreen)
Hi('jsReturn', s_deepskyblue, s_NONE, 'bold')
Hi('jsxComponentName', s_orangea, s_NONE, 'bold')
Hi('mkdHeading', s_goldmono, s_goldmono)

hi link mkdBlockquote markdownCodeBlock
Hi('markdownCodeBlock', s_fg, s_niagara2)

Hi('phpStaticClasses', s_quartz01)
Hi('qfLineNr', s_white2, s_NONE)
Hi('shRepeat', s_lime)
Hi('tsxTagName', s_turquoise)
Hi('typescriptDocParamType', s_wisteria, s_woodsmoke)

Hi('typescriptBOMHistoryProp', s_mairemono3tint5)
Hi('typescriptDomNodeProp', s_mairemono3tint5)
Hi('Special', s_mairemono3tint5, s_NONE, 'NONE')
Hi('Directory', s_mairemono3tint5)
Hi('NonText', s_mairemono3tint5)

Hi('typescriptArrayMethod', s_seagull)
Hi('typescriptConsoleMethod', s_seagull)
Hi('typescriptBOMNavigatorProp', s_seagull)

Hi('typescriptDocTags', s_gold, s_woodsmoke)
Hi('typescriptMember', s_swansdown, s_NONE, 'NONE')
Hi('typescriptNumberStaticMethod', s_balihai)
hi link typescriptMathStaticMethod Normal

Hi('typescriptObjectLabel', s_white2, s_NONE, 'NONE')
Hi('typescriptStatementKeyword', s_greena, s_NONE, 'bold')
Hi('vimVarScope', s_botticelli)
Hi('vimCommentTitle', s_swansdown, s_woodsmoke, 'bold')

hi link BladeDelimiter Delimiter

# Ruby: keep or toss?
Hi('RubyRoute', s_green5)
Hi('RubySymbol', s_green5)
Hi('erubyExpression', s_green5)

# var s_towergrey = '#95a99f' # quartz
# var s_zorba = '#a99f95' # towergrey triadic
# var s_eagle = '#a9a58f'
# var s_botticelli = '#97a8ae'
# var s_acapulco = '#83a194'
# var s_bouquet = '#A18394' # acapulco GRB
# var s_balihai = '#8e969b'
# var s_shadylady = '#a9a6a7'

# Markdown: and stuff
# Hi('markdownBold', s_green11, s_black1, 'BOLD')
Hi('markdownCode', s_lime)
hi link markdownH1 heading1
hi link markdownH2 heading2
hi link markdownH3 heading3
hi link markdownH4 heading3
hi link markdownH5 heading3
hi link markdownH6 heading3

# custom
# Hi('cssProp', s_greena, s_red)
# Hi('cssValue', s_, s_bg, 'NONE')

# BPO: braces, parens, operators, comma's, misc subtle
hi link LineNr Subtle
hi link cssBraces Subtle
hi link diffIndexLine Subtle
hi link diffLine Subtle
hi link diffNewFile Subtle
hi link diffOldFile Subtle
hi link cssSelectorOp Subtle
hi link jsonQuote Subtle
hi link netrwComma Subtle
hi link phpComparison Subtle
hi link typescriptCastKeyword Subtle
hi link typescriptDestructureComma Subtle
hi link typescriptEndColons Subtle
hi link typescriptFuncComma Subtle
hi link typescriptTypeAnnotation Subtle
hi link vimFuncBang Subtle
hi link vimFuncBody Subtle
hi link vimHiBang Subtle
hi link Define Subtle
hi link Subtle BPO

hi link Delimiter BPO
hi link Noise BPO
hi link TypescriptAssign BPO
hi link javascriptBraces BPO 
hi link javascriptOperator BPO
hi link jsDot BPO
hi link jsFuncArgOperator BPO
hi link jsFuncBraces BPO
hi link jsIfElseBraces BPO
hi link jsOperator BPO
hi link jsoncBraces BPO
hi link jsxDot BPO
hi link jsxEqual BPO
hi link phpMemberSelector BPO
hi link phpOperator BPO
hi link shOperator BPO
hi link typescriptDotNotation BPO
hi link typescriptObjectColon BPO
hi link typescriptOperator BPO
hi link vimOper BPO
Hi('BPO', s_shadylady)

# BPO: like BPO, but darker
hi link typescriptProperty BPODark
hi link typescriptParens BPODark
hi link typescriptBraces BPODark
hi link typescriptTemplateSB BPODark
Hi('LineNr', s_scorpion)
Hi('BPODark', s_scorpion)

Hi('bbNullFalseUndefined', s_torchred)
Hi('import', s_zorba, '', '')
Hi('heading2', s_internationalorange, '', 'bold')
Hi('heading3', s_white1, '', 'bold')

# hi link Repeat Statement
# hi link RubyRepeat FuncName

# hi link CocErrorFloat MessageWindow
# hi link Constant Normal
# hi link PHPMethod Pmenu
# hi link htmlTag htmlArg
# hi link htmlTagName htmlArg
# hi link phpMethodsVar Keyword
# hi link phpStaticClasses FuncName
# hi link typescriptCall Constant
# hi link typescriptFuncCallArg Constant


# hi link typescriptCase Keyword
hi link BladeKeyword Keyword
hi link Class Keyword
hi link Conditional Keyword
hi link RubyControl Keyword
hi link RubyDefine Keyword
hi link RubyViewHelper Keyword
hi link cssAtKeyword Keyword
hi link cssClassName Keyword
hi link cssClassNameDot Keyword
hi link cssIdentifier Keyword
hi link cssListAttr Keyword
hi link diffFile Keyword
hi link fugitiveSymbolicRef Keyword
hi link javascriptFunction Keyword
hi link javascriptReserved Keyword
hi link javascriptStatement Keyword
hi link jsFunction Keyword
hi link jsStorageClass Keyword
hi link netrwDir Keyword
hi link phpClasses Keyword
hi link phpDefine Keyword
hi link phpInclude Keyword
hi link phpStatement Keyword 
hi link typescriptBinaryOp Keyword
hi link typescriptConditional Keyword
hi link typescriptFuncKeyword Keyword
hi link typescriptPromiseMethod Keyword
hi link typescriptRepeat Keyword
hi link typescriptTernaryOp Keyword
hi link typescriptTry Keyword
hi link typescriptVariable Keyword
hi link vimCommand Keyword
hi link vimFuncKey Keyword
hi link yamlBlockMappingKey Keyword
Hi('Keyword', s_gold, s_NONE, 'bold')


hi link cssAtRule KeywordAlt
hi link cssAtRuleLogical KeywordAlt
hi link typescriptCase KeywordAlt
hi link KeywordAlt heading2

hi link typescriptParamImpl htmlArg
hi link cssProp htmlArg
# hi link typescriptConditionalParen htmlArg
hi link RubyPredefinedConstant htmlArg
hi link vue_typescript htmlArg
hi link jsThis htmlArg
# hi link typescriptCall htmlArg
Hi('htmlArg', s_towergrey)

hi link typescriptObjectLiteral Identifier
hi link typescriptBOMWindowProp Identifier
hi link cssPageProp Identifier
hi link typescriptIdentifier Identifier
hi link javascriptIdentifier Identifier
hi link phpIdentifier Identifier
hi link phpVarSelector Identifier
Hi('Identifier', s_white4, '', 'NONE')

hi link vimMapLeaderKey Type
hi link Structure Type
hi link Typedef Type 
hi link cssTagName Type
Hi('Type', s_brown)


# where is color defined?


# Hi('vueTypescript', s_vue_mint)
# hi link vueTypescript javaScript


# hi link typescriptImport Keyword
# hi link typescriptMember Normal
# hi link typescriptObjectLabel Constant
# hi link typescriptStatementKeyword Keyword
# hi link typescriptVariable Identifier



hi link CocErrorFloat CocInlayHintParameter
hi link CocFloatActive MessageWindow
hi link CocFloating MessageWindow
# Exception ?
hi link CocHintFloat CocInlayHintParameter
# Exception ?
hi link CocHintSign CocInlayHintParameter
# Exception ?
hi link CocHintVirtualText CocInlayHintParameter
# Exception ?
hi link CocInlayHint CocInlayHintParameter
# hi link CocInlayHintParameter 
# below: py error coc
hi link CocInlayHintType CocInlayHintParameter
hi link CocListBgBlue Statement
hi link CocListFgBlue MessageWindow
hi link CocMarkdownLink MessageWindow
hi link CocMenuSel PmenuSel
hi link CocNotificationProgress MessageWindow
hi link CocSearch MessageWindow
hi link CocWarningFloat MessageWindow
# hi link ColorColumn CocListLine
hi link CssAttrRegion cssProp
hi link CurSearch Search
hi link CursorIM Cursor
hi link DiffAdd DiffAdded
hi link DiffDelete Removed

hi link Directory Normal
hi link FgCocHintFloatBgCocFloating Exception
hi link FgCocWarningFloatBgCocFloating CocInfoFloat
hi link Label Constant
hi link Method Normal
hi link MoreMsg MessageWindow
hi link NonText EndOfBuffer
hi link PmenuExtra Pmenu
hi link PmenuThumb	CocListLine
hi link PopupNotification MessageWindow
# hi link PreProc Normal
hi link RubyClass Class
hi link RubyInstanceVariable FuncName
hi link RubyMethodName FuncName
hi link SpecialKey Pmenu
# hi link StatusLineTerm StatusLine
# hi link StatusLineTermNC StatusLineNC
hi link StorageClass Question
hi link ToolbarButton TabLineSel
hi link typescriptDocParam typescriptDocParamType 
hi link typescriptDomNodeMethod Method
hi link vimCommentTitleLeader vimComment

hi link VisualNOS Visual
hi link WildMenu Pmenu
hi link awkPatterns Statement
hi link cssAnimationProp cssProp
hi link cssAttributeSelector Constant
hi link cssBackgroundProp cssProp
hi link cssBorderProp cscssProp
hi link cssBorderProp cssProp
hi link cssBoxAttr cssValue
hi link cssBoxProp cssProp
hi link cssColor cssValue
hi link cssColorProp cssProp
hi link cssCustomProp Constant
hi link cssFlexibleBoxProp cssProp
hi link cssFontProp cssProp
hi link cssFunctionName FuncName
hi link cssMediaProp cssProp
hi link cssPositioningProp cssProp
# hi link cssPseudoClassId Constant
# hi link cssPseudoClassId Keyword
# hi link cssPseudoClassId cssProp
hi link cssTextProp cssProp
hi link cssTransformProp cssProp
hi link cssTransitionAttr cssValue
hi link cssTransitionProp cssProp
hi link cssUIAttr cssValue
hi link cssUIProp cssProp
hi link cssUnitDecorators Normal
hi link cssValueLength cssValue
hi link cssValueNumber cssValue
hi link cssValueTime cssValue
hi link htmlEndTag htmlTag
hi link htmlEvent htmlTag
hi link htmlEventDQ String
hi link htmlScriptTag htmlTag
hi link htmlSpecialChar Normal
hi link htmlSpecialTagName htmlTag
hi link htmlTagName htmlTag
hi link htmlTag Normal
hi link htmlTagN tsxTagName
hi link javaScript Normal
hi link javaScriptGlobal Normal
hi link javaScriptMember Normal
hi link jsFuncParens typescriptParens
hi link jsParens typescriptParens
hi link javascriptParens typescriptParens
hi link jsxBraces Constant
hi link jsxCloseString jsxTagName
hi link jsxExpressionBlock Constant
hi link jsxOpenPunct jsxTagName
hi link jsxTag Constant
hi link lCursor Cursor
hi link netrwClassify Method
hi link netrwExe Normal
hi link netrwList Normal
hi link phpFunction Normal
hi link phpFunctions Normal
hi link phpMethod Method
hi link phpMethodsVar FuncName
hi link phpParent typescriptParens
hi link phpRegion FuncName
hi link pythonImport import
hi link shOption FuncName
hi link shQuote String
hi link shVariable FuncName
hi link tsxAttrib Normal
hi link tsxCloseString htmlTag
# hi link tsxEscJs Normal
# hi link tsxEscapeJs Normal
hi link tsxRegion Constant
hi link tsxTag htmlTag
hi link typescriptAliasDeclaration Normal
hi link typescriptAliasKeyword AliasKeyword
hi link typescriptArrowFunc Normal
# hi link typescriptAsyncFuncKeyword Subtle
hi link typescriptBOM Method
hi link typescriptBOMWindowMethod Method
hi link typescriptBlock Normal
hi link typescriptBomLocationMethod Method
hi link typescriptBoolean Boolean
hi link typescriptCacheMethod Method
# hi link typescriptConsoleMethod Method
# hi link typescriptConsoleMethod typescriptGlobal
hi link typescriptDOMDocProp Normal
hi link typescriptDOMEventMethod Method
hi link typescriptDOMEventProp htmlTag
hi link typescriptDOMFormProp Normal
hi link typescriptDOMStorageMethod Method
hi link typescriptDateMethod Method
hi link typescriptDateStaticMethod Method
# hi link typescriptDefault typescriptCase
hi link typescriptDestructureVariable typescriptVariableDeclaration
hi link typescriptDocNamedParamType typescriptDocParamType
hi link typescriptDocNotation typescriptDocTags
hi link typescriptDomDocMethod Method
hi link typescriptDomEventTargetMethod Method
hi link typescriptExceptions Exception
hi link typescriptExport typescriptStatementKeyword
hi link jsExport typescriptStatementKeyword
hi link typescriptFuncCallArg typescriptCall
hi link typescriptFuncName FuncName
hi link typescriptFuncTypeArrow typescriptArrowFunc
hi link typescriptGlobalConsoleDot typescriptDotNotation 
hi link typescriptGlobalMethod Method
hi link typescriptHeadersMethod Method
hi link typescriptImport import
hi link jsImport import
hi link jsFrom import
hi link typescriptInterfaceKeyword AliasKeyword
hi link typescriptInterfaceName typescriptAliasDeclaration
hi link typescriptJSONStaticMethod Method
hi link typescriptPaymentShippingOptionProp Normal
hi link typescriptStringMethod Method
hi link typescriptURLStaticMethod Method
hi link typescriptURLUtilsProp Normal
hi link typescriptUnion TypescriptAssign
hi link typescriptUnaryOp bbNullFalseUndefined
hi link typescriptVariableDeclaration Constant
hi link vimFgBgAttrib Normal
hi link vimFuncName FuncName
hi link vimFuncParam Constant
hi link vimGroup Normal
hi link vimHiAttrib Normal
hi link vimHiGroup Normal
hi link vimOption Normal
hi link vimTodo Todo
hi link vimUserFunc Method
hi link vimVar Normal
hi link vueSurroundingTag htmlTag

# links to custom definition
hi link phpNullValue bbNullFalseUndefined
hi link jsNull bbNullFalseUndefined
hi link typescriptNull bbNullFalseUndefined
hi link jsBooleanFalse bbNullFalseUndefined
hi link jsUndefined bbNullFalseUndefined
hi link typescriptBranch typescriptStatementKeyword
hi link Error bbNullFalseUndefined

hi link Title heading1
hi link fugitiveHeading heading1
hi link fugitiveStagedHeading heading1
hi link htmlH1 heading1
Hi('heading1', s_gold, '', 'BOLD')

hi link htmlH2 heading2
hi link htmlH3 heading3
hi link htmlH4 heading4
hi link htmlH5 heading5

# Vim9: new rules and links
hi link vim9CommentTitle heading1

# VimWiki
# hi link VimWikiDelText htmlStrike
# hi link VimwikiBold markdownBold
# hi link VimwikiItalic htmlItalic
# hi link VimwikiCode markdownCode
# hi link VimwikiHeader2 markdownH2
# hi link VimwikiHeader3 markdownH3
# hi link VimwikiHeader4 markdownH4
# hi link VimwikiHeader5 markdownH5
# hi link VimwikiHeader6 markdownH6
# hi link VimwikiPre Comment
# Hi('VimwikiSuperScript', s_gold, s_NONE, 'reverse, italic')

# TODO: define list
# CursorColumn ... ', ctermfg=60 ctermbg=fg cterm=reverse '.blackred_fg.' guibg=fg gui=reverse'
# link CursorColumn CursorLine
# hi typescriptVariableDeclaration ctermfg=fg ctermbg=NONE cterm=NONE guifg=fg guibg=NONE gui=NONE
# hi DiffChange ctermfg=fg ctermbg=bg cterm=NONE guibg=bg gui=NONE
# hi Ignore ctermfg=NONE ctermbg=NONE cterm=NONE guifg=fg guibg=NONE gui=NONE
# hi Operator ctermfg=fg ctermbg=NONE cterm=NONE guifg=fg guibg=NONE gui=NONE# hi ToolbarLine ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
# define Exception
#
# zie r. 185
hi link Directory netrwDir

# CHECK IT: these should probably just be gone
hi link PreProc Normal
hi link typescriptFuncCallArg Normal
hi link typescriptCall Normal
hi link typescriptGlobal Normal
