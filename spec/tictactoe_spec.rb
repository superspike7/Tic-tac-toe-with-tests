require './lib/main.rb'

describe Game do
  context '#pattern?' do
    it 'detects the horizontal pattern' do
      game = Game.new
      game.board[0] = 'O'
      game.board[1] = 'O'
      game.board[2] = 'O'

      expect(game.pattern?(game.board, 'O')).to be true
    end
  end
end