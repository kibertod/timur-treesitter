module.exports = grammar({
  name: "timur",

  extras: ($) => [/\s/, $.comment],

  conflicts: ($) => [
    // Add any parsing conflicts here if needed
  ],

  rules: {
    program: ($) => repeat($.class),

    class: ($) =>
      seq(
        "class",
        field("name", $.type_name),
        optional(
          seq(
            "extends",
            field(
              "base_classes",
              optional(
                seq($.type_name, optional(repeat(seq(",", $.type_name)))),
              ),
            ),
          ),
        ),
        "is",
        field("members", repeat($.member_declaration)),
        "end",
      ),

    type_name: ($) =>
      choice(
        seq(field("name", $.identifier)),
        seq(
          field("name", $.identifier),
          "[",
          field("type_parameters", $.type_names),
          "]",
        ),
      ),

    type_names: ($) => seq($.type_name, repeat(seq(",", $.type_name))),

    expression: ($) =>
      choice(
        seq("this", ".", field("member", $.identifier)),
        seq(
          "this",
          "(",
          field(
            "arguments",
            optional(seq($.expression, repeat(seq(",", $.expression)))),
          ),
          ")",
        ),
        seq($.expression, ".", field("member", $.identifier)),
        seq(
          $.expression,
          ".",
          field("method", $.identifier),
          "(",
          field(
            "arguments",
            optional(seq($.expression, repeat(seq(",", $.expression)))),
          ),
          ")",
        ),
        seq(
          $.type_name,
          "(",
          field(
            "arguments",
            optional(seq($.expression, repeat(seq(",", $.expression)))),
          ),
          ")",
        ),
        seq(
          "super",
          "(",
          field(
            "arguments",
            optional(seq($.expression, repeat(seq(",", $.expression)))),
          ),
          ")",
        ),
        $.identifier,
        $.literal,
      ),

    literal: ($) =>
      choice(
        field("string", $.lit_str),
        field("integer", $.lit_int),
        field("real", $.lit_real),
        "true",
        "false",
      ),

    variable: ($) =>
      choice(
        seq(
          "var",
          field("name", $.identifier),
          ":",
          field("type", $.type_name),
        ),
        seq(
          "var",
          field("name", $.identifier),
          ":",
          field("type", $.type_name),
          ":=",
          field("value", $.expression),
        ),
      ),

    statement: ($) =>
      choice(
        seq("return", choice("void", field("value", $.expression))),
        seq($.expression, ":=", field("value", $.expression)),
        $.expression,
        $.variable,
        seq(
          "while",
          field("condition", $.expression),
          "loop",
          field("body", optional(repeat($.statement))),
          "end",
        ),
        seq(
          "if",
          field("condition", $.expression),
          "then",
          field("then_branch", optional(repeat($.statement))),
          field("elif_branches", repeat($.el_if)),
          "end",
        ),
        seq(
          "if",
          field("condition", $.expression),
          "then",
          field("then_branch", optional(repeat($.statement))),
          field("elif_branches", repeat($.el_if)),
          "else",
          field("else_branch", optional(repeat($.statement))),
          "end",
        ),
      ),

    el_if: ($) =>
      seq(
        "elif",
        field("condition", $.expression),
        "then",
        field("body", optional(repeat($.statement))),
      ),

    argument: ($) =>
      seq(field("type", $.type_name), ":", field("name", $.identifier)),

    member_declaration: ($) =>
      choice(
        seq(
          field("return_type", $.type_name),
          field("name", $.identifier),
          "(",
          field(
            "parameters",
            optional(seq($.argument, repeat(seq(",", $.argument)))),
          ),
          ")",
          "is",
          field("body", optional(repeat($.statement))),
          "end",
        ),
        seq(
          "this",
          "(",
          field(
            "parameters",
            optional(seq($.argument, repeat(seq(",", $.argument)))),
          ),
          ")",
          "is",
          field("body", optional(repeat($.statement))),
          "end",
        ),
        $.variable,
      ),

    // Tokens
    identifier: ($) => /[a-zA-Z_][a-zA-Z0-9_]*/,

    lit_str: ($) => /"([^"\\]|\\.)*"/,

    lit_int: ($) => /[0-9]+/,

    lit_real: ($) => /[0-9]+\.[0-9]*/,

    comment: ($) => token(seq("//", /.*/)),
  },
});
