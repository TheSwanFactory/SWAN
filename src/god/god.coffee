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
    world

  done: (world, args) ->
    out = world.OUT()
    out.DONE(args) if out

  each: (world, args) ->
    world.each_body(args)

  inspect: (world) ->
    {
      type: world.type,
      body: world.toJSON()
    }

  is_nil:  ->
    false

  not_nil: (world) ->
    !world.call('is_nil')

  to_json: (world) ->
    body = world._body
    if body.toJSON
      body = body.toJSON?()
    body.type = world.get 'type'
    body

  to_s: (world) ->
    SwanString JSON.stringify(world)
