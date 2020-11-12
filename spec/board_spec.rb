require '../lib/board.rb'

describe Board do

  subject(:board) { described_class.new }

  describe '#move' do
    context 'moves player to position if it is a valid position' do
      player = 'O'
      it 'moves to position 1' do
        position = 1
        expect {board.move(player, 1) }.to change { board.grid[position - 1] }.to eq player
      end
    end
  end

  context '#pattern?' do
    xit 'detects a horizontal pattern' do
      board.move('O', 1)
      board.move('O', 2)
      board.move('O', 3)

      expect(board.pattern?('O')).to be true
    end

    xit 'detects a vertical pattern' do
      board.move('O', 1)
      board.move('O', 4)
      board.move('O', 7)

      expect(board.pattern?('O')).to be true
    end

    xit 'detects a diagonal pattern' do
      board.move('O', 1)
      board.move('O', 5)
      board.move('O', 9)

      expect(board.pattern?('O')).to be true
    end
  end

    context '#none?' do  
    xit 'detects wether the board is completely filled without a valid pattern' do
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