Parser     = require '../../src/evaluate/parser'
Token      = require '../../src/evaluate/token'
Element    = require '../../src/syntax/element'
Expression = require '../../src/syntax/expression'

describe 'CRAZY Parser', ->
  parser     = null
  out        = null
  method     = null
  whitespace = null
  terminal   = null

  beforeEach ->
    unless out?
      [out, method] = specUtils.runner_world()
    parser = Parser(out)
    whitespace = Element(' ').call('to_token')
    terminal   = Element(';').call('to_token')

  afterEach ->
    out = null

  it 'returns a world', ->
    expect(Parser()).to.be.instanceof World

  it 'accepts tokens', ->
    expect(-> parser.DO Token()).to.not.throw()
    expect(-> parser.DO '').to.throw()

  it 'appends conforming token, keeps expression open', ->
    parser.DO whitespace
    expect(parser.expression).to.exist

    #expect(return_value).to.eq null
    #expect(parser._body[0]).to.eq whitespace

  it 'passes expression when passed terminal token', -> # GROUP, SEP, NEWLINE
    parser.DO terminal
    expect(method.calledOnce).to.eq true
    expect(method.firstCall.args[0].get 'type').to.eq 'Expression'

  it 'passes parser when called with done', ->
    parser.DO Token()
    parser.DONE()
    expect(method.calledOnce).to.eq true
    expect(method.firstCall.args[0].get 'type').to.eq 'Expression'

  it 'parser has everything before terminal', ->
    whitespace = Token()
    terminal = Token is_terminal: true
    parser.DO whitespace
    parser.DO terminal
    expect(method.calledOnce).to.eq true
    parser_body = method.firstCall.args[0]._body
    expect(parser_body.length).to.eq 2
    expect(parser_body[0]).to.eql whitespace
    expect(parser_body[1]).to.eql terminal

  describe 'groups', ->
    outer = null

    beforeEach -> outer = parser.call('create_expression')
    it 'adds to context when open_context is set', ->
      inner = Expression()
      outer.push inner
      outer.open_context = inner
      parser.DO whitespace
      expect(inner._body[0]).to.eql whitespace
      expect(outer._body[0]).to.eql inner

    it 'adds to initial context when open_context closes', ->
      inner = Expression()
      outer.push inner
      outer.open_context = inner
      parser.DO whitespace
      outer.open_context = null
      parser.DO whitespace
      expect(outer._body.length).to.eq 2
      expect(outer._body[0].get 'type').to.eq 'Expression'
      expect(outer._body[1].get 'type').to.eq 'WhitespaceToken'

    it 'contains sub-expresions for groups', ->
      open = Element('{').call('to_token')
      parser.DO open
      expect(outer._body[0].get 'type').to.eq 'Expression'
      parser.DO whitespace
      expect(outer._body[0]._body[0]).to.eql whitespace
      close = Element('}').call('to_token')
      parser.DO close
      parser.DO whitespace
      expect(outer._body.length).to.eq 2
      expect(outer._body[1]).to.eql whitespace

    it 'throws an error for non-terminated groups', ->
      open = Element('{').call('to_token')
      parser.DO open
      expect(-> parser.DONE()).to.throw()

    it 'throws an error for falsely-terminated groups', ->
      open      = Element('{').call('to_token')
      bad_close = Element(']').call('to_token')
      parser.DO open
      expect(-> parser.DO(bad_close)).to.throw()
