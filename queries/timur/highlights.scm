; Comments
(comment) @comment

; Language structure
[
  "return"
  "class"
  "extends"
  "var"
] @keyword

[
  "while"
  "loop"
] @repeat

[
  "if"
  "elif"
  "then"
] @conditional

":=" @operator

[
  "is"
  "end"
] @delimeter

; Literals
(literal string: (lit_str)) @string
(literal integer: (lit_int)) @number
(literal real: (lit_real)) @float
[
  "true"
  "false"
] @boolean

