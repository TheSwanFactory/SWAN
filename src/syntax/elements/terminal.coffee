Token = require '../token'

module.exports = new World
  match:   '{}()[];,'.split('')
  accepts: []
  type:    'TerminalElement'
  token:   Token
    type:        'TerminalToken'
    is_terminal: true
    is_context:  false
