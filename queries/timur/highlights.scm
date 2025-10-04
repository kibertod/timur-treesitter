; Comments
(comment) @comment

; Keywords
[
  "return"
  "class"
  "if"
  "elif"
  "is"
  "end"
  "extends"
  "var"
  "then"
  "loop"
  "while"
] @keyword

; Literals
(literal string: (lit_str)) @string
(literal integer: (lit_int)) @number
(literal real: (lit_real)) @float
[
  "true"
  "false"
] @boolean
