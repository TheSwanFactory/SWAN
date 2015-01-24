Token    = require './token'

Element = new World
  do: (world, element) ->
    if element.get('type') in world.accepts
      null
    else
      Token()

elements = require('./elements')(Element)

factory = (char) ->
  match = false
  for name, element of elements
    if char._value in element.match
      match = element
      break
  match = elements.unknown unless match
  match.sub _body: char

module.exports = factory
