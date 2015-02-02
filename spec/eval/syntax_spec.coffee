Syntax   = require '../../src/eval/syntax'
SwanChar = require '../../src/wrap/char'

describe 'syntax', ->
  it.skip 'basic test', ->
    syntax_out = new World
    syntax = Syntax(out: syntax_out)
    string = SwanString('.p ')
    string._each
    syntax.DO(SwanChar '.')
    syntax.DO(SwanChar 'p')
    syntax.DO(SwanChar ' ')
    expect syntax_out.inspect(), [
     {type: 'NameElement', body: '.'}
     {type: 'IdentifierElement', body: 'p'}
     {type: 'WhitespaceElement', body: ' '}
    ]

  syntax = null
  out    = null

  beforeEach ->
    out = new World
    syntax = Syntax(out)

  it 'is a method that returns a world', ->
    expect(syntax).to.be.instanceof World

  it 'up is Syntax', ->
    expect(syntax.UP().type).to.eq 'Syntax'

  it 'takes an out parameter', ->
    expect(syntax.OUT()).to.exist

  it 'passes Elements to out when called with a SwanChar', ->
    [runner, method] = specUtils.runner_world()
    syntax.out = runner
    syntax.DO SwanChar(' ')
    expect(method.calledOnce).to.eq true
    expect(method.args[0][0].get 'type').to.eq 'WhitespaceElement'

  it 'passes UnknownElement if nothing matches', ->
    [runner, method] = specUtils.runner_world()
    syntax.out = runner
    syntax.DO SwanChar('˨')
    expect(method.calledOnce).to.eq true
    expect(method.args[0][0].get 'type').to.eq 'UnknownElement'

  describe 'elements', ->
    it 'passes OpenElement for {'

#   STRUCTURAL - force context changes
#  migth want to make each of these distinct elements rather than key off body
# {[( OpenElement
# }]) CloseElement
# ,; SeperatorElement

# \n\s WhitespaceElement
# \t IllegalElement
# else UnkownElement

#   AGGREGATES
# . NameElement
# a-zA-Z IdentifierElement
# 0-9 NumberElement

# `string with a `quote''
#  `a' `b' # expression that appends
#  `a' 1 # does the same, but stringifies first
# `' anything # to_s
#
# this should be something like a ./syntax_elements folder
