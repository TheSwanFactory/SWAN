Expression = require '../../src/worlds/expression'
Element    = require '../../src/syntax/element'

describe 'expression', ->
  expression = null
  whitespace = Element(' ').call('to_token')
  terminal   = Element(';').call('to_token')

  beforeEach -> expression = Expression()
    
  describe 'WhitespaceExpression', -> # '  '
    it 'evaluates to nil'
    
  describe 'StringExpression', -> # `string'
    it 'creates a SwanString'

  describe 'PropertyExpression', -> # foo
    it 'evaluates to the value in env, if any'
    
  describe 'LabelExpression', -> # .foo
    it 'creates a SwanLabel'
    # when evaluated sets a value, e.g., ".foo 3"
    # ~ do(world,args) -> world[value] = args

  describe 'ClosureExpression', -> # { _ }
    it 'creates a SwanClosure'
    ###
    when evaluated folds its contents
    most of the work is inserting arguments into the hierarchy
    ~ do(world, args) ->
    parent = world.up # insert args in hiearchy
    world.up = args   # use '_' for super
    world.body.DO(world) # evaluate body which is FoldExpression
    ###

  describe 'TupleExpression', -> # [`hi', `there']
    it 'creates a World whose body is the evaluated values'
    # resulting body is a list of elements
    
  describe 'FoldExpression', -> # (`hi' `there')
    it 'folds its evaluated terms into a single value' #inject
    # memo = first
    # then
    ##  memo = memo(next)
    
    
