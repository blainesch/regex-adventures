subject = null

describe 'Tile Entity', ->

  beforeEach (done) ->
    subject = Crafty.e('Tile')
    subject.at(1,1)
    done()

  describe '#at', ->
    it 'returns the coordinates', ->
      expect(subject.at()).to.be.equal(x: 1, y: 1, z: 0)
