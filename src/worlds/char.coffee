module.exports = class SwanChar extends World
  constructor: (contents = '', @_up = null) ->
    super()
    @_body = contents.split('')[0]