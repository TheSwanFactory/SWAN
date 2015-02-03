GOD = require '../god'

Callable =
  OUT: ->
    @get 'out'

  send: (property, args) ->
    method = @get property
    if method? && typeof method == 'function'
      method this, args
    else
      GOD.globals.InvalidMethod

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
  InvalidMethod: "InvalidMethod"
  InvalidArgument: "InvalidArgument"
  do: (world, args) ->
    if @has 'accepts' and not @send('accepts', args)
      return GOD.globals.InvalidArgument
    world.push args
    world

  done: (world, args) ->
    out = world.OUT()
    out.DONE(args) if out

module.exports = Callable
