Token = require './token'

Element = new World
  do: (world, element) ->
    if element.get('type') in world.get('accepts')
      world._value.push element
      null
    else
      Token()

elements = require('./elements')(Element)

factory = (char) ->
  char = char.toSwanChar() unless char instanceof World
  match = false
  for name, element of elements
    if char._value in element.match
      match = element
      break
  match = elements.unknown unless match
  match.sub _body: char, _value: []

module.exports = factory
