#
# god.coffee
#
# The Global Object Domain is the implicit root of every SWAN monad
#
# This is where all the World primitives should ultimate be bound

module.exports =
  type: 'GOD'

  get: ->
    this[property]

  do: (world, args) =>
    world.push args

  done: (world, args) =>
    out = world.OUT()
    out.DONE(args) if out

  each: (world, args) =>
    world.each_body(args)
