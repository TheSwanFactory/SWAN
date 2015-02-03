module.exports =
  toJSON: ->
    @send('to_json')

  toS: ->
    @send('to_s')
