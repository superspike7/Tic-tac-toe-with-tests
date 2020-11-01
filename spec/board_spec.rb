require '../lib/board.rb'

describe Board do
  context 'initialize' do
    it 'creates a board with 9 grid inside an array' do
      board = Board.new

      expect(board.grid).to eq([
        ".", ".", ".",
        ".", ".", ".",
        ".", ".", "."])
    end
  end

  context '#move' do
    it 'puts a piece to a position' do
      board = Board.new
      board.move('O', 1)

      expect(board.grid).to eq([
        "O", ".", ".",
        ".", ".", ".",
        ".", ".", "."])
    end

    it 'detects an existing move' do
      board = Board.new
      board.move('O', 1)
      
      expect(board.move('O', 1)).to be false
    end

    it 'does not allow moves outside the grid' do
      board = Board.new
      
      expect(board.move('O', 10)).to be false
    end
  end

  context '#pattern?' do
    it 'detects a horizontal pattern' do
      board = Board.new
      board.move('O', 1)
      board.move('O', 2)
      board.move('O', 3)

      expect(board.pattern?('O')).to be true
    end

    it 'detects a vertical pattern' do
      board = Board.new
      board.move('O', 1)
      board.move('O', 4)
      board.move('O', 7)

      expect(board.pattern?('O')).to be true
    end

    it 'detects a diagonal pattern' do
      board = Board.new
      board.move('O', 1)
      board.move('O', 5)
      board.move('O', 9)

      expect(board.pattern?('O')).to be true
    end
  end

    context '#none?' do
      it 'detects wether the board is completely filled without a valid pattern' do
      board = Board.new
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