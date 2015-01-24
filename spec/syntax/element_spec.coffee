Element  = require '../../src/syntax/element'
SwanChar = require '../../src/worlds/char'

describe 'Element', ->
  it 'gets element with SwanChar', ->
    e = Element SwanChar ' '
    expect(e.get 'type').to.eq 'WhitespaceElement'

  it 'gets element with javascript char', ->
    e = Element ' '
    expect(e.get 'type').to.eq 'WhitespaceElement'
