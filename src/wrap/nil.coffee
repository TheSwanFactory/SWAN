SwanNil = new World
  type:    'SwanNil'
  is_nil:  -> true


factory = (dict) ->
  SwanNil.spawn dict

module.exports = factory
