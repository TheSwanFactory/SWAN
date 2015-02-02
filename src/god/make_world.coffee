# replace by dependency injenction on semantics

SwanString = require './string'
SwanNil    = require './nil'

make_world = (object) ->
  return object            if object instanceof World
  # TODO: replace explicit SwanString with calls to this
  return SwanString object if typeof object == 'string'
  return SwanNil()         if object == null
  return new World(object)

module.exports = make_world
