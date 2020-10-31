require './lib/board.rb'

describe Board do
  context 'initialize' do
    it 'creates a board with 9 cells inside an array' do
      board = Board.new

      expect(board.cells).to be eq([".", ".", ".", ".", ".", ".", ".", ".", "."])
    end
  end
end