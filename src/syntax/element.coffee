Token = require './token'

Element = new World
  do: (world, element) ->
    puts element.get('type'), world.get('accepts')
    if element.get('type') in world.get('accepts')
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
  match.sub _body: char

module.exports = factory
