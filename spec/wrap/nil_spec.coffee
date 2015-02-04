SwanNil = TEST_GOD.modules.wrap.nil
World   = TEST_GOD.modules.World

describe 'SwanNil', ->
  runner = null
  method = null

  describe 'nil worlds', ->
    nil = null


    beforeEach -> nil = SwanNil.spawn()

    it 'up is SwanNil', ->
      expect(nil.UP().type).to.eq 'SwanNil'

    it 'is #is_nil', ->
      expect(nil.send 'is_nil').to.eq true

    it 'is not #not_nil', ->
      expect(nil.send 'not_nil').to.eq false

    describe '#do', ->
      it 'accepts anything, returns that thing', ->
        thing = "thing"
        expect(nil.DO thing).to.eq thing

    ###
    SWAN Specs

    ; ()
    # nil

    ; .t (())
    # true

    ; t ? {42}
    # 42
    ; t : {42}
    # nil

    ; () ? {42}
    # nil
    ; () : {42}
    # 42

    ###

    describe 'conditionals', ->
      beforeEach ->
        [runner, method] = specUtils.runner_world()

      describe 'then', ->
        it 'ignores argument', ->
          nil.send('then', runner)
          expect(method.called).to.eq false

      describe 'else', ->
        it 'invokes argument with nil', ->
          nil.send('else', runner)
          expect(method.called).to.eq true

  describe 'non-nil worlds', ->
    world = null

    beforeEach -> world = new World()

    it 'is not #is_nil', ->
      expect(world.send 'is_nil').to.eq false

    it 'is #not_nil', ->
      expect(world.send 'not_nil').to.eq true

    describe 'conditionals', ->
      beforeEach -> [runner, method] = specUtils.runner_world()

      describe 'then', ->
        it 'invokes argument with nil', ->
          world.send 'then', runner
          expect(method.called).to.eq true
          expect(method.firstCall.args[0]).to.eq world.get('nil')

      describe 'else', ->
        it 'ignores argument', ->
          world.send 'else', runner
          expect(method.called).to.eq false

    describe '#do with nil world', ->
      describe 'closure', ->
        it 'forces evaluation'
      describe 'not closure', ->
        it 'is ignored'

  describe 'nil constant', ->
    it 'exists'
    # world.get('nil')
    it 'is nil'

