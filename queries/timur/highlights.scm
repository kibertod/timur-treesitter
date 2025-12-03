; Keywords
"var" @keyword
"void" @keyword
"class" @keyword.type
"extends" @keyword.modifier
"return" @keyword.return
"while" @keyword.repeat
[
  "if"
  "elif"
  "else"
] @keyword.conditional

; Punctuation
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

; Literals
(literal string: (lit_str)) @string
(literal integer: (lit_int)) @number
(literal real: (lit_real)) @number.float
[
  "true"
  "false"
] @boolean

; Variables
(identifier) @variable
(expression member: (identifier) @variable.member)
(argument name: (identifier) @variable.parameter)

; Types
(type_name name: (identifier) @type)
; (class base_classes: (type_name) @type)

; Functions
(expression method: (identifier) @function.method.call)
(member_declaration name: (identifier) @function.method)

; Misc
[
 "this"
 "super"
] @constructor
(comment) @comment
":=" @operator
