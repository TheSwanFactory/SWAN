Token = require '../token'
Expression = require '../../worlds/expression'

module.exports = (Element) ->
  Element.sub
    match:   [' ']
    accepts: ['WhitespaceElement']
    type:    'WhitespaceElement'
    token:   Token
      type: 'WhitespaceToken'
      do: ->
        Expression
          type: 'WhitespaceExpression'
          do: ->
            World.get 'nil'
