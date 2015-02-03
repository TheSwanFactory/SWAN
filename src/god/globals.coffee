# This should be emptied out into different concepts

module.exports =
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
