GOD = require '../god'

SwanNil = new GOD.modules.World
  accepts: null
  type:    'SwanNil'
  is_nil:  -> true

factory = (dict) ->
  SwanNil.spawn dict

module.exports = factory

