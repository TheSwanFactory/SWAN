Element  = require '../../src/syntax/element'
SwanChar = require '../../src/wrap/char'

describe 'Element', ->
  element = null

  beforeEach -> element = Element ' '

  it 'gets element with SwanChar', ->
    e = Element SwanChar ' '
    expect(e.get 'type').to.eq 'WhitespaceElement'

  it 'gets element with javascript char', ->
    e = Element ' '
    expect(e.get 'type').to.eq 'WhitespaceElement'

  describe '#do', ->
    describe 'accepted element', ->
      it 'appends', ->
        m = Element ' '
        element.DO m
        expect(element._body[1]).to.eql m._body[0]

      it 'returns null', ->
        m = Element ' '
        return_value = element.DO m
        expect(return_value).to.eq null

    describe 'not-accepted element', ->
      it 'returns token', ->
        unknown = Element '˨'
        return_value = element.DO unknown
        expect(return_value.get 'type').to.eq 'WhitespaceToken'

  describe '#done', ->
    call = ->
      element.DONE()

    it 'does not throw error', ->
      expect(call).to.not.throw()

    it 'returns token', ->
      expect(call().get 'type').to.eq 'WhitespaceToken'
