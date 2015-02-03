assert     = require 'assert'

created_chars = {}

# TODO: this is more useful as an immutable SwanSymbol
# #do returns a new symbol

String::toSwanChar = ->
  factory this.toString()

SwanChar =  new World
  type: 'SwanChar'
  to_json: (world) ->
    world._value
  do: (world, char) ->
    world._value += char

factory = (char) ->
  assert typeof char == 'string', 'SwanChar takes a string'
  assert char.length == 1, 'SwanChar takes one character'

  chr = new World _value: char # up: SwanChar(),
  chr.update [chr]
  chr

module.exports = factory
