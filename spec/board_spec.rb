require '../lib/board.rb'

describe Board do

  subject(:board) { described_class.new }

  context '#move' do

    it 'puts a piece to position 1' do
      player_one = 'O'
      position = 1
      grid = board.instance_variable_get(:@grid)
      expect {board.move(player_one, position)}.to change { grid[position - 1] }.to eq player_one
    end

    it "does not allow to move on a same position with twice" do
      board.move('O', 1)
      expect(board.move('O', 1)).to be false
    end

    it 'does not allow moves outside the grid' do
      expect(board.move('O', 10)).to be false
    end
  end

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