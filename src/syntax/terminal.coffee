Token = require '../evaluate/token'

module.exports = (Element) ->
  Element.sub
    match:   ';,'.split('')
    accepts: []
    type:    'TerminalElement'
    token:   Token
      type:        'TerminalToken'
      is_terminal: true
