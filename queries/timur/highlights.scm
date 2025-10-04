; Comments
(comment) @comment

; Keywords
[
  "var"
  "is"
  "end"
] @keyword
"class" @keyword.type
"extends" @keyword.modifier
"return" @keyword.return
[
  "while"
  "loop"
] @keyword.repeat
[
  "if"
  "elif"
  "then"
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

