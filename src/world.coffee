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
#
# The basic API used by all SWAN monads is defined here.
# Overridable properties must be defined on GOD,
# otherwise every instance will use these NOT their parents

GOD = require './god'

module.exports = class World
  constructor: (contents = {}) ->
    @_body = []
    @set(property, value) for property, value of contents # overrides this

  UP: ->
    @up || GOD

  OUT: ->
    @get 'out'

  # invocation

  # 'DO' is the SPI on World
  # 'do' is the actual SPI, which is SWAN-inherited
  DO: (args) ->
    @get('do')(this, args)

  DONE: (args) ->
    @get('done')(this, args)

  # properties

  set: (property, value) ->
    this[property] = value

  has: (property) ->
    this[property]?

  super: (property) ->
    @UP().get property

  get: (property) ->
    if @has property
      this[property]
    else
      @super property

  # body

  push: (value) =>
    @_body.push value

  unshift: (value) =>
    @_body.unshift value

  update: (array) =>
    @_body = array

  toJSON: ->
    @get('to_json')(this)

  # subs

  sub: (contents) ->
    contents.up = this
    new @constructor contents

  # Enumeration

  _each: (world, collection) =>
    world.DO(item) for item in collection
    @DONE()

  each_body: (world) =>
    @_each world, @_body

  each_prop: (world) =>
    @_each world, Object.keys(this)

  # TODO: do we need to call @done?
  fold: (initial) ->
    memo = initial
    for item in @body
      memo = if memo? then memo.do(item) else item
    memo
