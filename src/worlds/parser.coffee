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

    unless world.expression?
      world.call 'create_expression'

    world.call 'add_to_expression', [world.expression, token]

    if token.get('is_terminal')
      world.out.DO world.expression
      world.expression = null

  create_expression: (world) ->
    world.expression = Expression()
    world.push world.expression
    world.expression

  add_to_expression: (world, [expression, token]) =>
    if token.get('is_context')
      context = Expression()
      expression.push context
      expression.open_context = context
      expression.open_token   = token
    else if expression.open_context?
      if token.get('is_close')
        assert expression.open_token.call('valid_end', token),
               'Invalid end token'
        expression.open_context = null
      else
        world.call 'add_to_expression', [expression.open_context, token]
    else
      expression.push token

  done: (world, args) ->
    world.out.DO world.expression.DONE(args)
    world.out.DONE(args)

factory = (out) ->
  Parser.sub
    out: out

module.exports = factory
