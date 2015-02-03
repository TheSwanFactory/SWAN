GOD = require '../src/god'

describe 'swan', ->

  describe 'GOD', ->
    it 'exists in the global namespace', ->
      expect(GOD).to.not.eq null
    it 'has modules property', ->
      expect(GOD.modules).to.not.eq undefined

