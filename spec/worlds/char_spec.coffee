SwanChar = require '../../src/worlds/char'

describe 'SwanChar', ->
  call   = -> SwanChar letter
  letter = original_letter = 'a'
  char   = null

  beforeEach ->
    char = call()

  afterEach ->
    letter = original_letter

  it 'is a method that takes a single character', ->
    expect(call).to.not.throw()
    letter = 2
    expect(call).to.throw()
    letter = 'he'
    expect(call).to.throw()

  it 'returns a world', ->
    expect(char).to.be.instanceof World

  it '#each_body yields itself', ->
    runner = new World
    runner.set 'DO', sinon.spy()
    char.get('each_body')(runner)
    expect(runner.DO.calledOnce).to.eq true
    expect(runner.DO.args[0][0]).to.eq char

  it 'serializes to JSON correctly', ->
    expect(char.toJSON()).to.eq letter

  it '#do causes value concatenation', ->
    char.DO 'b'
    expect(char._value).to.eq letter + 'b'

  it '#to_S returns itself', ->
    expect(char.to_S()).to.be.instanceof World
