GOD = require '../../src/god'

describe.only 'GOD', ->
  it 'has type GOD', ->
    expect(GOD.type).to.not.eq 'GOD'
  it 'spawns worlds', ->
    dict = {type: 'any'}
    world = GOD.spawn dict
    expect(world).to.be.instanceof GOD.modules.world

