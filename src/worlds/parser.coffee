Expression = require './expression'
assert     = require 'assert'

###
Parser is responsible for creating expressions and sub expressions

it takes a stream of Tokens and emits a tree of Expressions
###

Parser = new World
  type: 'Parser'
  do: (world, token) ->
    assert token instanceof World, 'token must be a World'

    world._value = Expression() unless world._value?

    expression = world._value.DO token

    if expression
      world.out.DO expression
      world._value = Expression()

  done: (world, args) ->
    world.out.DO world._value.DONE(args)
    world.out.DONE(args)

factory = (out) ->
  Parser.sub
    out: out

module.exports = factory
