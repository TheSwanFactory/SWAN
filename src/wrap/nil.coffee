GOD = require '../god'

SwanNil = GOD.spawn
  type:    'SwanNil'
  is_nil: ->
    true
  do: (world, arg) ->
    arg
  then: ->
    GOD.globals.nil
  else: (world, block) ->
    block.DO GOD.globals.nil

GOD.extend
  nil: SwanNil.spawn()
  is_nil: ->
    false
  not_nil: (world) ->
    !world.send('is_nil')
  then: (world, block) ->
    block.DO GOD.globals.nil
  else: ->
    GOD.globals.nil

GOD.wrapper.push GOD.spawn
  accept_literals: [null, false]
  do: (js_object) ->
    GOD.globals.nil

module.exports = SwanNil
