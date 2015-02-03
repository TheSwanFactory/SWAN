#
# world.coffee
#
# The World object is the universal monad for SWAN.
# Everything seen by the user is a World.
# The only other object is the Global Object Domain
# which is experienced but not seen.
#
# We do not subclass World.
# Instead, we instantiate it and use SWAN inheritance.

# World does NOT explicitly depend on anything except the global GOD
#
#
#
# The basic API used by all SWAN monads is defined here.
# Overridable properties must be defined on GOD,
# otherwise every instance will use these NOT their parents

Module = require './module'
Enumerable = require './enumerable'
Inheritable = require './inheritable'
Callable = require './callable'
Printable = require './printable'

increment = 0

class World extends Module
  @include Inheritable
  @include Callable
  @include Enumerable
  @include Printable

  constructor: (contents = {}) ->
    @id = increment++
    @_body = []
    @set(property, value) for property, value of contents # overrides this

module.exports = World