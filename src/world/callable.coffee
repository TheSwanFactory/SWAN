GOD = require '../god'

Callable =
  OUT: ->
    @get 'out'

  send: (property, args) ->
    method = @get property
    if method? && typeof method == 'function'
      method this, args
    else
      GOD.globals.InvalidMethod method

  # invocation

  # 'DO' is the SPI on World
  # 'do' is the actual SPI, which is SWAN-inherited
  DO: (args) ->
    if @send('accepts', args).send('is_true')
      return GOD.globals.InvalidArgument args
    @send('do', args)

  DONE: (args) ->
    @send('done', args)

  emit: (args) ->
    # sends to out if it exists
    # else prints to console.lorg

# TODO: Make this its own file
ERROR = (name) ->
  (args) -> GOD.spawn # new GOD.modules.World
    type: 'Error'
    name: name
    value: args

accept_function =  (world, args) ->
  if world.has 'accept_literals'
    return (args in literals)
    # match on literals
  if world.has 'accept_types'
    for type in world.accept_types
      return true if world.has_type(type) # checks type 'up'-wards
    return false
  true

GOD.extend
  InvalidMethod: ERROR "InvalidMethod"
  InvalidArgument: ERROR "InvalidArgument"

  accepts: (world, args) ->
    GOD.wrap accept_function(world,args)

  do: (world, args) ->
    world.push args
    world

  done: (world, args) ->
    out = world.OUT()
    out.DONE(args) if out

module.exports = Callable
