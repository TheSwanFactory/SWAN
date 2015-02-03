assert = require 'assert'
GOD    = require '../god'

created_chars = {}

# TODO: this is more useful as an immutable SwanSymbol
# #do returns a new symbol

String::toSwanChar = ->
  factory this.toString()

SwanChar = new GOD.modules.World
  type: 'SwanChar'
  to_json: (world) ->
    world._value
  do: (world, char) ->
    world._value += char

factory = (char) ->
  assert typeof char == 'string', 'SwanChar takes a string'
  assert char.length == 1, 'SwanChar takes one character'

  chr = SwanChar.spawn _value: char
  chr.update [chr]
  chr

module.exports = factory
