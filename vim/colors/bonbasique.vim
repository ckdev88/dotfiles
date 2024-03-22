" Name:         Bon Basique
" Description:  like Bem Basico, but different
" Author:       CK
" Maintainer:   CK
" Website:      https://www.github.com/vim/colorschemes
" License:      Vim License (see `:help license`)
" Last Updated: Fri Mar 22 12:27:40 AM -03 2024

hi clear
let g:colors_name = 'bonbasique'

hi! link CursorColumn CursorLine
hi! link StatusLineTerm StatusLine
hi! link StatusLineTermNC StatusLineNC
hi! link VisualNOS Visual
hi! link Tag Special
hi! link lCursor Cursor
hi! link MessageWindow PMenu
hi! link PopupNotification Todo
hi! link CurSearch Search
hi! link Directory Function
hi! link PreProc Identifier
hi! link Keyword Identifier
hi! link Conditional Identifier

hi Boolean 		ctermbg=NONE ctermfg=253  guibg=NONE	guifg=#dadada gui=NONE cterm=NONE
hi Character 	ctermbg=NONE ctermfg=253  guibg=NONE	guifg=#dadada gui=NONE cterm=NONE
hi ColorColumn 	ctermbg=0 	 ctermfg=NONE guibg=#000000	guifg=NONE 	  gui=NONE cterm=NONE
hi Comment 		ctermbg=NONE ctermfg=102  guibg=NONE	guifg=#878787 gui=NONE cterm=NONE
hi Conceal 		ctermbg=NONE ctermfg=102  guibg=NONE	guifg=#878787 gui=NONE cterm=NONE
hi Constant 	ctermbg=NONE ctermfg=253  guibg=NONE	guifg=#dadada gui=NONE cterm=NONE
hi Cursor 		ctermbg=0	 ctermfg=220  guibg=#000000	guifg=#ffd700 gui=NONE cterm=NONE 
hi CursorIM 	ctermbg=0	 ctermfg=220  guibg=#000000	guifg=#ffd700 gui=NONE cterm=NONE 
hi CursorLine 	ctermbg=235  ctermfg=NONE guibg=#262626 guifg=NONE 	  gui=NONE cterm=NONE 
hi CursorLineNr ctermbg=235  ctermfg=NONE guibg=#262626 guifg=NONE 	  gui=bold cterm=bold 
hi CursorLineSign ctermbg=235  ctermfg=39 guibg=#262626 guifg=#00afff gui=bold cterm=bold 
hi CursorLineFold ctermbg=235  ctermfg=40 guibg=#262626 guifg=#00d700 gui=bold cterm=bold 
hi Debug 		ctermbg=NONE ctermfg=88	  guibg=NONE    guifg=#870000 gui=NONE cterm=NONE
hi Define 		ctermbg=NONE ctermfg=10   guibg=NONE 	guifg=#00ff00 gui=NONE cterm=NONE
hi Delimiter 	ctermbg=NONE ctermfg=166  guibg=NONE 	guifg=#d75f00 gui=NONE cterm=NONE
hi DiffAdd 		ctermbg=234  ctermfg=2    guibg=#1c1c1c guifg=#008000 gui=reverse cterm=reverse
hi DiffChange 	ctermbg=234  ctermfg=4	  guibg=#1c1c1c guifg=#000080 gui=reverse cterm=reverse
hi DiffDelete 	ctermbg=234  ctermfg=1 	  guibg=#1c1c1c guibg=#800000 gui=reverse cterm=reverse
hi DiffText 	ctermbg=234  ctermfg=208  guibg=#1c1c1c guifg=#ff8700 gui=reverse cterm=reverse
hi EndOfBuffer 	ctermbg=NONE ctermfg=59	  guibg=NONE	guifg=#504945 gui=NONE cterm=NONE
hi Error 		ctermbg=234	 ctermfg=124  guibg=#1c1c1c guifg=#af0000 gui=bold cterm=bold
hi ErrorMsg 	ctermbg=124	 ctermfg=255  guibg=#af0000 guifg=#ffffff gui=bold cterm=bold
hi Exception 	ctermbg=124	 ctermfg=NONE guibg=NONE    guifg=#af0000 gui=NONE cterm=NONE
hi Float 		ctermbg=NONE ctermfg=253  guibg=NONE    guifg=#dadada gui=NONE cterm=NONE
hi FoldColumn 	ctermbg=234	 ctermfg=40   guibg=#1c1c1c guifg=#00d700 gui=NONE cterm=NONE
hi Folded 		ctermbg=235	 ctermfg=40   guibg=#262626 guifg=#00d700 gui=NONE cterm=NONE
hi Function 	ctermbg=NONE ctermfg=187  guibg=NONE 	guifg=#d7d7ad gui=NONE cterm=NONE
hi Identifier 	ctermbg=NONE ctermfg=187  guibg=NONE 	guifg=#d7d7ad gui=NONE cterm=NONE
hi Ignore guifg=fg guibg=NONE gui=NONE cterm=NONE
hi IncSearch 	guifg=#594945 guibg=#1c1c1c gui=reverse cterm=reverse
hi Include 		ctermbg=NONE ctermfg=126 guibg=NONE guifg=#af0087 gui=NONE cterm=NONE
hi Label 		guifg=#fb4934 guibg=NONE gui=NONE cterm=NONE
hi Label ctermfg=203 ctermbg=NONE cterm=NONE
hi LineNr 		guifg=#7c6f64 guibg=#555555 gui=NONE cterm=NONE
hi LineNr ctermfg=243 ctermbg=NONE cterm=NONE
hi Macro ctermfg=107 ctermbg=NONE cterm=NONE
hi Macro guifg=#8ec07c guibg=NONE gui=NONE cterm=NONE
hi MatchParen ctermbg=NONE ctermfg=220 guibg=NONE guifg=#ffd700 gui=bold cterm=bold
hi ModeMsg guifg=#fabd2f guibg=NONE gui=bold cterm=bold
hi MoreMsg guifg=#fabd2f guibg=NONE gui=bold cterm=bold
hi NonText guifg=#504945 guibg=NONE gui=NONE cterm=NONE
hi Normal 			ctermfg=254 guifg=#e4e4e4 guibg=#121212 gui=NONE cterm=NONE
hi Number 			ctermfg=253 guifg=#dadada guibg=NONE gui=NONE cterm=NONE
hi Operator ctermfg=148 ctermbg=NONE guifg=#afd700 guibg=NONE gui=NONE cterm=NONE
hi Pmenu 			ctermbg=1 ctermfg=214 guibg=#800000 guifg=#ffaf00 gui=NONE cterm=NONE
hi PmenuExtra 		ctermbg=1 ctermfg=2   guibg=#800000 guifg=#008000 gui=NONE cterm=NONE
hi PmenuExtraSel 	guifg=#303030 guibg=#83a598 gui=NONE cterm=NONE
hi PmenuKind 		guifg=#fb4934 guibg=#3c3836 gui=NONE cterm=NONE
hi PmenuKindSel 	guifg=#fb4934 guibg=#83a598 gui=NONE cterm=NONE
hi PmenuSbar 		guifg=NONE guibg=#3c3836 gui=NONE cterm=NONE
hi PmenuSel 		guifg=#094881  guibg=#83a598 gui=bold cterm=bold
hi PmenuThumb 		guifg=NONE guibg=#7c6f64 gui=NONE cterm=NONE
hi PreCondit 		guifg=#8ec07c guibg=NONE gui=NONE cterm=NONE
hi Question 		guifg=#fe8019 guibg=NONE gui=bold cterm=bold
hi QuickFixLine 		guifg=#8ec07c guibg=#1c1c1c gui=reverse cterm=reverse
hi Repeat 		guifg=#fb4934 guibg=NONE gui=NONE cterm=NONE
hi Search ctermbg=66 ctermfg=254 guibg=#5f8787 		guifg=#e4e4e4 gui=NONE cterm=NONE
hi SignColumn 		ctermbg=0	 ctermfg=138 guibg=#000000 guifg=#af8787 gui=NONE cterm=NONE
hi Special 			ctermbg=NONE ctermfg=10 guibg=NONE guifg=#00ff00 gui=NONE cterm=NONE
hi SpecialChar 		ctermbg=NONE ctermfg=152 guibg=NONE guifg=#afd7d7 gui=NONE cterm=NONE
hi SpecialComment 	ctermbg=NONE ctermfg=152 guibg=NONE guifg=#afd7d7 gui=NONE cterm=NONE
hi SpecialKey 	ctermbg=NONE ctermfg=152 guibg=NONE guifg=#afd7d7 gui=NONE cterm=NONE
hi SpellBad 	guifg=#fb4934 guibg=NONE guisp=#fb4934 gui=undercurl cterm=underline
hi SpellCap guifg=#83a598 guibg=NONE guisp=#83a598 gui=undercurl cterm=underline
hi SpellLocal guifg=#8ec07c guibg=NONE guisp=#8ec07c gui=undercurl cterm=underline
hi SpellRare guifg=#d3869b guibg=NONE guisp=#d3869b gui=undercurl cterm=underline
hi Statement ctermbg=NONE  ctermfg=39 guibg=#262626 guifg=#00afff gui=bold cterm=bold 
hi StatusLine 	guifg=#504945 guibg=#d4d4d4 gui=reverse cterm=reverse
hi StatusLineNC guifg=#3c3836 guibg=#a89984 gui=reverse cterm=reverse
hi StorageClass guifg=#fe8019 guibg=NONE gui=NONE cterm=NONE
hi String 		ctermbg=NONE ctermfg=186 guibg=NONE guifg=#d7d787 gui=NONE cterm=NONE
hi Structure ctermbg=none ctermfg=12 guifg=#0000ff guibg=NONE gui=NONE cterm=NONE
hi TabLine guifg=#a89984 guibg=#3c3836 gui=NONE cterm=NONE
hi TabLineFill guifg=#d4d4d4 guibg=#3c3836 gui=NONE cterm=NONE
hi TabLineSel guifg=#fbf1c7 guibg=#1c1c1c gui=bold cterm=bold
hi Title guifg=#ffdd33 guibg=#1c1c1c gui=bold cterm=bold
hi Todo guifg=#1c1c1c  guibg=#1c1c1c gui=bold cterm=bold ctermbg=red ctermfg=white
hi ToolbarButton guifg=#fbf1c7 guibg=#303030 gui=bold cterm=bold
hi ToolbarLine guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Type 		ctermbg=NONE ctermfg=146	  guibg=NONE guifg=#afafd7 gui=NONE cterm=NONE
hi Typedef guifg=#949bb0 guibg=NONE gui=NONE cterm=NONE
hi Underlined guifg=#83a598 guibg=NONE gui=underline cterm=underline
hi VertSplit guifg=#303030 guibg=#1c1c1c gui=NONE cterm=NONE
hi Visual guifg=#1c1c1c guibg=#504945 gui=NONE cterm=NONE
hi WarningMsg guifg=#fb4934 guibg=NONE gui=bold cterm=bold
hi WildMenu 	ctermbg=13 ctermfg=10 guifg=#ffff00 guibg=#ff00ff gui=bold cterm=bold 

hi CocFloating	ctermbg=52	ctermfg=NONE guibg=#5f0000 guifg=NONE gui=NONE cterm=NONE

hi Method ctermbg=NONE ctermfg=220 guibg=NONE guifg=#ffd700 gui=bold cterm=bold
