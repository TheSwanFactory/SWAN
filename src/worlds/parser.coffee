Expression = require './expression'
assert     = require 'assert'

Parser = new World
  type: 'Parser'
  do: (world, token) ->
    assert token instanceof World, 'token must be a World'

    world._value = Expression() unless world._value?

    expression = world._value.DO token # IdentifierSyntax
    # appends 'p' to its body and returns null the first time
    # returns NameToken the second ' '
    if expression
      world.out.DO expression # NameToken
      world._value = token # Whitespace

  done: (world, args) ->
    world.out.DO world._value.DONE(args)
    world.out.DONE(args)

factory = (out) ->
  Parser.sub
    out: out

module.exports = factory
