Element  = require '../../src/syntax/element'
SwanChar = require '../../src/worlds/char'

describe 'Element', ->
  it 'gets element with SwanChar', ->
    e = Element SwanChar ' '
    expect(e.get 'type').to.eq 'WhitespaceElement'

  it 'gets element with javascript char', ->
    e = Element ' '
    expect(e.get 'type').to.eq 'WhitespaceElement'

  describe '#do', ->
    describe 'accepted element', ->
      it 'appends', ->
        e = Element ' '
        m = Element ' '
        e.DO m
        expect(e._value[0]).to.eql m

      it 'returns null', ->
        e = Element ' '
        m = Element ' '
        return_value = e.DO m
        expect(return_value).to.eq null

    describe 'not-accepted element', ->
      it 'returns token', ->
        element = Element ' '
        unknown = Element '˨'
        return_value = element.DO unknown
        expect(return_value.get 'type').to.eq 'Token'
