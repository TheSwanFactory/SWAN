assert = require 'assert'

Lexer = new World
  do: (world, element) ->
    assert element instanceof World, 'element must be a World'

    return world._value = element unless world._value?

    token = world._value.DO element # IdentifierSyntax
    # appends 'p' to its body and returns null the first time
    # returns NameToken the second ' '
    if token
      world.out.DO token # NameToken
      world._value = element # Whitespace

  done: (world, args) ->
    world.out.DO world._value.DONE(args) if world._value
    world.out.DONE(args)

factory = (out) ->
  Lexer.sub out: out

module.exports = factory
