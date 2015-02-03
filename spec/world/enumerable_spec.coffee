World = TEST_GOD.modules.World
Enumerable = require '../../src/world/enumerable'

describe 'Enumerable', ->
  world = null
  contents = {}

  beforeEach -> world = new World(contents)

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
            expect(each.args[0][1]).to.include '_body'

    describe 'fold', ->
      beforeEach ->
        world.update [0,1,2]
        runner = new World
        runner.DO = (world, args) ->

      it 'has fold property which starts with any initial value', ->
        expect(world.fold).to.not.eq undefined

      it 'runs runner'
