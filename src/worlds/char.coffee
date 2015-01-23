assert = require 'assert'

created_chars = {}

SwanChar = null

memo = ->
  SwanChar ||= new World
    type: 'SwanChar'
    to_json: (world) ->
      world._value
    do: (world, char) ->
      world._value += char

factory = (char) ->
  assert typeof char == 'string', 'SwanChar takes a string'
  assert char.length == 1, 'SwanChar takes one character'

  chr = new World up: memo(), _value: char
  chr.update [chr]
  chr

module.exports = factory
