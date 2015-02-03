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

