SwanNil = require '../../src/worlds/nil'

describe 'SwanNil', ->
  describe 'nil worlds', ->
    nil = null

    beforeEach -> nil = SwanNil()

    it 'is #is_nil', ->
      expect(nil.call 'is_nil').to.eq true

    it 'is not #not_nil', ->
      expect(nil.call 'not_nil').to.eq false

    describe '#do', ->
      it 'accepts anything, returns that thing'

    describe 'conditionals', ->
      describe 'if', ->
        it 'ignores argument'
      describe 'else', ->
        it 'invokes argument with nil'

  describe 'non-nil worlds', ->
    world = null

    beforeEach -> world = new World()

    it 'is not #is_nil', ->
      expect(world.call 'is_nil').to.eq false

    it 'is #not_nil', ->
      expect(world.call 'not_nil').to.eq true

    describe 'conditionals', ->
      describe 'if', ->
        it 'invokes argument with nil'
      describe 'else', ->
        it 'ignores argument'

    describe '#do with nil world', ->
      describe 'closure', ->
        it 'forces evaluation'
      describe 'not closure', ->
        it 'is ignored'

  describe 'nil constant', ->
    it 'exists'
    # world.get('nil')
    it 'is nil'
