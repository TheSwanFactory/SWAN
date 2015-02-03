Token = require '../evaluate/token'

pairs =
  '{': '}'
  '(': ')'
  '[': ']'

module.exports = (Element) ->
  Element.sub
    match:   '{(['.split('')
    accepts: []
    type:    'GroupOpenElement'
    token:   Token
      type:       'GroupOpenToken'
      is_context: true
      valid_end: (world, end_token) ->
        open_char  = world._body[0]._value
        close_char = end_token._body[0]._value
        pairs[open_char] == close_char

