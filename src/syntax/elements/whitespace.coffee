Token = require '../token'

module.exports = (Element) ->
  Element.sub
    match:   [' ']
    accepts: ['WhitespaceElement']
    type:    'WhitespaceElement'
    token: Token
      type:        'WhitespaceToken'
      is_terminal: false
      is_context:  false
