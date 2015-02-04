GOD = require '../god'

SwanNil = GOD.spawn
  type:    'SwanNil'
  is_nil: ->
    true

GOD.extend
  nil: SwanNil.spawn()
  is_nil: ->
    false
  not_nil: (world) ->
    !world.send('is_nil')

GOD.wrapper.push GOD.spawn
  accept_literals: [null, false]
  do: (js_object) ->
    GOD.globals.nil

module.exports = SwanNil
