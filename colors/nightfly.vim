" Dark Vim/Neovim color scheme.
"
" Note: Inspiration taken from: Sarah Drasner's Night Owl theme and my own
" moonfly theme.
"
" URL:     github.com/bluz71/vim-nightfly-guicolors
" License: MIT (https://opensource.org/licenses/MIT)

highlight clear
set background=dark
if exists('syntax_on')
    syntax reset
endif
let g:colors_name='nightfly'

" Please check that Vim/Neovim is able to run this true-color only theme.
"
" If running in a terminal make sure termguicolors exists and is set.
if has('nvim')
    if has('nvim-0.4') && nvim_list_uis()[0]['ext_termcolors'] && !&termguicolors
        " The nvim_list_uis test indicates terminal Neovim vs GUI Neovim.
        " Note, versions prior to Neovim 0.4 did not set 'ext_termcolors'.
        echomsg 'The termguicolors option must be set'
        finish
    endif
else " Vim
    if !has('gui_running') && !exists('&termguicolors')
        echomsg 'A modern version of Vim with termguicolors is required'
        finish
    elseif !has('gui_running') && !&termguicolors
        echomsg 'The termguicolors option must be set'
        finish
    endif
endif

" By default do not color the cursor.
let g:nightflyCursorColor = get(g:, 'nightflyCursorColor', 0)

" By default use the nightly color palette in the `:terminal`
let g:nightflyTerminalColors = get(g:, 'nightflyTerminalColors', 1)

" By default do not underline matching parentheses.
let g:nightflyUnderlineMatchParen = get(g:, 'nightflyUnderlineMatchParen', 0)

" By default do use undercurls in GUI versions of Vim, including terminal Vim
" with termguicolors set.
let g:nightflyUndercurls = get(g:, 'nightflyUndercurls', 1)

" By default do use italics in GUI versions of Vim, including terminal Vim
" with termguicolors set.
let g:nightflyItalics = get(g:, 'nightflyItalics', 1)

" Background and foreground
let s:black      = '#282828' " bg
let s:white      = '#ebdbb2' " fg1
" Variations of blue-grey
let s:dark0_hard = '#1d2021' " dark0_hard
let s:dark0      = '#282828' " dark0
let s:dark0_soft = '#32302f' " dark0_soft
let s:dark1      = '#3c3836' " dark1
let s:dark2      = '#504945' " dark2
let s:dark3      = '#665c54' " dark3
let s:dark4      = '#7c6f64' " dark4
let s:dark4_2    = '#7c6f64' " dark4_256
let s:gray       = '#928374' " gray_245
let s:gray_2     = '#928374' " gray_244
" Core theme colors
let s:yellow     = '#d79921'
let s:yellow_2   = '#fabd2f'
let s:green      = '#98971a'
let s:green_2    = '#b8bb26'
let s:red        = '#cc241d'
let s:red_2      = '#fb4934'
let s:purple     = '#b16286'
let s:purple_2   = '#d3869b'
let s:blue       = '#458588'
let s:blue_2     = '#83a598'
let s:aqua       = '#689d6a'
let s:aqua_2     = '#8ec07c'

" Specify the colors used by the inbuilt terminal of Neovim and Vim
if g:nightflyTerminalColors
    if has('nvim')
        let g:terminal_color_0  = '#1d3b53'
        let g:terminal_color_1  = '#fc514e'
        let g:terminal_color_2  = '#a1cd5e'
        let g:terminal_color_3  = '#e3d18a'
        let g:terminal_color_4  = '#82aaff'
        let g:terminal_color_5  = '#c792ea'
        let g:terminal_color_6  = '#7fdbca'
        let g:terminal_color_7  = '#a1aab8'
        let g:terminal_color_8  = '#7c8f8f'
        let g:terminal_color_9  = '#ff5874'
        let g:terminal_color_10 = '#21c7a8'
        let g:terminal_color_11 = '#ecc48d'
        let g:terminal_color_12 = '#82aaff'
        let g:terminal_color_13 = '#ae81ff'
        let g:terminal_color_14 = '#7fdbca'
        let g:terminal_color_15 = '#d6deeb'
    else
        let g:terminal_ansi_colors = [
                    \ '#1d3b53', '#fc514e', '#a1cd5e', '#e3d18a',
                    \ '#82aaff', '#c792ea', '#7fdbca', '#a1aab8',
                    \ '#7c8f8f', '#ff5874', '#21c7a8', '#ecc48d',
                    \ '#82aaff', '#ae81ff', '#7fdbca', '#d6deeb'
                    \]
    endif
endif

" Background and text
exec 'highlight Normal guibg=' . s:black . ' guifg=' . s:white

" Color of mode text, -- INSERT --
exec 'highlight ModeMsg guifg=' . s:gray . ' gui=none'

" Comments
if g:nightflyItalics
    exec 'highlight Comment guifg=' . s:dark4_2 . ' gui=italic'
else
    exec 'highlight Comment guifg=' . s:dark4_2
endif

" Functions
exec 'highlight Function guifg=' . s:blue

" Strings
exec 'highlight String guifg=' . s:green_2

" Booleans
exec 'highlight Boolean guifg=' . s:red_2

" Identifiers
exec 'highlight Identifier guifg=' . s:blue_2

" Color of titles
exec 'highlight Title guifg=' . s:yellow . ' gui=none'

" const, static
exec 'highlight StorageClass guifg=' . s:yellow

" void, intptr_t
exec 'highlight Type guifg=' . s:aqua_2 . ' gui=none'

" Numbers
exec 'highlight Constant guifg=' . s:yellow

" Character constants
exec 'highlight Character guifg=' . s:purple_2

" Exceptions
exec 'highlight Exception guifg=' . s:red_2

" ifdef/endif
exec 'highlight PreProc guifg=' . s:red_2

" Status, split and tab lines
exec 'highlight StatusLine cterm=none guibg=' . s:dark1 . ' guifg=' . s:white . ' gui=none'
exec 'highlight StatusLineNC cterm=none guibg=' . s:dark1 . ' guifg=' . s:gray . ' gui=none'
exec 'highlight VertSplit cterm=none guibg=' . s:dark1 . ' guifg=' . s:dark1 . ' gui=none'
exec 'highlight Tabline cterm=none guibg=' . s:dark1 . ' guifg=' . s:gray . ' gui=none'
exec 'highlight TablineSel cterm=none guibg=' . s:dark1 . ' guifg=' . s:blue . ' gui=none'
exec 'highlight TablineFill cterm=none guibg=' . s:dark1 . ' guifg=' . s:dark1 . ' gui=none'
exec 'highlight StatusLineTerm cterm=none guibg=' . s:dark1 . ' guifg=' . s:white . ' gui=none'
exec 'highlight StatusLineTermNC cterm=none guibg=' . s:dark1 . ' guifg=' . s:gray . ' gui=none'

" case in switch statement
exec 'highlight Label guifg=' . s:blue_2

" end-of-line '$', end-of-file '~'
exec 'highlight NonText guifg=' . s:yellow . ' gui=none'

" sizeof
exec 'highlight Operator guifg=' . s:red_2

" for, while
exec 'highlight Repeat guifg=' . s:purple

" Search
exec 'highlight Search guibg=bg guifg=' . s:yellow . ' gui=reverse'
exec 'highlight IncSearch guibg=bg guifg=' . s:green

" '\n' sequences
exec 'highlight Special guifg=' . s:red_2

" if, else
exec 'highlight Statement guifg=' . s:purple . ' gui=none'

" Visual selection
exec 'highlight Visual guibg=' . s:dark2
exec 'highlight VisualNOS guibg=' . s:dark2 . ' guifg=fg gui=none'
exec 'highlight VisualInDiff guibg=' . s:dark2 . ' guifg=' . s:white

" Errors, warnings and whitespace-eol
exec 'highlight Error guibg=bg guifg=' . s:red
exec 'highlight ErrorMsg guibg=bg guifg=' . s:red
exec 'highlight WarningMsg guibg=bg guifg=' . s:yellow

" struct, union, enum, typedef
exec 'highlight Structure guifg=' . s:purple

" Auto-text-completion menu
exec 'highlight Pmenu guibg=' . s:dark0_soft . ' guifg=fg'
exec 'highlight PmenuSel guibg=' . s:dark3 . ' guifg=fg'
exec 'highlight PmenuSbar guibg=' . s:dark0_soft
exec 'highlight PmenuThumb guibg=' . s:dark4
exec 'highlight WildMenu guibg=' . s:dark3 . ' guifg=fg'

" Spelling errors
if g:nightflyUndercurls
    exec 'highlight SpellBad guibg=bg gui=undercurl guisp=' . s:red
    exec 'highlight SpellCap guibg=bg gui=undercurl guisp=' . s:blue
    exec 'highlight SpellRare guibg=bg gui=undercurl guisp=' . s:yellow_2
    exec 'highlight SpellLocal guibg=bg gui=undercurl guisp=' . s:blue
else
    exec 'highlight SpellBad guibg=bg guifg=' . s:red . ' gui=underline guisp=' . s:red
    exec 'highlight SpellCap guibg=bg guifg=' . s:blue . ' gui=underline guisp=' . s:blue
    exec 'highlight SpellRare guibg=bg guifg=' . s:yellow_2 . ' gui=underline guisp=' . s:yellow_2
    exec 'highlight SpellLocal guibg=bg guifg=' . s:blue . ' gui=underline guisp=' . s:blue
endif

" Misc
exec 'highlight Question guifg=' . s:aqua . ' gui=none'
exec 'highlight MoreMsg guifg=' . s:red . ' gui=none'
exec 'highlight LineNr guibg=bg guifg=' . s:dark4
if g:nightflyCursorColor
    exec 'highlight Cursor guifg=bg guibg=' . s:blue
else
    exec 'highlight Cursor guifg=bg guibg=' . s:gray
endif
exec 'highlight lCursor guifg=bg guibg=' . s:gray
exec 'highlight CursorLineNr cterm=none guibg=' . s:dark0 . ' guifg=' . s:blue . ' gui=none'
exec 'highlight CursorColumn guibg=' . s:dark0
exec 'highlight CursorLine cterm=none guibg=' . s:dark0
exec 'highlight Folded guibg=' . s:dark0 . ' guifg='. s:aqua
exec 'highlight FoldColumn guibg=' . s:dark1 . ' guifg=' . s:aqua
exec 'highlight SignColumn guibg=bg guifg=' . s:aqua
exec 'highlight Todo guibg=' . s:yellow_2 . ' guifg=bg'
exec 'highlight SpecialKey guibg=bg guifg=' . s:blue
if g:nightflyUnderlineMatchParen
    exec 'highlight MatchParen guibg=bg guifg=' . s:yellow . ' gui=underline'
else
    exec 'highlight MatchParen guibg=bg guifg=' . s:yellow
endif
exec 'highlight Ignore guifg=' . s:blue
exec 'highlight Underlined guifg=' . s:aqua . ' gui=none'
exec 'highlight QuickFixLine guibg=' . s:dark0_soft
exec 'highlight Delimiter guifg=' . s:white

" Neovim only highlight groups
exec 'highlight Whitespace guifg=' . s:dark0_soft
exec 'highlight TermCursor guibg=' . s:gray . ' guifg=bg gui=none'

" Color column (after line 80)
exec 'highlight ColorColumn guibg=' . s:dark0_hard

" Conceal color, as used by indentLine plugin
exec 'highlight Conceal guibg=bg guifg=' . s:dark0_soft

" Custom nightfly highlight groups
exec 'highlight NightflyReset guifg=fg'
exec 'highlight NightflyWhite guifg=' . s:white
exec 'highlight NightflyRegalBlue guifg=' . s:dark2
exec 'highlight NightflySteelBlue guifg=' . s:dark4
exec 'highlight NightflyCadetBlue guifg=' . s:gray
exec 'highlight NightflyGreyBlue guifg=' . s:dark4_2
exec 'highlight NightflyYellow guifg=' . s:yellow_2
exec 'highlight NightflyPeach guifg=' . s:green
exec 'highlight NightflyTan guifg=' . s:green_2
exec 'highlight NightflyOrange guifg=' . s:yellow
exec 'highlight NightflyRed guifg=' . s:red
exec 'highlight NightflyWatermelon guifg=' . s:red_2
exec 'highlight NightflyViolet guifg=' . s:purple
exec 'highlight NightflyPurple guifg=' . s:purple_2
exec 'highlight NightflyBlue guifg=' . s:blue
exec 'highlight NightflyTurquoise guifg=' . s:blue_2
exec 'highlight NightflyEmerald guifg=' . s:aqua_2
exec 'highlight NightflyGreen guifg=' . s:aqua
exec 'highlight NightflyWhiteAlert guibg=bg guifg=' . s:white
exec 'highlight NightflyYellowAlert guibg=bg guifg=' . s:yellow_2
exec 'highlight NightflyOrangeAlert guibg=bg guifg=' . s:yellow
exec 'highlight NightflyRedAlert guibg=bg guifg=' . s:red
exec 'highlight NightflyPurpleAlert guibg=bg guifg=' . s:purple_2
exec 'highlight NightflyBlueAlert guibg=bg guifg=' . s:blue
exec 'highlight NightflyEmeraldAlert guibg=bg guifg=' . s:aqua_2

" Neovim Treesitter
highlight! link TSAnnotation NightflyViolet
highlight! link TSConstant NightflyPurple
highlight! link TSConstBuiltin NightflyGreen
highlight! link TSConstMacro NightflyViolet
highlight! link TSConstructor NightflyEmerald
highlight! link TSError NightflyRed
highlight! link TSFuncBuiltin NightflyBlue
highlight! link TSFuncMacro NightflyBlue
highlight! link TSInclude NightflyWatermelon
highlight! link TSKeywordOperator NightflyViolet
highlight! link TSParameter NightflyWhite
highlight! link TSPunctSpecial NightflyWatermelon
highlight! link TSTag NightflyBlue
highlight! link TSTagDelimiter NightflyGreen
highlight! link TSVariableBuiltin NightflyGreen

" C/C++
highlight! link cDefine NightflyViolet
highlight! link cPreCondit NightflyViolet
highlight! link cStatement NightflyViolet
highlight! link cStructure NightflyOrange
highlight! link cppAccess NightflyGreen
highlight! link cppCast NightflyTurquoise
highlight! link cppCustomClass NightflyTurquoise
highlight! link cppExceptions NightflyGreen
highlight! link cppModifier NightflyViolet
highlight! link cppOperator NightflyGreen
highlight! link cppSTLconstant NightflyBlue
highlight! link cppSTLnamespace NightflyPurple
highlight! link cppStatement NightflyTurquoise

" C#
highlight! link csModifier NightflyGreen
highlight! link csPrecondit NightflyViolet
highlight! link csXmlTag NightflyBlue

" Clojure
highlight! link clojureDefine NightflyViolet
highlight! link clojureKeyword NightflyTurquoise
highlight! link clojureMacro NightflyOrange
highlight! link clojureParen NightflyBlue
highlight! link clojureSpecial NightflyViolet

" CoffeeScript
highlight! link coffeeConstant NightflyOrange
highlight! link coffeeGlobal NightflyWatermelon
highlight! link coffeeKeyword NightflyOrange
highlight! link coffeeObject NightflyEmerald
highlight! link coffeeObjAssign NightflyBlue
highlight! link coffeeSpecialIdent NightflyTurquoise
highlight! link coffeeSpecialVar NightflyBlue
highlight! link coffeeStatement NightflyOrange

" Crystal
highlight! link crystalAccess NightflyYellow
highlight! link crystalAttribute NightflyBlue
highlight! link crystalBlockParameter NightflyGreen
highlight! link crystalClass NightflyViolet
highlight! link crystalDefine NightflyViolet
highlight! link crystalExceptional NightflyOrange
highlight! link crystalInstanceVariable NightflyTurquoise
highlight! link crystalModule NightflyBlue
highlight! link crystalPseudoVariable NightflyGreen
highlight! link crystalSharpBang NightflyCadetBlue
highlight! link crystalStringDelimiter NightflyTan

" CSS/SCSS
highlight! link cssAttr NightflyTurquoise
highlight! link cssClassName NightflyBlue
highlight! link cssColor NightflyTurquoise
highlight! link cssIdentifier NightflyPeach
highlight! link cssProp NightflyTurquoise
highlight! link cssValueNumber NightflyViolet
highlight! link scssSelectorName NightflyBlue

" Dart
highlight! link dartMetadata NightflyGreen
highlight! link dartStorageClass NightflyViolet
highlight! link dartTypedef NightflyViolet
highlight! link dartUserType NightflyBlue

" Elixir
highlight! link eelixirDelimiter NightflyWatermelon
highlight! link elixirAtom NightflyPurple
highlight! link elixirBlockDefinition NightflyViolet
highlight! link elixirDefine NightflyViolet
highlight! link elixirDocTest NightflyCadetBlue
highlight! link elixirExUnitAssert NightflyGreen
highlight! link elixirExUnitMacro NightflyBlue
highlight! link elixirKernelFunction NightflyGreen
highlight! link elixirKeyword NightflyOrange
highlight! link elixirModuleDefine NightflyBlue
highlight! link elixirPrivateDefine NightflyViolet
highlight! link elixirStringDelimiter NightflyTan
highlight! link elixirVariable NightflyTurquoise

" Elm
highlight! link elmLetBlockDefinition NightflyGreen
highlight! link elmTopLevelDecl NightflyOrange
highlight! link elmType NightflyBlue

" Go
highlight! link goBuiltins NightflyBlue
highlight! link goConditional NightflyViolet
highlight! link goDeclType NightflyGreen
highlight! link goDirective NightflyWatermelon
highlight! link goFloats NightflyOrange
highlight! link goFunction NightflyBlue
highlight! link goFunctionCall NightflyBlue
highlight! link goImport NightflyWatermelon
highlight! link goLabel NightflyYellow
highlight! link goMethod NightflyBlue
highlight! link goMethodCall NightflyBlue
highlight! link goPackage NightflyViolet
highlight! link goSignedInts NightflyEmerald
highlight! link goStruct NightflyOrange
highlight! link goStructDef NightflyOrange
highlight! link goUnsignedInts NightflyOrange

" Haskell
highlight! link haskellDecl NightflyOrange
highlight! link haskellDeclKeyword NightflyOrange
highlight! link haskellIdentifier NightflyTurquoise
highlight! link haskellLet NightflyBlue
highlight! link haskellOperators NightflyWatermelon
highlight! link haskellType NightflyBlue
highlight! link haskellWhere NightflyViolet

" HTML
highlight! link htmlArg NightflyBlue
highlight! link htmlLink NightflyGreen
highlight! link htmlEndTag NightflyPurple
highlight! link htmlH1 NightflyWatermelon
highlight! link htmlH2 NightflyOrange
highlight! link htmlTag NightflyGreen
highlight! link htmlTagN NightflyBlue
highlight! link htmlTagName NightflyBlue
highlight! link htmlUnderline NightflyWhite
if g:nightflyItalics
    exec 'highlight htmlBoldItalic guibg=' . s:black . ' guifg=' . s:yellow . ' gui=italic'
    exec 'highlight htmlBoldUnderlineItalic guibg=' . s:black . ' guifg=' . s:yellow . ' gui=italic'
    exec 'highlight htmlItalic guifg=' . s:gray . ' gui=italic'
    exec 'highlight htmlUnderlineItalic guibg=' . s:black . ' guifg=' . s:gray . ' gui=italic'
else
    exec 'highlight htmlBoldItalic guibg=' . s:black . ' guifg=' . s:yellow
    exec 'highlight htmlBoldUnderlineItalic guibg=' . s:black . ' guifg=' . s:yellow
    exec 'highlight htmlItalic guifg=' . s:gray ' gui=none'
    exec 'highlight htmlUnderlineItalic guibg=' . s:black . ' guifg=' . s:gray
endif

" Java
highlight! link javaAnnotation NightflyGreen
highlight! link javaBraces NightflyWhite
highlight! link javaClassDecl NightflyPeach
highlight! link javaCommentTitle NightflyCadetBlue
highlight! link javaConstant NightflyBlue
highlight! link javaDebug NightflyBlue
highlight! link javaMethodDecl NightflyYellow
highlight! link javaOperator NightflyWatermelon
highlight! link javaScopeDecl NightflyViolet
highlight! link javaStatement NightflyTurquoise

" JavaScript, 'pangloss/vim-javascript' plugin
highlight! link jsClassDefinition NightflyEmerald
highlight! link jsClassKeyword NightflyViolet
highlight! link jsClassMethodType NightflyEmerald
highlight! link jsExceptions NightflyEmerald
highlight! link jsFrom NightflyOrange
highlight! link jsFuncBlock NightflyTurquoise
highlight! link jsFuncCall NightflyBlue
highlight! link jsFunction NightflyViolet
highlight! link jsGlobalObjects NightflyGreen
highlight! link jsModuleAs NightflyOrange
highlight! link jsObjectKey NightflyBlue
highlight! link jsObjectValue NightflyEmerald
highlight! link jsOperator NightflyViolet
highlight! link jsStorageClass NightflyGreen
highlight! link jsTemplateBraces NightflyWatermelon
highlight! link jsTemplateExpression NightflyTurquoise
highlight! link jsThis NightflyTurquoise

" JSX, 'MaxMEllon/vim-jsx-pretty' plugin
highlight! link jsxAttrib NightflyGreen
highlight! link jsxClosePunct NightflyPurple
highlight! link jsxComponentName NightflyBlue
highlight! link jsxOpenPunct NightflyGreen
highlight! link jsxTagName NightflyBlue

" Lua
highlight! link luaBraces NightflyWatermelon
highlight! link luaBuiltin NightflyGreen
highlight! link luaFuncCall NightflyBlue
highlight! link luaSpecialTable NightflyBlue

" Markdown, 'plasticboy/vim-markdown' plugin
highlight link mkdLineBreak NormalNC
highlight! link mkdDelimiter NightflyWhite
highlight! link mkdListItem NightflyBlue
highlight! link mkdURL NightflyPurple

" PHP
highlight! link phpClass NightflyEmerald
highlight! link phpClasses NightflyPeach
highlight! link phpFunction NightflyBlue
highlight! link phpParent NightflyReset
highlight! link phpType NightflyViolet

" PureScript
highlight! link purescriptClass NightflyPeach
highlight! link purescriptModuleParams NightflyOrange

" Python
highlight! link pythonBuiltin NightflyBlue
highlight! link pythonClassVar NightflyGreen
highlight! link pythonCoding NightflyBlue
highlight! link pythonImport NightflyWatermelon
highlight! link pythonOperator NightflyViolet
highlight! link pythonRun NightflyBlue
highlight! link pythonStatement NightflyViolet

" Ruby
highlight! link erubyDelimiter NightflyWatermelon
highlight! link rspecGroupMethods NightflyBlue
highlight! link rubyAccess NightflyYellow
highlight! link rubyAssertion NightflyBlue
highlight! link rubyAttribute NightflyBlue
highlight! link rubyBlockParameter NightflyGreen
highlight! link rubyCallback NightflyBlue
highlight! link rubyClass NightflyOrange
highlight! link rubyClassName NightflyEmerald
highlight! link rubyDefine NightflyViolet
highlight! link rubyEntities NightflyBlue
highlight! link rubyExceptional NightflyOrange
highlight! link rubyGemfileMethod NightflyBlue
highlight! link rubyInstanceVariable NightflyTurquoise
highlight! link rubyInterpolationDelimiter NightflyWatermelon
highlight! link rubyMacro NightflyBlue
highlight! link rubyModule NightflyBlue
highlight! link rubyModuleName NightflyEmerald
highlight! link rubyPseudoVariable NightflyGreen
highlight! link rubyResponse NightflyBlue
highlight! link rubyRoute NightflyBlue
highlight! link rubySharpBang NightflyCadetBlue
highlight! link rubyStringDelimiter NightflyTan
highlight! link rubySymbol NightflyPurple

" Rust
highlight! link rustAssert NightflyGreen
highlight! link rustAttribute NightflyReset
highlight! link rustCharacterInvalid NightflyWatermelon
highlight! link rustCharacterInvalidUnicode NightflyWatermelon
highlight! link rustCommentBlockDoc NightflyCadetBlue
highlight! link rustCommentBlockDocError NightflyCadetBlue
highlight! link rustCommentLineDoc NightflyCadetBlue
highlight! link rustCommentLineDocError NightflyCadetBlue
highlight! link rustConstant NightflyOrange
highlight! link rustDerive NightflyGreen
highlight! link rustEscapeError NightflyWatermelon
highlight! link rustFuncName NightflyBlue
highlight! link rustIdentifier NightflyBlue
highlight! link rustInvalidBareKeyword NightflyWatermelon
highlight! link rustKeyword NightflyViolet
highlight! link rustLifetime NightflyViolet
highlight! link rustMacro NightflyGreen
highlight! link rustMacroVariable NightflyViolet
highlight! link rustModPath NightflyBlue
highlight! link rustObsoleteExternMod NightflyWatermelon
highlight! link rustObsoleteStorage NightflyWatermelon
highlight! link rustReservedKeyword NightflyWatermelon
highlight! link rustSelf NightflyTurquoise
highlight! link rustSigil NightflyTurquoise
highlight! link rustStorage NightflyViolet
highlight! link rustStructure NightflyViolet
highlight! link rustTrait NightflyEmerald
highlight! link rustType NightflyEmerald

" Scala, note link highlighting does not work (I don't know why)
exec 'highlight scalaCapitalWord guifg=' . s:blue
exec 'highlight scalaCommentCodeBlock guifg=' . s:gray
exec 'highlight scalaInstanceDeclaration guifg=' . s:blue_2
exec 'highlight scalaKeywordModifier guifg=' . s:aqua
exec 'highlight scalaSpecial guifg=' . s:blue_2
exec 'highlight scalaSpecial guifg=' . s:red_2

" Shell scripts
highlight! link shAlias NightflyTurquoise
highlight! link shCommandSub NightflyReset
highlight! link shLoop NightflyViolet
highlight! link shSetList NightflyTurquoise
highlight! link shShellVariables NightflyGreen
highlight! link shStatement NightflyReset
highlight! link shVariable NightflyTurquoise

" TypeScript (leafgarland/typescript-vim)
highlight! link typescriptDOMObjects NightflyBlue
highlight! link typescriptFuncComma NightflyWhite
highlight! link typescriptFuncKeyword NightflyGreen
highlight! link typescriptGlobalObjects NightflyBlue
highlight! link typescriptIdentifier NightflyGreen
highlight! link typescriptNull NightflyGreen
highlight! link typescriptOpSymbols NightflyViolet
highlight! link typescriptOperator NightflyWatermelon
highlight! link typescriptParens NightflyWhite
highlight! link typescriptReserved NightflyViolet
highlight! link typescriptStorageClass NightflyGreen

" TypeScript (HerringtonDarkholme/yats.vim)
highlight! link typeScriptModule NightflyBlue
highlight! link typescriptAbstract NightflyOrange
highlight! link typescriptArrayMethod NightflyBlue
highlight! link typescriptArrowFuncArg NightflyWhite
highlight! link typescriptBOM NightflyEmerald
highlight! link typescriptBOMHistoryMethod NightflyBlue
highlight! link typescriptBOMLocationMethod NightflyBlue
highlight! link typescriptBOMWindowProp NightflyGreen
highlight! link typescriptBraces NightflyWhite
highlight! link typescriptCall NightflyWhite
highlight! link typescriptClassHeritage NightflyPeach
highlight! link typescriptClassKeyword NightflyViolet
highlight! link typescriptClassName NightflyEmerald
highlight! link typescriptDecorator NightflyGreen
highlight! link typescriptDOMDocMethod NightflyBlue
highlight! link typescriptDOMEventTargetMethod NightflyBlue
highlight! link typescriptDOMNodeMethod NightflyBlue
highlight! link typescriptExceptions NightflyWatermelon
highlight! link typescriptFuncType NightflyWhite
highlight! link typescriptMathStaticMethod NightflyBlue
highlight! link typescriptMethodAccessor NightflyViolet
highlight! link typescriptObjectLabel NightflyBlue
highlight! link typescriptParamImpl NightflyWhite
highlight! link typescriptStringMethod NightflyBlue
highlight! link typescriptTry NightflyWatermelon
highlight! link typescriptVariable NightflyGreen
highlight! link typescriptXHRMethod NightflyBlue

" Vimscript
highlight! link vimBracket NightflyBlue
highlight! link vimCommand NightflyOrange
highlight! link vimCommentTitle NightflyViolet
highlight! link vimEnvvar NightflyWatermelon
highlight! link vimFuncName NightflyBlue
highlight! link vimFuncSID NightflyBlue
highlight! link vimFunction NightflyBlue
highlight! link vimNotation NightflyBlue
highlight! link vimOption NightflyTurquoise
highlight! link vimParenSep NightflyWhite
highlight! link vimSep NightflyWhite
highlight! link vimUserFunc NightflyBlue

" XML
highlight! link xmlAttrib NightflyGreen
highlight! link xmlEndTag NightflyBlue
highlight! link xmlTag NightflyGreen
highlight! link xmlTagName NightflyBlue

" Git commits
highlight! link gitCommitBranch NightflyBlue
highlight! link gitCommitDiscardedFile NightflyWatermelon
highlight! link gitCommitDiscardedType NightflyBlue
highlight! link gitCommitHeader NightflyPurple
highlight! link gitCommitSelectedFile NightflyEmerald
highlight! link gitCommitSelectedType NightflyBlue
highlight! link gitCommitUntrackedFile NightflyWatermelon
highlight! link gitEmail NightflyBlue

" Git commit diffs
highlight! link diffAdded NightflyGreen
highlight! link diffChanged NightflyWatermelon
highlight! link diffIndexLine NightflyWatermelon
highlight! link diffLine NightflyBlue
highlight! link diffRemoved NightflyRed
highlight! link diffSubname NightflyBlue

" Tagbar plugin
highlight! link TagbarFoldIcon NightflyCadetBlue
highlight! link TagbarVisibilityPublic NightflyGreen
highlight! link TagbarVisibilityProtected NightflyGreen
highlight! link TagbarVisibilityPrivate NightflyGreen
highlight! link TagbarKind NightflyEmerald

" NERDTree plugin
highlight! link NERDTreeClosable NightflyGreen
highlight! link NERDTreeCWD NightflyPurple
highlight! link NERDTreeDir NightflyBlue
highlight! link NERDTreeDirSlash NightflyWatermelon
highlight! link NERDTreeExecFile NightflyTan
highlight! link NERDTreeFile NightflyWhite
highlight! link NERDTreeFlags NightflyPurple
highlight! link NERDTreeHelp NightflyCadetBlue
highlight! link NERDTreeLinkDir NightflyBlue
highlight! link NERDTreeLinkFile NightflyBlue
highlight! link NERDTreeLinkTarget NightflyTurquoise
highlight! link NERDTreeOpenable NightflyGreen
highlight! link NERDTreePart NightflyRegalBlue
highlight! link NERDTreePartFile NightflyRegalBlue
highlight! link NERDTreeUp NightflyBlue

" NERDTree Git plugin
highlight! link NERDTreeGitStatusDirDirty NightflyTan
highlight! link NERDTreeGitStatusModified NightflyWatermelon
highlight! link NERDTreeGitStatusRenamed NightflyBlue
highlight! link NERDTreeGitStatusStaged NightflyBlue
highlight! link NERDTreeGitStatusUntracked NightflyRed

" vimfiler plugin
highlight! link vimfilerClosedFile NightflyBlue
highlight! link vimfilerMarkedFile NightflyOrange
highlight! link vimfilerNonMark NightflyGreen
highlight! link vimfilerNormalFile NightflyWhite
highlight! link vimfilerOpenedFile NightflyBlue
highlight! link vimfilerROFile NightflyGreyBlue

" fern.vim plugin
highlight! link FernBranchSymbol NightflyGreen
highlight! link FernBranchText NightflyBlue
highlight! link FernMarkedLine NightflyOrange
highlight! link FernMarkedText NightflyOrange
highlight! link FernRootSymbol NightflyPurple
highlight! link FernRootText NightflyPurple

" fern-git-status.vim plugin
highlight! link FernGitStatusBracket NightflyGreyBlue
highlight! link FernGitStatusIndex NightflyEmerald
highlight! link FernGitStatusWorktree NightflyWatermelon

" Misc languages and plugins
highlight! link bufExplorerHelp NightflyCadetBlue
highlight! link bufExplorerSortBy NightflyCadetBlue
highlight! link CleverFDefaultLabel NightflyWatermelon
highlight! link CtrlPMatch NightflyOrange
highlight! link Directory NightflyEmerald
highlight! link HighlightedyankRegion NightflyRegalBlue
highlight! link jsonKeyword NightflyBlue
highlight! link jsonBoolean NightflyTurquoise
highlight! link jsonQuote NightflyWhite
highlight! link netrwClassify NightflyWatermelon
highlight! link netrwDir NightflyBlue
highlight! link netrwExe NightflyTan
highlight! link tagName NightflyTurquoise
highlight! link Cheat40Header NightflyBlue
highlight! link Beacon NightflyWhite
if g:nightflyUnderlineMatchParen
    exec 'highlight MatchWord gui=underline guisp=' . s:yellow
else
    highlight! link highlight NightflyOrange
endif
exec 'highlight snipLeadingSpaces guibg=bg guifg=fg'
exec 'highlight MatchWordCur guibg=bg'

" vimdiff/nvim -d
exec 'highlight DiffAdd guibg=' . s:aqua_2 . ' guifg=bg'
exec 'highlight DiffChange guibg=' . s:dark1
exec 'highlight DiffDelete guibg=' . s:dark1 . ' guifg=' . s:red_2 ' gui=none'
exec 'highlight DiffText guibg=' . s:blue . ' guifg=bg gui=none'

" Neomake plugin
if g:nightflyUndercurls
    exec 'highlight NeomakeError guibg=bg gui=undercurl guisp=' . s:red
    exec 'highlight NeomakeWarning guibg=bg gui=undercurl guisp=' . s:yellow_2
    exec 'highlight NeomakeInfo guibg=bg gui=undercurl guisp=' . s:blue
    exec 'highlight NeomakeMessage guibg=bg gui=undercurl guisp=' . s:white
else
    exec 'highlight NeomakeError guibg=bg'
    exec 'highlight NeomakeWarning guibg=bg'
    exec 'highlight NeomakeInfo guibg=bg'
    exec 'highlight NeomakeMessage guibg=bg'
endif
highlight! link NeomakeErrorSign NightflyRedAlert
highlight! link NeomakeWarningSign NightflyYellowAlert
highlight! link NeomakeInfoSign NightflyBlueAlert
highlight! link NeomakeMessageSign NightflyWhiteAlert

" ALE plugin
if g:nightflyUndercurls
     exec 'highlight ALEError guibg=bg gui=undercurl guisp=' . s:red
     exec 'highlight ALEWarning guibg=bg gui=undercurl guisp=' . s:yellow_2
     exec 'highlight ALEInfo guibg=bg gui=undercurl guisp=' . s:blue
else
    exec 'highlight ALEError guibg=bg'
    exec 'highlight ALEWarning guibg=bg'
    exec 'highlight ALEInfo guibg=bg'
endif
highlight! link ALEVirtualTextError NightflySteelBlue
highlight! link ALEErrorSign NightflyRedAlert
highlight! link ALEVirtualTextWarning NightflySteelBlue
highlight! link ALEWarningSign NightflyYellowAlert
highlight! link ALEVirtualTextInfo NightflySteelBlue
highlight! link ALEInfoSign NightflyBlueAlert

" Neovim LSP diagnostics
highlight! link LspDiagnosticsError NightflySteelBlue
highlight! link LspDiagnosticsErrorSign NightflyRedAlert
highlight! link LspDiagnosticsWarning NightflySteelBlue
highlight! link LspDiagnosticsWarningSign NightflyYellowAlert
highlight! link LspDiagnosticsInformation NightflySteelBlue
highlight! link LspDiagnosticsInformationSign NightflyBlueAlert
highlight! link LspDiagnosticsHint NightflySteelBlue
highlight! link LspDiagnosticsHintSign NightflyWhiteAlert

" GitGutter plugin
highlight! link GitGutterAdd NightflyEmeraldAlert
highlight! link GitGutterChange NightflyPurpleAlert
highlight! link GitGutterChangeDelete NightflyOrangeAlert
highlight! link GitGutterDelete NightflyRedAlert

" Signify plugin
highlight! link SignifySignAdd NightflyEmeraldAlert
highlight! link SignifySignChange NightflyPurpleAlert
highlight! link SignifySignDelete NightflyRedAlert

" FZF plugin
exec 'highlight fzf1 guifg=' . s:red_2 . ' guibg=' . s:dark1
exec 'highlight fzf2 guifg=' . s:blue . ' guibg=' . s:dark1
exec 'highlight fzf3 guifg=' . s:aqua . ' guibg=' . s:dark1
exec 'highlight fzfNormal guifg=' . s:gray
exec 'highlight fzfFgPlus guifg=' . s:gray_2
exec 'highlight fzfBorder guifg=' . s:dark1
let g:fzf_colors = {
  \  'fg':      ['fg', 'fzfNormal'],
  \  'bg':      ['bg', 'Normal'],
  \  'hl':      ['fg', 'Number'],
  \  'fg+':     ['fg', 'fzfFgPlus'],
  \  'bg+':     ['bg', 'Pmenu'],
  \  'hl+':     ['fg', 'Number'],
  \  'info':    ['fg', 'String'],
  \  'border':  ['fg', 'fzfBorder'],
  \  'prompt':  ['fg', 'fzf2'],
  \  'pointer': ['fg', 'Exception'],
  \  'marker':  ['fg', 'StorageClass'],
  \  'spinner': ['fg', 'Type'],
  \  'header':  ['fg', 'CursorLineNr']
  \}

" moonfly-statusline plugin
exec 'highlight User1 guibg=' . s:blue       . ' guifg=' . s:dark0
exec 'highlight User2 guibg=' . s:white      . ' guifg=' . s:dark0
exec 'highlight User3 guibg=' . s:purple_2     . ' guifg=' . s:dark0
exec 'highlight User4 guibg=' . s:red_2 . ' guifg=' . s:dark0
exec 'highlight User5 guibg=' . s:dark1 . ' guifg=' . s:blue       . ' gui=none'
exec 'highlight User6 guibg=' . s:dark1 . ' guifg=' . s:red_2 . ' gui=none'
exec 'highlight User7 guibg=' . s:dark1 . ' guifg=' . s:blue       . ' gui=none'
