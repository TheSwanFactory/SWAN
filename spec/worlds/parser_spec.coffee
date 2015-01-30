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
