set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "nimda"

if has("gui_running") || (has('termguicolors') && &termguicolors)
  let s:true_color = 1
else
  let s:true_color = 0
endif

if s:true_color || &t_Co >= 88
  let s:low_color = 0
else
  let s:low_color = 1
endif

" Configuration Variables:
" - g:nimda_overrides          (default = {})
" - g:nimda_use_lowcolor_black (default = 0)
" - g:nimda_use_gui_italics    (default = 1)
" - g:nimda_use_term_italics   (default = 0)

let s:background_color = "212121"

if exists("g:nimda_overrides")
  let s:overrides = g:nimda_overrides
else
  let s:overrides = {}
endif

" Backwards compatibility
if exists("g:nimda_background_color")
  \ || exists("g:nimda_background_color_256")
  \ || exists("g:nimda_use_term_background_color")

  let s:overrides = deepcopy(s:overrides)

  if !has_key(s:overrides, "background")
    let s:overrides["background"] = {}
  endif

  if exists("g:nimda_background_color")
    let s:overrides["background"]["guibg"] = g:nimda_background_color
  endif

  if exists("g:nimda_background_color_256")
    let s:overrides["background"]["256ctermbg"] = g:nimda_background_color_256
  endif

  if exists("g:nimda_use_term_background_color")
    \ && g:nimda_use_term_background_color
    let s:overrides["background"]["ctermbg"] = "NONE"
    let s:overrides["background"]["256ctermbg"] = "NONE"
  endif
endif

if exists("g:nimda_use_lowcolor_black") && g:nimda_use_lowcolor_black
  let s:termBlack = "Black"
else
  let s:termBlack = "Grey"
endif

if &t_Co == 88

  " returns an approximate grey index for the given grey level
  fun! s:grey_number(x)
    if a:x < 23
      return 0
    elseif a:x < 69
      return 1
    elseif a:x < 103
      return 2
    elseif a:x < 127
      return 3
    elseif a:x < 150
      return 4
    elseif a:x < 173
      return 5
    elseif a:x < 196
      return 6
    elseif a:x < 219
      return 7
    elseif a:x < 243
      return 8
    else
      return 9
    endif
  endfun

  " returns the actual grey level represented by the grey index
  fun! s:grey_level(n)
    if a:n == 0
      return 0
    elseif a:n == 1
      return 46
    elseif a:n == 2
      return 92
    elseif a:n == 3
      return 115
    elseif a:n == 4
      return 139
    elseif a:n == 5
      return 162
    elseif a:n == 6
      return 185
    elseif a:n == 7
      return 208
    elseif a:n == 8
      return 231
    else
      return 255
    endif
  endfun

  " returns the palette index for the given grey index
  fun! s:grey_color(n)
    if a:n == 0
      return 16
    elseif a:n == 9
      return 79
    else
      return 79 + a:n
    endif
  endfun

  " returns an approximate color index for the given color level
  fun! s:rgb_number(x)
    if a:x < 69
      return 0
    elseif a:x < 172
      return 1
    elseif a:x < 230
      return 2
    else
      return 3
    endif
  endfun

  " returns the actual color level for the given color index
  fun! s:rgb_level(n)
    if a:n == 0
      return 0
    elseif a:n == 1
      return 139
    elseif a:n == 2
      return 205
    else
      return 255
    endif
  endfun

  " returns the palette index for the given R/G/B color indices
  fun! s:rgb_color(x, y, z)
    return 16 + (a:x * 16) + (a:y * 4) + a:z
  endfun

else " assuming &t_Co == 256

  " returns an approximate grey index for the given grey level
  fun! s:grey_number(x)
    if a:x < 14
      return 0
    else
      let l:n = (a:x - 8) / 10
      let l:m = (a:x - 8) % 10
      if l:m < 5
        return l:n
      else
        return l:n + 1
      endif
    endif
  endfun

  " returns the actual grey level represented by the grey index
  fun! s:grey_level(n)
    if a:n == 0
      return 0
    else
      return 8 + (a:n * 10)
    endif
  endfun

  " returns the palette index for the given grey index
  fun! s:grey_color(n)
    if a:n == 0
      return 16
    elseif a:n == 25
      return 231
    else
      return 231 + a:n
    endif
  endfun

  " returns an approximate color index for the given color level
  fun! s:rgb_number(x)
    if a:x < 75
      return 0
    else
      let l:n = (a:x - 55) / 40
      let l:m = (a:x - 55) % 40
      if l:m < 20
        return l:n
      else
        return l:n + 1
      endif
    endif
  endfun

  " returns the actual color level for the given color index
  fun! s:rgb_level(n)
    if a:n == 0
      return 0
    else
      return 55 + (a:n * 40)
    endif
  endfun

  " returns the palette index for the given R/G/B color indices
  fun! s:rgb_color(x, y, z)
    return 16 + (a:x * 36) + (a:y * 6) + a:z
  endfun

endif

" returns the palette index to approximate the given R/G/B color levels
fun! s:color(r, g, b)
  " map greys directly (see xterm's 256colres.pl)
  if &t_Co == 256 && a:r == a:g && a:g == a:b && a:r > 3 && a:r < 243
    return (a:r - 8) / 10 + 232
  endif

  " get the closest grey
  let l:gx = s:grey_number(a:r)
  let l:gy = s:grey_number(a:g)
  let l:gz = s:grey_number(a:b)

  " get the closest color
  let l:x = s:rgb_number(a:r)
  let l:y = s:rgb_number(a:g)
  let l:z = s:rgb_number(a:b)

  if l:gx == l:gy && l:gy == l:gz
    " there are two possibilities
    let l:dgr = s:grey_level(l:gx) - a:r
    let l:dgg = s:grey_level(l:gy) - a:g
    let l:dgb = s:grey_level(l:gz) - a:b
    let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
    let l:dr = s:rgb_level(l:gx) - a:r
    let l:dg = s:rgb_level(l:gy) - a:g
    let l:db = s:rgb_level(l:gz) - a:b
    let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
    if l:dgrey < l:drgb
      " use the grey
      return s:grey_color(l:gx)
    else
      " use the color
      return s:rgb_color(l:x, l:y, l:z)
    endif
  else
    " only one possibility
    return s:rgb_color(l:x, l:y, l:z)
  endif
endfun

fun! s:is_empty_or_none(str)
  return empty(a:str) || a:str ==? "NONE"
endfun

" returns the palette index to approximate the 'rrggbb' hex string
fun! s:rgb(rgb)
  if s:is_empty_or_none(a:rgb)
    return "NONE"
  endif
  let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
  let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
  let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0
  return s:color(l:r, l:g, l:b)
endfun

fun! s:prefix_highlight_value_with(prefix, color)
  if s:is_empty_or_none(a:color)
    return "NONE"
  else
    return a:prefix . a:color
  endif
endfun

fun! s:remove_italic_attr(attr)
  let l:attr = join(filter(split(a:attr, ","), "v:val !=? 'italic'"), ",")
  if empty(l:attr)
    let l:attr = "NONE"
  endif
  return l:attr
endfun

" sets the highlighting for the given group
fun! s:X(group, fg, bg, attr, lcfg, lcbg)
  if s:low_color
    let l:cmd = "hi ".a:group.
    \ " ctermfg=".s:prefix_highlight_value_with("", a:lcfg).
    \ " ctermbg=".s:prefix_highlight_value_with("", a:lcbg)
  else
    let l:cmd = "hi ".a:group.
    \ " guifg=".s:prefix_highlight_value_with("#", a:fg).
    \ " guibg=".s:prefix_highlight_value_with("#", a:bg)
    if !s:true_color
      let l:cmd = l:cmd.
      \ " ctermfg=".s:rgb(a:fg).
      \ " ctermbg=".s:rgb(a:bg)
    endif
  endif

  let l:attr = s:prefix_highlight_value_with("", a:attr)

  if exists("g:nimda_use_term_italics") && g:nimda_use_term_italics
    let l:cterm_attr = l:attr
  else
    let l:cterm_attr = s:remove_italic_attr(l:attr)
  endif

  if !exists("g:nimda_use_gui_italics") || g:nimda_use_gui_italics
    let l:gui_attr = l:attr
  else
    let l:gui_attr = s:remove_italic_attr(l:attr)
  endif

  let l:cmd = l:cmd." gui=".l:gui_attr." cterm=".l:cterm_attr
  exec l:cmd
endfun
" }}}

set background=dark

call s:X("CursorLine","","191919","","",s:termBlack)
call s:X("CursorColumn","","191919","","",s:termBlack)

" Some of Terminal.app's default themes have a cursor color
" too close to nimda' preferred MatchParen background
" color to be easily distinguishable. Other terminals tend
" to use a brighter cursor color.
"
" Use a more distinct color in Terminal.app, and also in
" low-color terminals if the preferred background color is
" not available.
if !has('gui_running') && $TERM_PROGRAM == "Apple_Terminal"
    let s:matchParenGuiFg = "d75f5f"
    let s:matchParenGuiBg = "191919"
else
    let s:matchParenGuiFg = "eeeeee"
    let s:matchParenGuiBg = "616161"
endif
if s:termBlack != "Black"
    let s:matchParenTermFg = "8197bf"
    let s:matchParenTermBg = ""
else
    let s:matchParenTermFg = ""
    let s:matchParenTermBg = s:termBlack
endif
call s:X("MatchParen",s:matchParenGuiFg,s:matchParenGuiBg,"bold",
\                     s:matchParenTermFg,s:matchParenTermBg)

call s:X("TabLine","f7ca88","191919","","",s:termBlack)
call s:X("TabLineFill","","","","",s:termBlack)
call s:X("TabLineSel","191919","f7ca88","bold",s:termBlack,"White")

" Auto-completion
call s:X("Pmenu","eeeeee","191919","","White",s:termBlack)
call s:X("PmenuSel","191919","eeeeee","",s:termBlack,"White")

call s:X("Visual","","191919","","",s:termBlack)
call s:X("Cursor",s:background_color,"b0d0f0","","","")

call s:X("LineNr","616161","","", "","")
call s:X("CursorLineNr", "f7ca88", "", "bold", "White", "")
call s:X("Comment","818181","","italic","Grey","")
call s:X("Todo","dddddd","","bold","White",s:termBlack)

call s:X("StatusLine","191919","eeeeee","italic","","White")
call s:X("StatusLineNC","eeeeee","212121","italic","White","Black")
call s:X("VertSplit","818181","212121","",s:termBlack,s:termBlack)
call s:X("WildMenu","d75f5f","212121","","Magenta","")

call s:X("Folded","dddddd","212121","italic",s:termBlack,"")
call s:X("FoldColumn","616161","191919","","",s:termBlack)
call s:X("SignColumn","","","","",s:termBlack)
call s:X("ColorColumn","","191919","","",s:termBlack)

call s:X("Title","f7ca88","","bold","","")

call s:X("Constant","d75f5f","","","Red","")
call s:X("Special","87af5f","","","Green","")
call s:X("Delimiter","616161","","","Grey","")

call s:X("String","87af5f","","","Green","")
call s:X("StringDelimiter","5a773d","","","DarkGreen","")

call s:X("Identifier","8197bf","","","Blue","")
call s:X("Structure","8197bf","","","Blue","")
call s:X("Function","f7ca88","","","Yellow","")
call s:X("Statement","8197bf","","","DarkBlue","")
call s:X("PreProc","8197bf","","","Blue","")

hi! link Operator Structure
hi! link Conceal Operator

call s:X("Type","a293cb","","","","")
call s:X("NonText","616161",s:background_color,"",s:termBlack,"")
call s:X("Search","87af5f","191919","underline","","")
call s:X("Directory","f7ca88","","","Yellow","")
call s:X("ErrorMsg","eeeeee","992f33","","White","DarkRed")
call s:X("Question","87af5f","","","Green","")
hi! link Error ErrorMsg
hi! link MoreMsg Special

" Spell Checking

call s:X("SpellBad","","992F33","underline","","DarkRed")
call s:X("SpellCap","","818181","underline","","Gray")
call s:X("SpellRare","","a293cb","underline","","")
call s:X("SpellLocal","","87af5f","underline","","Green")

" Diff

hi! link diffRemoved Constant
hi! link diffAdded String

" VimDiff

call s:X("DiffAdd","eeeeee","5a773d","","White","DarkGreen")
call s:X("DiffDelete","d75f5f","992F33","","Red","DarkRed")
call s:X("DiffChange","","8197bf","","White","Blue")
call s:X("DiffText","8197bf","191919","reverse","","")

" PHP

hi! link phpFunctions Function
call s:X("StorageClass","f7ca88","","","","")
hi! link phpSuperglobal Identifier
hi! link phpQuoteSingle StringDelimiter
hi! link phpQuoteDouble StringDelimiter
hi! link phpBoolean Constant
hi! link phpNull Constant
hi! link phpArrayPair Operator
hi! link phpOperator Normal
hi! link phpRelation Normal
hi! link phpVarSelector Identifier

" Python

hi! link pythonOperator Statement

" Ruby

hi! link rubySharpBang Comment
call s:X("rubyClass","8197bf","","","Blue","")
call s:X("rubyIdentifier","a293cb","","","","")
hi! link rubyConstant Type
hi! link rubyFunction Function

call s:X("rubyInstanceVariable","a293cb","","","","")
call s:X("rubySymbol","8197bf","","","Blue","")
hi! link rubyGlobalVariable rubyInstanceVariable
hi! link rubyModule rubyClass
call s:X("rubyControl","8197bf","","","Blue","")

hi! link rubyString String
hi! link rubyStringDelimiter StringDelimiter
hi! link rubyInterpolationDelimiter Identifier

call s:X("rubyRegexpDelimiter","a293cb","","","","")
call s:X("rubyRegexp","d75f5f","","","Red","")
call s:X("rubyRegexpSpecial","8197bf","","","","")

call s:X("rubyPredefinedIdentifier","d75f5f","","","Red","")

" Erlang

hi! link erlangAtom rubySymbol
hi! link erlangBIF rubyPredefinedIdentifier
hi! link erlangFunction rubyPredefinedIdentifier
hi! link erlangDirective Statement
hi! link erlangNode Identifier

" Elixir

hi! link elixirAtom rubySymbol


" JavaScript

hi! link javaScriptValue Constant
hi! link javaScriptRegexpString rubyRegexp
hi! link javaScriptTemplateVar StringDelim
hi! link javaScriptTemplateDelim Identifier
hi! link javaScriptTemplateString String

" CoffeeScript

hi! link coffeeRegExp javaScriptRegexpString

" Lua

hi! link luaOperator Conditional

" C

hi! link cFormat Identifier
hi! link cOperator Constant

" Objective-C/Cocoa

hi! link objcClass Type
hi! link cocoaClass objcClass
hi! link objcSubclass objcClass
hi! link objcSuperclass objcClass
hi! link objcDirective rubyClass
hi! link objcStatement Constant
hi! link cocoaFunction Function
hi! link objcMethodName Identifier
hi! link objcMethodArg Normal
hi! link objcMessageName Identifier

" Vimscript

hi! link vimOper Normal

" HTML

hi! link htmlTag Statement
hi! link htmlEndTag htmlTag
hi! link htmlTagName htmlTag

" XML

hi! link xmlTag Statement
hi! link xmlEndTag xmlTag
hi! link xmlTagName xmlTag
hi! link xmlEqual xmlTag
hi! link xmlEntity Special
hi! link xmlEntityPunct xmlEntity
hi! link xmlDocTypeDecl PreProc
hi! link xmlDocTypeKeyword PreProc
hi! link xmlProcessingDelim xmlAttrib

" Debugger.vim

call s:X("DbgCurrent","dddddd","191919","","White","Black")
call s:X("DbgBreakPt","","d75f5f","","","Red")

" vim-indent-guides

if !exists("g:indent_guides_auto_colors")
  let g:indent_guides_auto_colors = 0
endif
call s:X("IndentGuidesOdd","","212121","","","")
call s:X("IndentGuidesEven","","191919","","","")

" Tabbing
hi VertSplit guifg=#f7ca88

" Plugins, etc.

hi! link TagListFileName Directory
call s:X("PreciseJumpTarget","87af5f","212121","","Green","Black")

" Manual overrides for 256-color terminals. Dark colors auto-map badly.
if !s:low_color
  hi StatusLineNC ctermbg=235
  hi Folded ctermbg=236
  hi DiffText ctermfg=81
  hi DbgBreakPt ctermbg=53
  hi IndentGuidesOdd ctermbg=235
  hi IndentGuidesEven ctermbg=234
endif

if !empty("s:overrides")
  fun! s:current_attr(group)
    let l:synid = synIDtrans(hlID(a:group))
    let l:attrs = []
    for l:attr in ["bold", "italic", "reverse", "standout", "underline", "undercurl"]
      if synIDattr(l:synid, l:attr, "gui") == 1
        call add(l:attrs, l:attr)
      endif
    endfor
    return join(l:attrs, ",")
  endfun
  fun! s:current_color(group, what, mode)
    let l:color = synIDattr(synIDtrans(hlID(a:group)), a:what, a:mode)
    if l:color == -1
      return ""
    else
      return substitute(l:color, "^#", "", "")
    endif
  endfun
  fun! s:load_color_def(group, def)
    call s:X(a:group, get(a:def, "guifg", s:current_color(a:group, "fg", "gui")),
    \                 get(a:def, "guibg", s:current_color(a:group, "bg", "gui")),
    \                 get(a:def, "attr", s:current_attr(a:group)),
    \                 get(a:def, "ctermfg", s:current_color(a:group, "fg", "cterm")),
    \                 get(a:def, "ctermbg", s:current_color(a:group, "bg", "cterm")))
    if !s:low_color
      for l:prop in ["ctermfg", "ctermbg"]
        let l:override_key = "256".l:prop
        if has_key(a:def, l:override_key)
          exec "hi ".a:group." ".l:prop."=".a:def[l:override_key]
        endif
      endfor
    endif
  endfun
  fun! s:load_colors(defs)
    for [l:group, l:def] in items(a:defs)
      if l:group == "background"
        call s:load_color_def("LineNr", l:def)
        call s:load_color_def("NonText", l:def)
        call s:load_color_def("Normal", l:def)
      else
        call s:load_color_def(l:group, l:def)
      endif
      unlet l:group
      unlet l:def
    endfor
  endfun
  call s:load_colors(s:overrides)
  delf s:load_colors
  delf s:load_color_def
  delf s:current_color
  delf s:current_attr
endif

" delete functions {{{
  delf s:X
  delf s:remove_italic_attr
  delf s:prefix_highlight_value_with
  delf s:rgb
  delf s:is_empty_or_none
  delf s:color
  delf s:rgb_color
  delf s:rgb_level
  delf s:rgb_number
  delf s:grey_color
  delf s:grey_level
  delf s:grey_number
" }}}
