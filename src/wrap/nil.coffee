GOD = require '../god'

SwanNil = GOD.spawn
  accept_literals: [null, false]
  type:    'SwanNil'
  is_nil:  -> true

factory = (dict) ->
  SwanNil.spawn dict

GOD.extend
  nil: factory()
  is_nil: ->
    false
  not_nil: (world) ->
    !world.send('is_nil')
  is_false: ->
    false
  is_true: (world) ->
    !world.call 'is_false'

module.exports = factory
