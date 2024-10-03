if exists('b:current_syntax')
	finish
endif

syn region  j5Comment start="\/\*" end="\*\/" contains=@j5CommentGrp
syn region  j5Comment start="\/\/" end=/$/ keepend contains=@j5CommentGrp
syn region  j5String  start=/"/ skip=/\\./ end=/"/
syn region  j5Description  start=/|/ skip=/\\$/ end="$" contains=@j5StringGrp,@Spell

syn match j5RootOpener /^\(\s*\)\w\+/

" Assignment
"                           | Leading Whitespace
"                           |   | ident. any number of times
"                           |   |         | ident
"                           |   |         |   | optional whitespace
"                           |   |         |   |  | = or +=
syn region j5Assign start=/^\s*\(\w\+\.\)*\w\+\s*+\?=/ end=/$/ contains=j5AssignKey,j5RHS keepend


" RHS of an Assign (or += append will also match)
syn region j5RHS start="=" end="$" contains=@j5ValueGrp contained
syn match j5AssignKey /\w\+/ contained


syn match   j5Int     /\d\+/ contained
syn match   j5Decimal /\d\+\.\d\+/ contained
syn keyword j5Bool    true false contained

syn cluster j5ValueGrp contains=j5Int,j5Decimal,j5Bool,j5String

hi def link j5RootOpener   Statement
hi def link j5AssignKey    Identifier
hi def link j5AppendKey    Identifier
hi def link j5Ident        Identifier
hi def link j5Bool         Boolean
hi def link j5Int          Number
hi def link j5Decimal      Number
hi def link j5Comment      Comment
hi def link j5String       String
hi def link j5Description  String

set comments=s1:/*,mb:*,ex:*/,://,:\|
set cindent

let b:current_syntax = 'j5s'

