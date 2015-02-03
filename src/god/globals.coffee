# This should be emptied out into different concepts

module.exports =
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
    !world.send('is_nil')

  to_json: (world) ->
    body = world._body
    if body.toJSON
      body = body.toJSON?()
    body.type = world.get 'type'
    body

  to_s: (world) ->
    SwanString JSON.stringify(world)
