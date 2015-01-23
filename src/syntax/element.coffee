elements = require './elements'

Element = new World

UnknownElement = Element.sub
  type: 'UnknownElement'

factory = (char) ->
  for name, element of elements
    if char._value in element.match
      return Element.sub type: element.type, _body: char
  UnknownElement

module.exports = factory
