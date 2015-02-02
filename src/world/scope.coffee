class Scope extends Body

  UP: ->
    @up || GOD

  # properties

  set: (property, value) ->
    this[property] = value

  has: (property) ->
    this[property]?

  super: (property) ->
    @UP().get property

  get: (property) ->
    if @has property
      this[property]
    else
      @super property
end
