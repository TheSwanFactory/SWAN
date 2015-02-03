World = TEST_GOD.modules.World
Inheritable = require '../../src/world/inheritable'

describe 'Inheritable', ->
  world = null
  contents = {}

  beforeEach -> world = new World(contents)

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

    it 'uses GOD.globals object if up is null', ->
      expect(world.UP()).to.eq TEST_GOD.globals

    it 'fails gracefully if property not defined anywhere', ->
      expect(-> world.foo).to.not.throw()
      expect(-> world.get 'foo').to.not.throw()

    describe 'Spawn', ->
      spawn = null
      beforeEach -> spawn = world.spawn {}

      it 'spawns spawn worlds', ->
        expect(spawn).to.not.eq null

      it 'those spawn worlds have itself as up', ->
        expect(spawn.UP()).to.eql world
