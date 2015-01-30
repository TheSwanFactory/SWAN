Token = require '../token'

module.exports = (Element) ->
  Element.sub
    match:   ['}']
    accepts: []
    type:    'ClosureCloseElement'
    token:   Token
      type:     'ClosureCloseToken'
      is_close: true
