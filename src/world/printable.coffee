GOD = require '../god'

Printable =
  toJSON: ->
    @send('to_json')

  toS: ->
    @send('to_s')

GOD.extend
  to_json: (world) ->
    json =
      body: world._body
      type: world.get('type')
    if json.body instanceof GOD.modules.World
      json.body = world._body.toJSON()
    json

module.exports = Printable
