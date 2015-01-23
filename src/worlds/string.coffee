SwanChar = require './char'

String::toSwanChars = ->
  this.split('').map((letter) -> SwanChar(letter))

SwanString = null

memo = ->
  SwanString ||= new World
    do: (world, str) ->
      collection = if str instanceof World
        str._body
      else
        str.toSwanChars()
      world.push(char) for char in collection
    to_json: (world) ->
      world._body.map((char) -> char.toJSON()).join('')
    to_s: (world) ->
      world

factory = (str) ->
  throw new Error('body must be a String') unless typeof str == 'string'
  new World _body: str.toSwanChars(), up: memo()

module.exports = factory
