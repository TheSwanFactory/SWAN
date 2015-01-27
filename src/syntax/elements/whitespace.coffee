Token = require '../token'

module.exports = (Element) ->
  Element.sub
    match:   [' ']
    accepts: ['WhitespaceElement']
    type:    'WhitespaceElement'
    token:   Token('WhitespaceToken')
