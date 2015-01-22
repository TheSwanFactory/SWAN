SwanString = require '../../src/worlds/string'

describe 'SwanString', ->
	it 'is a method that takes a string', ->
    str = 'hello'
    call = -> SwanString str
    expect(call).to.not.throw()
    str = 2
    expect(call).to.throw()

  it 'returns a world'

  it '#each_bodys yields array of SwanChars'

  it '#do causes string concatenation'

  it '#to_js returns Javascript string'

  it '#to_s returns itself'
