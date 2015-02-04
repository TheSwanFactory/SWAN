GOD = require '../god'

SwanNil = new GOD.modules.World
  accept_literals: [null, false]
  type:    'SwanNil'
  is_nil:  -> true

factory = (dict) ->
  SwanNil.spawn dict

GOD.extend
  nil: SwanNil()
  true: 
module.exports = factory