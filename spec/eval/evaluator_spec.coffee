describe 'Evaluator', ->
  it 'returns a world'
  it 'accepts expressions'
  it 'passes value for each expression'
  it 'calculates values for nested expressions'
  it 'passes value when called with done'

  describe 'property', ->
    it 'returns values from env when evaluating a property'
    it 'sets values locally when evaluating a name'

  describe 'closure', ->
    it 'evaluates elements in context of argument'

  describe 'whitespace', ->
    it 'passes nil when evaluated'
