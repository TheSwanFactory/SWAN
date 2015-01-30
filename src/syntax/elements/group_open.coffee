Token = require '../token'

module.exports = (Element) ->
  Element.sub
    match:   ['{']
    accepts: []
    type:    'ClosureOpenElement'
    token:   Token
      type:       'ClosureOpenToken'
      is_context: true

