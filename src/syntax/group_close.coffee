Token = require '../evaluate/token'

module.exports = (Element) ->
  Element.sub
    match:   '})]'.split('')
    accepts: []
    type:    'GroupCloseElement'
    token:   Token
      type:     'GroupCloseToken'
      is_close: true
