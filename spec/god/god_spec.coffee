god = require '../../src/god/god'

describe.only 'GOD', ->

  describe 'global', ->
    it 'exists in the global namespace', ->
      expect(GOD).to.not.eq null
