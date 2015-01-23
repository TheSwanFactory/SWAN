Element = require '../syntax/element'
utils = require '../utils'

Syntax = utils.memoize ->
  new World
    type: 'Syntax'
    do: (world, char) ->
      world.out.DO Element(char)

factory = (out) ->
  new World up: Syntax(), out: out

module.exports = factory
