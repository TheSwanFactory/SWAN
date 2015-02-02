Lexer   = require '../../src/eval/lexer'
Element = require '../../src/syntax/element'

describe 'Lexer', ->
  lexer  = null
  out    = null
  method = null

  beforeEach ->
    unless out?
      [out, method] = specUtils.runner_world()
    lexer = Lexer(out)

  afterEach ->
    out = null

  it 'returns a world', ->
    expect(lexer).to.be.instanceof World

  it 'accepts element', ->
    world = new World
    expect(-> lexer.DO '').to.throw()
    expect(-> lexer.DO(world)).to.not.throw()

  it 'passes token when passed non-accepted element', ->
    space = Element ' '
    char  = Element 'a'

    lexer.DO space
    lexer.DO char

    expect(method.calledOnce).to.eq true
    expect(method.firstCall.args[0].get 'type').to.eq 'WhitespaceToken'

  it 'appends to element when passed accepted element', ->
    space = Element ' '

    lexer.DO space
    sinon.spy lexer._value, 'DO'
    lexer.DO space

    expect(method.called).to.eq false
    expect(lexer._value.DO.called).to.eq true

  describe '#done()', ->
    describe 'with something', ->
      it 'passes pending token', ->
        space = Element ' '
        lexer.DO space
        lexer.DONE()
        expect(method.calledOnce).to.eq true
        expect(method.firstCall.args[0].get 'type').to.eq 'WhitespaceToken'

    describe 'empty', ->
      it 'passes nothing', ->
        lexer.DONE()
        expect(method.called).to.eq false
