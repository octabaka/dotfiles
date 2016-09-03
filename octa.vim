" Vim color file
" Converted from Textmate theme octaV3 using Coloration v0.4.0 (http://github.com/sickill/coloration)

set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "octa"
" Gris foncé = 236
" Gris clair = 239 
" Blanczarb = 188
" 89 = rouge
" 24 = beau vert
"hi Cursor ctermfg=NONE ctermbg=NONE cterm=NONE 
hi Visual ctermfg=NONE ctermbg=144 cterm=NONE 
"hi CursorLine ctermfg=NONE ctermbg=235 cterm=NONE 
"hi CursorColumn ctermfg=NONE ctermbg=235 cterm=NONE 
"hi ColorColumn ctermfg=NONE ctermbg=235 cterm=NONE 
"hi LineNr ctermfg=244 ctermbg=235 cterm=NONE 
hi LineNr ctermfg=239 ctermbg=NONE cterm=NONE 
hi VertSplit ctermfg=239 ctermbg=NONE cterm=NONE 
hi MatchParen ctermfg=NONE ctermbg=24 cterm=bold
hi StatusLine ctermfg=188 ctermbg=NONE cterm=bold 
hi StatusLineNC ctermfg=188 ctermbg=NONE cterm=NONE 
hi TabLine ctermfg=236 ctermbg=NONE cterm=NONE 
hi TabLineSel ctermfg=NONE ctermbg=NONE cterm=bold 
hi TabLineFill ctermfg=188 ctermbg=NONE cterm=NONE 
hi Pmenu ctermfg=24 ctermbg=NONE cterm=NONE 
hi PmenuSel ctermfg=89 ctermbg=144 cterm=NONE 
hi IncSearch ctermfg=233 ctermbg=24 cterm=NONE 
hi Search ctermfg=NONE ctermbg=NONE cterm=underline 
hi Directory ctermfg=24 ctermbg=NONE cterm=NONE 
hi Folded ctermfg=59 ctermbg=233 cterm=NONE 
hi NonText ctermfg=NONE ctermbg=NONE cterm=NONE 

hi Normal ctermfg=NONE ctermbg=NONE cterm=NONE 
hi Boolean ctermfg=24 ctermbg=NONE cterm=bold 
hi Character ctermfg=24 ctermbg=NONE cterm=NONE 
hi Comment ctermfg=236 ctermbg=NONE cterm=NONE 
hi Conditional ctermfg=89 ctermbg=NONE cterm=NONE 
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE 
hi Define ctermfg=89 ctermbg=NONE cterm=NONE 
hi DiffAdd ctermfg=188 ctermbg=64 cterm=bold 
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE 
hi DiffChange ctermfg=188 ctermbg=17 cterm=NONE 
hi DiffText ctermfg=188 ctermbg=24 cterm=bold 
hi ErrorMsg ctermfg=231 ctermbg=125 cterm=NONE 
hi WarningMsg ctermfg=231 ctermbg=125 cterm=NONE 
hi Float ctermfg=24 ctermbg=NONE cterm=NONE 
hi Function ctermfg=NONE ctermbg=NONE cterm=NONE 
hi Identifier ctermfg=NONE ctermbg=NONE cterm=NONE 
hi Keyword ctermfg=89 ctermbg=NONE cterm=NONE 
hi Label ctermfg=24 ctermbg=NONE cterm=NONE 
hi Number ctermfg=24 ctermbg=NONE cterm=NONE 
hi Operator ctermfg=89 ctermbg=NONE cterm=NONE 
" 230 = jaune
hi PreProc ctermfg=230 ctermbg=NONE cterm=NONE 
hi Special ctermfg=188 ctermbg=NONE cterm=NONE 
hi SpecialKey ctermfg=0 ctermbg=235 cterm=NONE 
hi Statement ctermfg=230 ctermbg=NONE cterm=NONE 
hi StorageClass ctermfg=125 ctermbg=NONE cterm=NONE 
hi String ctermfg=24 ctermbg=NONE cterm=NONE 
hi Tag ctermfg=125 ctermbg=NONE cterm=NONE 
hi Title ctermfg=188 ctermbg=NONE cterm=bold 
hi Todo ctermfg=59 ctermbg=NONE cterm=inverse,bold 
hi Type ctermfg=89 ctermbg=NONE cterm=NONE 
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline 
hi rubyClass ctermfg=89 ctermbg=NONE cterm=NONE 
hi rubyFunction ctermfg=NONE ctermbg=NONE cterm=NONE 
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE 
hi rubySymbol ctermfg=24 ctermbg=NONE cterm=NONE 
hi rubyConstant ctermfg=NONE ctermbg=NONE cterm=NONE 
hi rubyStringDelimiter ctermfg=24 ctermbg=NONE cterm=NONE 
hi rubyBlockParameter ctermfg=188 ctermbg=NONE cterm=NONE 
hi rubyInstanceVariable ctermfg=188 ctermbg=NONE cterm=NONE 
hi rubyInclude ctermfg=59 ctermbg=NONE cterm=NONE 
hi rubyGlobalVariable ctermfg=188 ctermbg=NONE cterm=NONE 
hi rubyRegexp ctermfg=24 ctermbg=NONE cterm=NONE 
hi rubyRegexpDelimiter ctermfg=24 ctermbg=NONE cterm=NONE 
hi rubyEscape ctermfg=24 ctermbg=NONE cterm=NONE 
hi rubyControl ctermfg=89 ctermbg=NONE cterm=NONE 
hi rubyClassVariable ctermfg=188 ctermbg=NONE cterm=NONE 
hi rubyOperator ctermfg=89 ctermbg=NONE cterm=NONE 
hi rubyException ctermfg=59 ctermbg=NONE cterm=NONE 
hi rubyPseudoVariable ctermfg=188 ctermbg=NONE cterm=NONE 
hi rubyRailsUserClass ctermfg=NONE ctermbg=NONE cterm=NONE 
hi rubyRailsARAssociationMethod ctermfg=NONE ctermbg=NONE cterm=NONE 
hi rubyRailsARMethod ctermfg=NONE ctermbg=NONE cterm=NONE 
hi rubyRailsRenderMethod ctermfg=NONE ctermbg=NONE cterm=NONE 
hi rubyRailsMethod ctermfg=NONE ctermbg=NONE cterm=NONE 
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE 
hi erubyComment ctermfg=59 ctermbg=NONE cterm=NONE 
hi erubyRailsMethod ctermfg=NONE ctermbg=NONE cterm=NONE 
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE 
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE 
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE 
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE 
hi htmlSpecialChar ctermfg=24 ctermbg=NONE cterm=NONE 
hi javaScriptFunction ctermfg=125 ctermbg=NONE cterm=NONE 
hi javaScriptRailsFunction ctermfg=NONE ctermbg=NONE cterm=NONE 
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE 
hi yamlKey ctermfg=125 ctermbg=NONE cterm=NONE 
hi yamlAnchor ctermfg=188 ctermbg=NONE cterm=NONE 
hi yamlAlias ctermfg=188 ctermbg=NONE cterm=NONE 
hi yamlDocumentHeader ctermfg=24 ctermbg=NONE cterm=NONE 
hi cssURL ctermfg=188 ctermbg=NONE cterm=NONE 
hi cssFunctionName ctermfg=NONE ctermbg=NONE cterm=NONE 
hi cssColor ctermfg=73 ctermbg=NONE cterm=NONE 
hi cssPseudoClassId ctermfg=89 ctermbg=NONE cterm=NONE 
hi cssClassName ctermfg=89 ctermbg=NONE cterm=NONE 
hi cssValueLength ctermfg=24 ctermbg=NONE cterm=NONE 
hi cssCommonAttr ctermfg=73 ctermbg=NONE cterm=NONE 
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE 
