#
# god.coffee
#
# The Global Object Domain is the implicit root of every SWAN monad
#
# do, done, and each are defined here so they are easily overridable
#
# Eventually all World methods should be bound to
# SWAN-visible properties, either here or somewhere.

module.exports =
  type: 'GOD'

  get: (property) ->
    this[property]

  do: (world, args) =>
    console.log 'do', world, args
    world.push args

  done: (world, args) =>
    console.log 'done', world, args
    out = world.OUT()
    out.DONE(args) if out

  each: (world, args) =>
    console.log 'each', world, args
    world.each_body(args)
