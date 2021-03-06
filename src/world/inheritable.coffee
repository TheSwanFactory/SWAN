GOD = require '../god'

Inheritable =
  UP: ->
    @up || GOD.globals

  # properties

  spawn: (dict = {}) ->
    dict.up = this
    new @constructor dict

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

GOD.extend
  get: (property) ->
    this[property]
  type: 'World'

module.exports = Inheritable
