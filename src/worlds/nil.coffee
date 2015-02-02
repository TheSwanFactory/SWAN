SwanNil = new World
  type:    'SwanNil'
  is_nil:  -> true

factory = (dict) ->
  SwanNil.sub dict

module.exports = factory
