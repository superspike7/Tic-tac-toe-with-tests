class Player

  attr_accessor :board

  def initialize(mark)
    @board = Board.new
    @mark = mark
  end

  def move(pos)
    @board.grid[pos - 1] = @mark
  end

end
