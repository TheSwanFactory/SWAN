Token = new World
  type: 'Token'

factory = (type) ->
  Token.sub
    type: type

module.exports = factory

