Expression = new World
  type: 'Expression'
  do: (world, token) ->
    world.push token
    null

factory = ->
  Expression.sub
    _body: []

module.exports = factory
