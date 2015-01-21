# Properties
# - named
# - enunerated
# Scope
# Callable
# .- call or apply
# Magic properties
# - up (data)
# - get (method)
# - sub (method)
# - subs (data)
# - each (method: subs)
# - each_prop (method: Object.keys - magic)
# -do (method)
# - done (method)
# - out (data)
# plus who can see or change various values

GOD = require './god'

module.exports = class World
  constructor: (contents = {}, @_up = null) ->
    @_subs = []
    @_body = []
    @_out  = null
    @_fold = null
    @set(property, value) for property, value of contents

  up: ->
    @_up || GOD

  out: ->
    @_out

  # Invocation

  do: (world, args) =>
    @push.apply this, arguments

  done: (args) ->
    @_out.done(args) if @_out

  # properties

  set: (property, value) ->
    this[property] = value

  has: (property) ->
    this[property]?

  get: (property) ->
    if @has property
      if typeof this[property] == 'function'
        this[property](this)
      else
        this[property]
    else
      @up().get property

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
    @sub_push new @constructor(contents, this)

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
    world.do this, item for item in collection
    @done()

  each: (world) =>
    @_each world, @body()
    
  each_sub: (world) =>
    @_each world, @subs()

  each_prop: (world) =>
    @_each world, Object.keys(this)

  fold: (initial) ->
    memo = initial
    