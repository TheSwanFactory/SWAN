Parser = require '../../src/worlds/parser'
Token  = require '../../src/syntax/token'

describe 'Parser', ->
  parser  = null
  out    = null
  method = null

  beforeEach ->
    unless out?
      [out, method] = specUtils.runner_world()
    parser = Parser(out)

  afterEach ->
    out = null

  it 'returns a world', ->
    expect(Parser()).to.be.instanceof World

  it 'accepts tokens', ->
    expect(-> parser.DO Token()).to.not.throw()
    expect(-> parser.DO '').to.throw()

  it 'appends conforming token, returns null', ->
    return_value = expression.DO whitespace
    expect(return_value).to.eq null
    expect(expression._body[0]).to.eq whitespace

  it 'returns expression for terminal tokens', ->
    return_value = expression.DO terminal
    expect(return_value.get 'type').to.eq 'Expression'

  it 'passes expression when passed terminal token', -> # GROUP, SEP, NEWLINE
    terminal = Token is_terminal: true
    parser.DO terminal
    expect(method.calledOnce).to.eq true
    expect(method.firstCall.args[0].get 'type').to.eq 'Expression'

  it 'passes expression when called with done', ->
    token = Token()
    parser.DO token
    parser.DONE()
    expect(method.calledOnce).to.eq true
    expect(method.firstCall.args[0].get 'type').to.eq 'Expression'

  it 'expression has everything before terminal', ->
    whitespace = Token()
    terminal = Token is_terminal: true
    parser.DO whitespace
    parser.DO terminal
    expect(method.calledOnce).to.eq true
    expression_body = method.firstCall.args[0]._body
    expect(expression_body.length).to.eq 2
    expect(expression_body[0]).to.eql whitespace
    expect(expression_body[1]).to.eql terminal

  describe 'groups', ->
    it 'adds to context when open_context is set', ->
      inner = Expression()
      expression.push inner
      expression.open_context = inner
      expression.DO whitespace
      expect(inner._body[0]).to.eql whitespace
      expect(expression._body[0]).to.eql inner

    it 'adds to initial context when open_context closes', ->
      inner = Expression()
      expression.push inner
      expression.open_context = inner
      expression.DO whitespace
      expression.open_context = null
      expression.DO whitespace
      expect(expression._body.length).to.eq 2
      expect(expression._body[0].get 'type').to.eq 'Expression'
      expect(expression._body[1].get 'type').to.eq 'WhitespaceToken'

    it 'contains sub-expresions for groups', ->
      open = Element('{').call('to_token')
      expression.DO open
      expect(expression._body[0].get 'type').to.eq 'Expression'
      expression.DO whitespace
      expect(expression._body[0]._body[0]).to.eql whitespace
      close = Element('}').call('to_token')
      expression.DO close
      expression.DO whitespace
      expect(expression._body.length).to.eq 2
      expect(expression._body[1]).to.eql whitespace

    it 'throws an error for non-terminated groups', ->
      open = Element('{').call('to_token')
      expression.DO open
      expect(-> expression.DONE()).to.throw()

    it 'throws an error for falsely-terminated groups', ->
      open      = Element('{').call('to_token')
      bad_close = Element(']').call('to_token')
      expression.DO open
      expect(-> expression.DO(bad_close)).to.throw()