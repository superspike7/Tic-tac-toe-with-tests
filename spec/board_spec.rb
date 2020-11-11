require '../lib/board.rb'

describe Board do

  subject(:board) { described_class.new }

  context '#pattern?' do
    it 'detects a horizontal pattern' do
      board.move('O', 1)
      board.move('O', 2)
      board.move('O', 3)

      expect(board.pattern?('O')).to be true
    end

    it 'detects a vertical pattern' do
      board.move('O', 1)
      board.move('O', 4)
      board.move('O', 7)

      expect(board.pattern?('O')).to be true
    end

    it 'detects a diagonal pattern' do
      board.move('O', 1)
      board.move('O', 5)
      board.move('O', 9)

      expect(board.pattern?('O')).to be true
    end
  end

    context '#none?' do
      it 'detects wether the board is completely filled without a valid pattern' do
      board.move('X', 1)
      board.move('X', 2)
      board.move('O', 3)
      board.move('O', 4)
      board.move('X', 5)
      board.move('X', 6)
      board.move('X', 7)
      board.move('O', 8)
      board.move('O', 9)

      expect(board.none?).to be true
      end
    end

end