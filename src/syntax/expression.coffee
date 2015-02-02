assert = require 'assert'

###
Expression is responsible for evaluating itself?

Expression takes an environment and returns a value
###

Expression = new World
  type: 'Expression'
  done: (world) ->
    assert !world.open_context?, 'Non-terminated group in expression'
    world

factory = ->
  Expression.sub
    _body: []

module.exports = factory
