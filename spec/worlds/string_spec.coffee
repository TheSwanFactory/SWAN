SwanString = require '../../src/worlds/string'

describe 'SwanString', ->
  call   = -> SwanString str
  body   = -> string._body
  str    = original_str = 'abc'
  string = null

  beforeEach ->
    string = call()

  afterEach ->
    str = original_str

  it 'is a method that takes a string', ->
    str = 'hello'
    call = -> SwanString str
    expect(call).to.not.throw()
    str = 2
    expect(call).to.throw()

  it 'returns a world', ->
    expect(string).to.be.instanceof World

  it '#each_body yields array of SwanChars', ->
    [runner, method] = utils.runner_world()
    string.each_body runner
    expect(method.calledThrice).to.eq true
    expect(method.args[0][0].get 'type').to.eq 'SwanChar'

  describe '#do', ->
    describe 'Javascript string', ->
      it 'concatenates body', ->
        concat = 'abc'
        string.DO concat
        body().forEach (char, index) ->
          expect(char).to.be.instanceof World
          expect(char.get 'type').to.eq 'SwanChar'
          expect(char.toJSON()).to.eq (str + concat)[index]


    describe 'SwanString', ->
      it 'concatenates body', ->
        new_characters = 'abc'
        concat = SwanString new_characters
        string.DO concat
        body().forEach (char, index) ->
          expect(char).to.be.instanceof World
          expect(char.get 'type').to.eq 'SwanChar'
          expect(char.toJSON()).to.eq (str + new_characters)[index]


  it '#toJSON returns Javascript string', ->
    expect(string.toJSON()).to.eq str

  it '#toS returns itself', ->
    expect(string.toS()).to.eql string
