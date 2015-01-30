Expression = new World
  type: 'Expression'
  do: (world, token) ->
    world.push token
    if token.get('is_terminal') then world else null
  done: (world) ->
    world

factory = ->
  Expression.sub
    _body: []

module.exports = factory
