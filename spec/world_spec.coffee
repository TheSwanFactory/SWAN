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

      it 'gets undefined for missing properties', ->
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
      sub = null
      beforeEach -> sub = world.sub {}

      it 'spawns sub worlds', ->
        expect(sub).to.not.eq null

      it 'those sub worlds have itself as up', ->
        expect(sub.UP()).to.eql world

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

  describe 'GOD', ->
    it 'has do property', ->
      expect(GOD.get 'do').to.not.eq undefined

    it 'makes do accessible to Worlds', ->
      expect(world.get 'do' ).to.eq GOD.get 'do'

    it 'makes do callable by Worlds', ->
      doer = GOD.get 'do'
      result = doer world, 'Hello'
      expect(world._body[0]).to.eq 'Hello'

  describe 'Invocation', ->
    it 'has do property', ->
      expect(world.get 'do').to.not.eq undefined

    it 'has DO method', ->
      expect(-> world.DO()).to.not.throw()

    it 'has DONE method', ->
      expect(-> world.DONE()).to.not.throw()

    it 'default do method appends to body', ->
      contents = {key: 'value'}
      world.DO contents
      sub = world._body[0]
      expect(sub).to.eql {key: 'value'}

  describe 'Enumeration', ->
    runner = null

    describe '#_each()', ->
      beforeEach ->
        runner = new World
        runner.set 'DO', sinon.spy()

      it 'has _each method', ->
        expect(world).to.respondTo '_each'

      it 'calls #DO on passed world with each member of collection', ->
        world._each runner, [1,2,3]
        expect(runner.DO.calledThrice).to.eq true
        expect(runner.DO.args[0]).to.eql [1]
        expect(runner.DO.args[1]).to.eql [2]
        expect(runner.DO.args[2]).to.eql [3]

      it 'call #DONE after iterating through collection', ->
        world.set 'DONE', sinon.spy()
        world._each runner, [1]
        expect(world.DONE.calledOnce).to.eq true

      describe 'public methods', ->
        each = null

        beforeEach -> each = world._each = sinon.spy()

        describe '#each_body', ->
          it 'calls #_each with the body collection', ->
            world.push 1
            world.each_body runner
            expect(each.calledOnce).to.eq true
            expect(each.args[0]).to.eql [runner, [1]]

        describe '#each_prop', ->
          it 'calls #_each with the prop collection', ->
            world.each_prop runner
            expect(each.calledOnce).to.eq true
            expect(each.args[0][0]).to.eq runner
            expect(each.args[0][1]).to.include 'each_prop'

    describe 'fold', ->
      beforeEach ->
        world.update [0,1,2]
        runner = new World
        runner.DO = (world, args) ->

      it 'has fold property which starts with any initial value', ->
        expect(world.fold).to.not.eq undefined

      it 'runs runner'
