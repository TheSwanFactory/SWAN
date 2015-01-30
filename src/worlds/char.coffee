SwanString = require './string'
utils      = require '../utils'
assert     = require 'assert'

created_chars = {}

# TODO: this is more useful as SwanSymbol
# #do returns a new symbol

String::toSwanChar = ->
  factory this.toString()

SwanChar = utils.memoize ->
  new World
    type: 'SwanChar'
    to_json: (world) ->
      world._value
    do: (world, char) ->
      world._value += char

factory = (char) ->
  assert typeof char == 'string', 'SwanChar takes a string'
  assert char.length == 1, 'SwanChar takes one character'

  chr = new World up: SwanChar(), _value: char
  chr.update [chr]
  chr

module.exports = factory
