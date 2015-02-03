GOD = require '../god'

Callable =
  OUT: ->
    @get 'out'

  send: (property, args) ->
    method = @get property
    if method? && typeof method == 'function'
      method this, args
    else
      throw new Error("#{property} is not a valid method")

  # invocation

  # 'DO' is the SPI on World
  # 'do' is the actual SPI, which is SWAN-inherited
  DO: (args) ->
    @send('do', args)

  DONE: (args) ->
    @send('done', args)

  emit: (args) ->
    # sends to out if it exists
    # else prints to console.lorg

GOD.extend
  do: (world, args) ->
    world.push args
    world

  done: (world, args) ->
    out = world.OUT()
    out.DONE(args) if out

module.exports = Callable
