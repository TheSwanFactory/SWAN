SwanNil = require '../../src/worlds/nil'

describe 'SwanNil', ->
  nil = null

  beforeEach -> nil = SwanNil()

  it 'is_nil', ->
    expect(nil.call 'is_nil').to.eq true
    expect(nil.call 'not_nil').to.eq false

  describe 'non-nil worlds', ->
    world = null

    beforeEach -> world = new World()

    it 'is not #is_nil', ->
      expect(world.call 'is_nil').to.eq false

    it 'is #not_nil', ->
      expect(world.call 'not_nil').to.eq true

