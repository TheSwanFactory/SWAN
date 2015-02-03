SwanChar = TEST_GOD.modules.wrap.char
World    = TEST_GOD.modules.World

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
    [runner, method] = specUtils.runner_world()
    char.get('each_body')(runner)
    expect(method.calledOnce).to.eq true
    expect(method.firstCall.args[0]).to.eq char

  it 'serializes to JSON correctly', ->
    expect(char.toJSON()).to.eq letter

  it '#do causes value concatenation', ->
    char.DO 'b'
    expect(char._value).to.eq letter + 'b'

  it '#toS returns itself', ->
    expect(char.toS()).to.be.instanceof World
