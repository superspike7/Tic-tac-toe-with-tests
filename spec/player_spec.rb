require '../lib/player.rb'
require '../lib/board.rb'

describe Player do

  subject(:player) { described_class.new('O')}
  let(:board) {Board.new}

  describe '#move' do
    context 'moves player to a position when move is valid' do
      it 'moves to position 1' do
        position = 1
        expect { player.move(position) }.to change { player.board.grid[position - 1] }.to eq('O')
      end
    end    
  end

end