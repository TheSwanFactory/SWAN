god = require '../../src/god/god'

describe 'GOD', ->

  describe 'global', ->
    it 'exists in the global namespace', ->
      expect(GOD).to.not.eq null
