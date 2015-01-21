# Scoped Worlds Abstraction Notation
#
# In the actual SWAN language there will be syntax
# for many of these things.
# But for now, everything is a property of some World (or GOD)
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

World = require '../src/world'
GOD   = require '../src/god'

describe 'World', ->
  world    = null
  contents = { }

  beforeEach -> world = new World contents

  describe 'properties', ->
    describe '#set()', ->
      it 'sets a property directly on the world', ->
        world.set 'foo', 'bar'
        expect(world.foo).to.eq 'bar'

    describe '#get()', ->
      it 'gets a property directly on the world', ->
        world.foo = 'bar'
        expect(world.get 'foo').to.eq 'bar'

      it 'gets undefined
      for missing properties', ->
        expect(world.get 'bar').to.eq undefined

  describe 'Scope', ->
    it 'has UP method', ->
      expect(world.UP).to.not.eq undefined

    it 'looks up missing properties in parent', ->
      parent = new World
      parent.set 'key', 'value'
      world = new World up: parent
      expect(world.get 'key').to.eq 'value'

    it 'uses GOD object if up is null', ->
      expect(world.UP()).to.eq GOD

    it 'fails gracefully if property not defined anywhere', ->
      expect(-> world.foo).to.not.throw()
      expect(-> world.get 'foo').to.not.throw()

    describe 'Sub', ->
      beforeEach -> world.sub {}

      it 'spawns sub worlds', ->
        expect(world.subs()[0]).to.not.eq null

      it 'those sub worlds have itself as up', ->
        expect(world.subs()[0].UP()).to.eql world

      it 'has subs property', ->
        expect(world.subs).to.not.throw()
        expect(world.subs()).to.eql [world.subs()[0]]

  describe 'Body', ->
    it 'is an array', ->
      expect(world.get 'body').to.eql []

    describe '#push()', ->
      it 'adds to body', ->
        world.push 'word'
        expect(world.get 'body').to.eql ['word']

  describe 'GOD', ->
    it 'has do property', ->
      expect(GOD.get 'do').to.not.eq undefined

    it 'makes do accessible to Worlds', ->
      expect(world.get 'do' ).to.eq GOD.get 'do'

    it 'makes do callable by Worlds', ->
      doer = GOD.get 'do'
      result = doer world, 'Hello'
      expect(world.body()[0]).to.eq 'Hello'

  describe.skip 'Invocation', ->
    it 'has do property', ->
      expect(world.get 'do').to.not.eq undefined

    it 'has DO method', ->
      expect(world.DO).to.not.throw()

    it 'has DONE method', ->
      expect(world.DONE).to.not.throw()

    it 'default do method appends to body', ->
      contents = {key: 'value'}
      world.DO contents
      sub = world.body()[0]
      expect(sub).to.eql {key: 'value'}

  describe.skip 'Enumeration', ->
    runner = null

    describe 'each', ->
    beforeEach ->
      world.sub {key: 'value'}
      world.sub {foo: 'bar'}
      runner = new World
      runner.set 'DO', sinon.spy()

    it 'has each property', ->
      expect(world.each).to.not.eq undefined

    it 'calls do on passed world with each member of subs', ->
      world.each_sub runner
      expect(runner.DO.called).to.eq true
      expect(runner.DO.args[0]).to.eql [world, world.subs()[0]]
      expect(runner.DO.args[1]).to.eql [world, world.subs()[1]]

    it 'calls DO on passed world with each member of subs', ->
      world.push 'hey'
      world.push 'there'
      world.each runner
      expect(runner.DO.called).to.eq true
      expect(runner.DO.args[0]).to.eql [world, world.body()[0]]
      expect(runner.DO.args[1]).to.eql [world, world.body()[1]]

    it 'call done on passed world after all subs', ->
      world.set 'DONE', sinon.spy()
      world.each runner
      expect(world.DONE.calledOnce).to.eq true

    it 'does the same for each_prop', ->
      world.set 'DONE', sinon.spy()
      world.each_prop runner
      expect(world.DONE.calledOnce).to.eq true

    describe 'fold', ->
      beforeEach ->
        world.update [0,1,2]
        runner = new World
        runner.DO = (world, args) ->

      it 'has fold property which starts with any initial value', ->
        expect(world.fold).to.not.eq undefined

      it 'runs runner'
