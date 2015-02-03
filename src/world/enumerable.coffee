GOD = '../god'

Enumerable =
  push: (value) ->
    @_body.push value

  unshift: (value) ->
    @_body.unshift value

  update: (array) ->
    @_body = array

  length: ->
    @_body.length

  # Enumeration

  _each: (world, collection) ->
    world.DO(item) for item in collection
    @DONE()

  each_body: (world) ->
    @_each world, @_body

  each_prop: (world) ->
    @_each world, Object.keys(this)

  # TODO: do we need to call @done?
  fold: (initial) ->
    memo = initial
    for item in @_body
      memo = if memo? then memo.do(item) else item
    memo.done()

GOD.each = (world, args) ->
  world.each_body(args)

module.exports = Enumerable
