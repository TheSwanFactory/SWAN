Token = new World
  type: 'Token'

factory = (dict = {}) ->
  dict.is_terminal ?= false
  dict.is_context  ?= false
  Token.sub dict

module.exports = factory

