Token = require './token'

###
Element takes a stream of Elements and emits a stream of Tokens
###

Element = new World
  do: (world, element) ->
    if element.get('type') in world.get('accepts')
      world.update world._body.concat(element._body)
      null
    else
      world.DONE()

  done: (world) ->
    world.call('to_token')

  to_token: (world) ->
    world.up = world.get 'token'
    world


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
