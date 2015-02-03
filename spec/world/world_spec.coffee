# Scoped Worlds Abstraction Notation
#
# In the actual SWAN language there will be syntax
# for many of these things.
# But for now, everything is a property of some World (or TEST_GOD)
# There are no keywords. no built-ins that are always accessible
# You can only access items in your scope
# And if your parent blocks GOD you can't even access that
#
# The reason is THE hard problem of computation is 'effect'
# -> Who gets to change What (and When)
#
# This implies that the truth about anything lives in
# precisely one place in the hierarchy.
# Thus you need robust and flexible mechanism for creating and
# accessing proxies/tunnels with appropiate permissions.

World = TEST_GOD.modules.World

describe 'World', ->
  world    = null
  contents = { }

  beforeEach -> world = new World contents

  describe 'Body', ->
    body = -> world._body

    it 'is an array', ->
      expect(body()).to.eql []

    describe '#push()', ->
      it 'adds to body', ->
        world.push 'word'
        expect(body()).to.eql ['word']

    describe '#length()', ->
      it 'is length of the body', ->
        world.push 'this'
        world.push 'that'
        expect(world.length()).to.eq 2

  describe 'Conversions', ->
    it '#toS converts to SwanString', ->
      string = world.toS()
      expect(string.get 'type').to.eq 'SwanString'

    describe '#toJSON', ->
      it 'has a type', ->
        expect(world.toJSON().type).to.eq 'GOD'

      it 'is a plain JS object', ->
        expect(world.toString()).to.eq '[object Object]'

