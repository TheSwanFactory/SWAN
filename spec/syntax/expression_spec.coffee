Expression = require '../../src/worlds/expression'
Element    = require '../../src/syntax/element'

describe 'expression', ->
  expression = null
  whitespace = Element(' ').call('to_token')
  terminal   = Element(';').call('to_token')

  beforeEach -> expression = Expression()

  it 'appends conforming token, returns null', ->
    return_value = expression.DO whitespace
    expect(return_value).to.eq null
    expect(expression._body[0]).to.eq whitespace

  it 'returns expression for terminal tokens', ->
    return_value = expression.DO terminal
    expect(return_value.get 'type').to.eq 'Expression'

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

  # To do this, I had to extend the syntax when insdie a group
  # e.g., after nesting "(" I added ")" as a valid element

  # which impleis a group forces a new Context, new Expression, and new Syntax
