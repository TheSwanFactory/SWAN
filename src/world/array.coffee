class Body extends Array #if legal
  # body

  push: (value) =>
    @_body.push value

  unshift: (value) =>
    @_body.unshift value

  update: (array) =>
    @_body = array

  length: ->
    @_body.length

end
