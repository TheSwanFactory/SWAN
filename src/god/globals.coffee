# This should be emptied out into different concepts

module.exports =
  inspect: (world) ->
    {
      type: world.type,
      body: world.toJSON()
    }
