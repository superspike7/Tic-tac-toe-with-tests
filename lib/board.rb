class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(9, ".")
  end

  def pattern?(player)
    valid_patterns = [@grid[0], @grid[1], @grid[2]],
                     [@grid[3], @grid[4], @grid[5]],
                     [@grid[6], @grid[7], @grid[8]],
                     [@grid[0], @grid[3], @grid[6]],
                     [@grid[1], @grid[4], @grid[7]],
                     [@grid[2], @grid[5], @grid[8]],
                     [@grid[0], @grid[4], @grid[8]],
                     [@grid[2], @grid[4], @grid[6]]

  valid_patterns.any? { |pattern| pattern.all? { |slot| slot == "#{player}"} }
  end

  def none?
    @grid.none?('.')
  end

  def show_board
    puts "[#{@grid[0]}] [#{@grid[1]}] [#{@grid[2]}]\n[#{@grid[3]}] [#{@grid[4]}] [#{@grid[5]}]\n[#{@grid[6]}] [#{@grid[7]}] [#{@grid[8]}] \n"
  end
  
  def valid_move?(pos)
    @grid[pos - 1] == '.'
  end
end
