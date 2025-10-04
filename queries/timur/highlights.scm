(comment) @comment

"var" @keyword
"class" @keyword.type
"extends" @keyword.modifier
"return" @keyword.return
"while" @keyword.repeat
[
  "if"
  "elif"
] @keyword.conditional

[
  ":"
  ","
  "."
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

":=" @operator

(literal string: (lit_str)) @string
(literal integer: (lit_int)) @number
(literal real: (lit_real)) @number.float
[
  "true"
  "false"
] @boolean

[
  (type_name name: (identifier))
  (class base_classes: (identifier))
] @type

[
 "this"
 "super"
] @constructor
