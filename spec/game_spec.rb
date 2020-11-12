require '../lib/game.rb'
require '../lib/board.rb'
require '../lib/player.rb'

# trying to figure out how to test this game class and its methods. I don't fucking know what rspec functionalities to use. yet.

describe Game do

  subject(:game) { described_class.new()}

  context '#play' do
    it 'starts the game loop' do
      game = Game.new
      
    end
  end
end