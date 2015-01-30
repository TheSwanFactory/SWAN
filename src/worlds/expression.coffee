assert = require 'assert'
utils  = require '../utils'

###
Expression is responsible for evaluating itself?
###

Expression = new World
  type: 'Expression'
  do: (world, token) ->
    if token.get('is_context')
      context = factory()
      world.push context
      world.open_context = context
      world.open_token   = token
      null
    else if world.open_context?
      if token.get('is_close')
        assert world.open_token.call('valid_end', token), 'Invalid end group'
        world.open_context = null
      else
        world.open_context.DO token
      null
    else
      world.push token
      if token.get('is_terminal') then world else null

  done: (world) ->
    assert !world.open_context?, 'Non-terminated group in expression'
    world

factory = ->
  Expression.sub
    _body: []

module.exports = factory
