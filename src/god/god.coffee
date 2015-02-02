#
# god.coffee
#
# The Global Object Domain is the implicit root of every SWAN monad
#
# do, done, and each are defined here so they are easily overridable
#
# Eventually all World methods should be bound to
# SWAN-visible properties, either here or somewhere.

SwanString = require './worlds/string'

module.exports =
  type: 'GOD'

# globals -> should be divided up semantically

# shim make_world

# each semantic should register a constructor somehow

God.factory = Route()

# In World
GOD.factory.push
  predicate: (object) -> object instanceof World
  generator: (object) -> object

# In string.coffee

GOD.factory.push
  predicate: (object) -> typeof object == 'string'
  generator: (object) -> SwanString object

GOD.to_s: (object) -> SwanString object

# Used via
God.factory.do input # -> result


make_world = (object) ->
  return object
  # TODO: replace explicit SwanString with calls to this
  return SwanString object if typeof object == 'string'
  return SwanNil()         if object == null
  return new World(object)

