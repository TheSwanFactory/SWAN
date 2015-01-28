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

  it 'passes expression when called with done'

  describe 'expression', ->
    it 'appends conforming token, returns null'
    it 'returns expression for terminal tokens'
    it 'contains all tokens between terminals'
    it 'contains sub-expresions for groups'
    it 'throws an error for non-terminated groups'
    it 'throws an error for falsely-terminated groups'

    # To do this, I had to extend the syntax when insdie a group
    # e.g., after nesting "(" I added ")" as a valid element

    # which impleis a group forces a new Context, new Expression, and new Syntax
