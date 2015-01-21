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
  constructor: (contents = {}, @_up = null) ->
    @_subs = []
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
     doer = @get('do')
     console.log 'DO', doer
     doer.call(this, args)

  DONE: (args) ->
     doer = @get('done')
     console.log 'DONE', doer
     doer.call(this, args)

  # properties

  set: (property, value) ->
    this[property] = value

  has: (property) ->
    this[property]?

  super: (property) ->
    @UP().get property

  get: (property) ->
    if @has property
      if typeof this[property] == 'function'
        this[property](this)
      else
        this[property]
    else
      @super property

  # body

  body: ->
    @_body

  push: (value) =>
    @_body.push value

  unshift: (value) =>
    @_body.unshift value

  update: (array) =>
    @_body = array

  # subs

  sub: (contents) ->
    contents.up = this
    @sub_push new @constructor contents

  sub_push: (contents) ->
    @subs().push contents

  subs: ->
    @_subs

  @array_sub: (array) ->
    world = new this array

  @string_sub: (string) ->
    world = new this

  # Enumeration

  _each: (world, collection) =>
    world.DO(item) for item in collection
    @DONE()

  each_body: (world) =>
    @_each world, @body()

  each_sub: (world) =>
    @_each world, @subs()

  each_prop: (world) =>
    @_each world, Object.keys(this)

  # TODO: do we need to call @done?
  fold: (initial) ->
    memo = initial
    for item in @body
      memo = if memo? then memo.do(item) else item
    memo
