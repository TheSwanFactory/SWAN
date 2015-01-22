SwanChar = require '../../src/worlds/char'

describe 'SwanChar', ->
  char   = null
  letter = 'a'

  beforeEach -> char = SwanChar letter

  it 'is a method that returns a world', ->
    expect(char).to.be.instanceof World

  it '#UP is the canonical SwanChar', ->


  # beforeEach -> world = new World(contents)

  # it 'is a world', ->
  #   expect(world).to.be.an.instanceof World

  # describe 'constructor', ->
  #   before -> contents = 'a'

  #   it 'contents sets body to a char', ->
  #     expect(world.body()).to.eq 'a'

  #   describe 'many chars', ->
  #     before -> contents = 'ba'

  #     it 'sets body to first char', ->
  #       expect(world.body()).to.eq 'b'

