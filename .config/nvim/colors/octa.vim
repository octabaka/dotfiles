" Maintainer: octa

set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='octa'

hi cNone guifg=none guibg=none gui=none
hi cWhite guifg=#deded9 guibg=none gui=none
hi cCyan1 guifg=#bfccff 
hi cCyan2 guifg=#5fa7e6
hi cGray1 guifg=#323442
hi cGray2 guifg=#abb2bf
hi cYellow1 guifg=#e7f2bc
hi cRed1 guifg=#ff81ca
hi cRed2 guifg=#b02c7d gui=bold
hi cRed3 guifg=#ff5555 gui=bold
hi cGreen1 guifg=#28779c
"
hi! link Normal cWhite
hi! link NormalFloat cWhite

hi! link Type cRed3
hi! link Title Type
hi! link Variable Normal
hi! link @variable Normal
hi! link Parameter Normal
hi! link Identifier Normal
hi! link String cYellow1
hi! link Include cRed2
hi! link Keyword cRed2
hi! link Operator Keyword
hi! link Statement Keyword
hi! link Delimiter Normal
hi! link Special cGreen1
hi! link Number cGreen1
hi! link Boolean Number
hi! link @property cCyan1
hi! link @field cCyan1
hi! link Function cCyan2
hi! link @constructor Normal
hi! link Preproc cGray1
hi! link Constant cRed1
hi! link Label cGreen1 
"
hi Strong gui=bold
hi! link Emphasis Strong
hi! link Underline Underlined
hi! link Comment cGray1


hi Error guifg=#ff5555 guibg=NONE gui=NONE
hi! link ErrorMsg Error
hi Warning guifg=#ffc191 guibg=NONE gui=bold
hi WarningMsg guifg=#ffc191 guibg=NONE gui=NONE
hi DiagnosticError guifg=#bf005f guibg=NONE gui=italic
hi DiagnosticWarn guifg=#cc9999 guibg=NONE gui=NONE
hi DiagnosticInfo guifg=#3F89FC guibg=NONE gui=NONE
hi DiagnosticHint guifg=#3f7dfc guibg=NONE gui=NONE

hi NonText guifg=#5588aa guibg=NONE gui=NONE

hi link htmlTag cRed2
hi link @tag htmlTag
hi link htmlArg cGreen1
hi link @tag.attribute htmlArg
hi! link javaScript Normal
hi link @punctuation.bracket cGray2

"gui
hi Pmenu guifg=NONE guibg=NONE gui=NONE
hi PmenuSel guifg=NONE guibg=#121260 gui=NONE
hi PmenuSbar guifg=NONE guibg=NONE gui=NONE
hi PmenuThumb guifg=NONE guibg=#121260 gui=NONE
hi FloatBorder guifg=#222273 guibg=NONE gui=NONE
hi LspInfoBorder guifg=#222273 guibg=#222273 gui=NONE
hi Cursor guifg=NONE guibg=NONE gui=reverse
hi CursorLine guifg=NONE guibg=#0e0f12 gui=NONE
hi CursorLineNr guifg=#abb2bf guibg=NONE gui=bold
hi Underlined gui=underline
hi Folded guifg=NONE guibg=NONE gui=italic
hi FoldColumn guifg=NONE guibg=NONE gui=NONE
hi IncSearch guifg=#e7f2bc guibg=#323442 gui=NONE
hi LineNr guifg=#323442 guibg=NONE gui=NONE
hi VertSplit guifg=#28779c guibg=NONE gui=NONE
hi SignColumn guifg=NONE guibg=NONE gui=NONE
hi StatusLineNC guifg=#323442 guibg=NONE gui=NONE
hi StatusLineTermNC guifg=#2c323c guibg=NONE gui=NONE
hi TabLine guifg=#323442 guibg=NONE gui=NONE
hi StatusLine guifg=#abb2bf guibg=#2c323c gui=NONE
hi StatusLineTerm guifg=#abb2bf guibg=#2c323c gui=NONE
hi TabLineSel guifg=#abb2bf guibg=NONE gui=NONE
hi TabLineFill guifg=NONE guibg=#0b0c0d gui=NONE
hi Terminal guifg=#abb2bf guibg=#1e1e1e gui=NONE
hi Visual guifg=NONE guibg=#3e4452 gui=NONE
hi QuickFixLine guifg=#1e1e1e guibg=#e7f2bc gui=NONE
hi Search guifg=NONE guibg=#181a1f gui=bold
hi MatchParen guifg=#deded9 guibg=NONE gui=underline

" DIFF
hi DiffDelete guifg=#ff5555 guibg=NONE gui=NONE
hi DiffAdd guifg=#1e1e1e guibg=#28779c gui=NONE
hi DiffChange guifg=#ffc191 guibg=NONE gui=NONE
hi DiffText guifg=#323442 guibg=NONE gui=NONE

" Plugins
hi WhichKey guifg=#ffc191 guibg=NONE gui=NONE
hi WhichKeySeperator guifg=#28779c guibg=NONE gui=NONE
hi WhichKeyGroup guifg=#8bb3fc guibg=NONE gui=NONE
hi WhichKeyDesc guifg=#8bb3fc guibg=NONE gui=NONE
hi debugPc guifg=NONE guibg=#333348 gui=NONE
hi debugBreakpoint guifg=#ff5555 guibg=NONE gui=reverse
hi IndentGuidesOdd guifg=NONE guibg=NONE gui=NONE
hi IndentGuidesEven guifg=NONE guibg=#1e1e1e gui=NONE

" CMP
hi! link CmpItemKind cWhite
hi! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080
hi! CmpItemAbbrMatch guibg=NONE guifg=#aaaaaa
hi! link CmpItemAbbrMatchFuzzy CmpItemAbbrMatch
hi! link CmpItemKindVariable String
hi! link CmpItemKindConstant Constant 
hi! link CmpItemKindText String
hi! link CmpItemKindFunction Function
hi! link CmpItemKindField @field 
hi! link CmpItemKindMethod CmpItemKindFunction
hi! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
hi! link CmpItemKindProperty CmpItemKindKeyword
hi! link CmpItemKindUnit CmpItemKindKeyword
hi CmpItemKindStruct guibg=None guifg=#ff5555
hi link CmpItemKindEnum CmpItemKindStruct
hi link CmpItemKindModule Keyword
hi! link CmpItemKindInterface Keyword
" Lsp
hi LspInlayHint guifg=#1e2d4c gui=italic
" Telescope
hi! link TelescopeBorder FloatBorder
hi! link TelescopeSelectionCaret CursorLine
hi! link TelescopeSelection CursorLine
hi TelescopePromptNormal guibg=#270b25 gui=bold
"Noice
hi NoiceMini guifg=#deded9 guibg=#3b021d gui=NONE
hi! link NoiceLspProgressTitle NoiceMini
hi! link NoiceLspProgressClient DiagnosticHint
"BufferLine
hi BufferLineBufferSelected guifg=#aaaaaa guibg=NONE gui=bold
hi! link jinjaVarBlock cCyan2
hi! link jinjaTagBlock cCyan2

hi! link MarkSignHL cGreen1 

hi link AerialLine Visual 

hi link justBodyText cWhite
hi link justInterpolation cGreen1 
hi link justName cGreen1 
hi link @lsp.type.macro.cpp cCyan1


