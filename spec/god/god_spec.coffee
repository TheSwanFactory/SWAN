describe 'GOD', ->
  it 'has type GOD', ->
    expect(TEST_GOD.type).to.not.eq 'GOD'
  it 'spawns worlds', ->
    dict = {type: 'any'}
    world = TEST_GOD.spawn dict
    expect(world).to.be.instanceof TEST_GOD.modules.world

