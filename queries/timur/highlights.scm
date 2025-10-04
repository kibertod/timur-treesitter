; Comments
(comment) @comment

; Keywords
"var" @keyword
"class" @keyword.type
"extends" @keyword.modifier
"return" @keyword.return
"while" @keyword.repeat
[
  "if"
  "elif"
] @keyword.conditional

; Punctuation
[
  ":"
  ","
] @punctuation.delimeter

[
 "["
 "]"
 "("
 ")"
 "is"
 "then"
 "loop"
 "end"
] @punctuation.bracket

; Operators
":=" @operator

; Literals
(literal string: (lit_str)) @string
[
  (literal integer: (lit_int))
  (literal real: (lit_real))
] @number
[
  "true"
  "false"
] @boolean

