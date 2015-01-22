Syntax = require '../../src/worlds/syntax'

describe 'syntax', ->

  it.skip 'basic test', ->
    syntax_out = new World
    syntax = new Syntax(out: syntax_out)
    syntax.do(new Swan.Char '.')
    syntax.do(new Swan.Char 'p')
    expect syntax_out.debug(), [
     {type: 'NameSyntax', body: '.'}
     {type: 'IdentifierSyntax', body: 'p'}
    ]
