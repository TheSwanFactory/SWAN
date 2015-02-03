World = TEST_GOD.modules.World

describe 'Printable', ->
  world = null
  contents = {type: 'Printer'}

  beforeEach -> world = new World(contents)

  describe 'Conversions', ->
    it.skip '#toS converts to SwanString', ->
      string = world.toS()
      expect(string.get 'type').to.eq 'SwanString'

    describe '#toJSON', ->
      it 'has a type', ->
        json = world.toJSON()
        expect(json).to.eql {body: [], type: 'Printer'}

      it 'is a plain JS object', ->
        expect(world.toString()).to.eq '[object Object]'
