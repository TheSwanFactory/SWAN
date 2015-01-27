Token = require './token'

Element = new World
  do: (world, element) ->
    if element.get('type') in world.get('accepts')
      world.update world._body.concat(element._body)
      null
    else
      world.up = world.get 'token'

elements = require('./elements')(Element)

factory = (char) ->
  char = char.toSwanChar() unless char instanceof World
  match = false
  for name, element of elements
    if char._value in element.match
      match = element
      break
  match = elements.unknown unless match
  match.sub _body: [char]

module.exports = factory
