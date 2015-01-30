assert = require 'assert'
utils  = require '../utils'

Expression = new World
  type: 'Expression'
  do: (world, token) ->
    if token.get('is_context')
      context = factory()
      world.push context
      world.open_context = context
      null
    else if world.open_context?
      if token.get('is_close')
        world.open_context = null
      else
        world.open_context.DO token
      null
    else
      world.push token
      if token.get('is_terminal') then world else null

  done: (world) ->
    world

factory = ->
  Expression.sub
    _body: []

module.exports = factory
