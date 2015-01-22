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

  get: (property) ->
    this[property]

  do: (world, args) ->
    world.push args

  done: (world, args) ->
    out = world.OUT()
    out.DONE(args) if out

  each: (world, args) ->
    world.each_body(args)

  to_json: (world) ->
    world._body.toJSON()

  to_s: (world) ->
    SwanString JSON.stringify(world)
