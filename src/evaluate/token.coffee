Token = new World
  type: 'Token'

factory = (dict = {}) ->
  dict.is_terminal ?= false
  dict.is_context  ?= false
  dict.is_close    ?= false
  Token.spawn dict

module.exports = factory

