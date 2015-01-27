module.exports = (Element) ->
  Element.sub
    match:   [' ']
    accepts: ['WhitespaceElement']
    type:    'WhitespaceElement'
    token: new World
      type: 'WhitespaceToken'
