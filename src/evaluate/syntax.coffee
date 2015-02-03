# Replaced by GOD.syntax ?

# ingest; first stage of th

Element = require '../syntax/element'

###
Syntax takes a stream of SwanChars and emits a stream of Elements
###

Syntax = new World
  type: 'Syntax'
  do: (world, char) ->
    world.out.DO Element(char)

factory = (out) ->
  new World up: Syntax(), out: out

module.exports = factory
