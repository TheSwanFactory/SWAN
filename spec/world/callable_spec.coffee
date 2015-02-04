World = TEST_GOD.modules.World

describe 'Callable', ->
  world = null
  contents = {}

  beforeEach -> world = new World(contents)

  describe '#send()', ->
    beforeEach -> world.method = sinon.spy()

    describe 'function', ->
      it 'sends', ->
        world.send 'method'
        expect(world.method.called).to.eq true
        expect(world.method.firstCall.args[0]).to.eq world

      it 'sends arguments', ->
        world.send 'method', ['args']
        expect(world.method.called).to.eq true
        expect(world.method.firstCall.args[1]).to.eql ['args']

    describe 'not a function', ->
      it 'throws', -> # return ERROR
        world.notafunction = {}
        expect(-> world.send('notafunction')).to.throw()

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
