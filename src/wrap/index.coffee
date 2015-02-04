# index of wrappers

# Each wrapper must:
# - push a typed world into GOD.wrap
# - export a function that creates a World
# - set additional properties on GOD if necessary

GOD = require '../god'

wrappers =
  nil:  require './nil'
  char: require './char'

GOD.wrap = (literal) ->
  for name, wrapper of wrappers
    wrapped = wrapper literal
    puts wrapper.toString()
    puts wrapped.up
    puts wrapped.get('accept_literals')
    return wrapped if (literal in wrapped.get 'accept_literals')
  wrappers.nil()

module.exports = wrappers
