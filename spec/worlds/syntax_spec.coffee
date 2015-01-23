Syntax   = require '../../src/worlds/syntax'
SwanChar = require '../../src/worlds/char'

describe.only 'syntax', ->
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

  beforeEach -> syntax = new Syntax(out)

  it 'is a method that returns a world'
    # the world's up is Syntax

  it 'takes an out parameter'

  it 'passes Elements to out when called with a SwanChar'
   # lookup Element for that char based on regexp match
   # @out.DO result
  
  it 'passes UnknownElement if nothing matches'
  
  describe 'elements', ->
      
    it 'passes OpenElement for {'

#   STRUCTURAL - force context changes
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
#
# this should be something like a ./syntax_elements folder

  
