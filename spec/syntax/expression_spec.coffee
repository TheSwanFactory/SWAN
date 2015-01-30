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
