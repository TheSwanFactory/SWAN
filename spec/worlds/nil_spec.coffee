SwanNil = require '../../src/worlds/nil'

describe 'SwanNil', ->
  nil = null

  beforeEach -> nil = SwanNil()

  it 'is_nil', ->
    expect(nil.call 'is_nil').to.eq true
    expect(nil.call 'not_nil').to.eq false
