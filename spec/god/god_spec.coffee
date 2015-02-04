describe 'GOD', ->
  it 'has type GOD', ->
    expect(TEST_GOD.type).to.eq 'GOD'
  describe '#spawn()', ->
    it 'spawns worlds', ->
      world = TEST_GOD.spawn({})
      expect(world).to.be.instanceof TEST_GOD.modules.World
      expect(world.get 'type').to.eq 'World'

    it 'sets properties', ->
      world = TEST_GOD.spawn {type: 'any'}
      expect(world.type).to.eq 'any'


