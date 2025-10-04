(comment) @comment

"var" @keyword
"class" @keyword.type
"extends" @keyword.modifier
"return" @keyword.return
"while" @keyword.repeat
[
  "if"
  "elif"
  "else"
] @keyword.conditional

[
  ":"
  ","
  "."
] @punctuation.delimeter
[
 "("
 ")"
 "is"
 "then"
 "loop"
 "end"
] @punctuation.bracket
[
 "["
 "]"
] @punctuation.special

":=" @operator

(literal string: (lit_str)) @string
(literal integer: (lit_int)) @number
(literal real: (lit_real)) @number.float
[
  "true"
  "false"
] @boolean

(identifier) @variable
(type_name name: (identifier) @type)
(class base_classes: (identifier) @type)
(expression method: (identifier) @function.method.call)
(expression member: (identifier) @variable.member)
(member_delcaration name: (identifier) @function.method)

[
 "this"
 "super"
] @constructor
