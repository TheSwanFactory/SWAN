Expression = require '../../src/worlds/expression'
Element    = require '../../src/syntax/element'

describe.only 'expression', ->
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

  it 'contains all tokens between terminals'
  it 'contains sub-expresions for groups'
  it 'throws an error for non-terminated groups'
  it 'throws an error for falsely-terminated groups'

  # To do this, I had to extend the syntax when insdie a group
  # e.g., after nesting "(" I added ")" as a valid element

  # which impleis a group forces a new Context, new Expression, and new Syntax
