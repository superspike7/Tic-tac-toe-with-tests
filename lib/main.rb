class Game
  attr_accessor :board

    def initialize
      @board = Array.new(9, '.') # 9 slot board
    end

  def player_move
    puts "your move, pick between 1 - 9:"
    move = gets.chomp.to_i 
    if move <= 9 && move >= 1 && @board[move - 1] != "X" && @board[move - 1] != "O"
    @board[move - 1] = 'O'
    else
      puts "You move, please pick an empty slot"
      player_move
    end
  end

  def ai_move
    random = Random.new.rand(8)
    if @board[random] != "X" && @board[random] != "O"
    @board[random] = "X"
    puts "ai choosed #{random + 1}"
    else 
      ai_move
    end
  end

  def check_winner
    human_player = 'O'
    ai_player = 'X'

    if pattern?(@board, human_player)
      puts "You win! Congrats!"
      true
    elsif pattern?(@board, ai_player)
      puts "ai wins!, better luck next time :D"
      true
    elsif none_left?(@board)
        puts "it's a tie!"
        true
    end
  end

  def play_game
    until self.check_winner
      self.show_board
      self.player_move
      begin
      self.ai_move
      rescue SystemStackError
        puts "no moves left"
        self.check_winner
        break
        end
      end
      self.show_board
  end

  def show_board(board=@board)
    puts "|#{board[0]}|#{board[1]}|#{board[2]}|\n|#{board[3]}|#{board[4]}|#{board[5]}|\n|#{board[6]}|#{board[7]}|#{board[8]}|\n"

  end

  def pattern?(board, player)

    valid_patterns = [board[0], board[1], board[2]],
                     [board[3], board[4], board[5]],
                     [board[6], board[7], board[8]],
                     [board[0], board[3], board[6]],
                     [board[1], board[4], board[7]],
                     [board[2], board[5], board[8]],
                     [board[0], board[4], board[8]],
                     [board[2], board[4], board[6]]

  valid_patterns.any? { |pattern| pattern.all? { |slot| slot == "#{player}"} }

  end

  def none_left?(board)
    board.none?('.')
  end


end

# new_game = Game.new
# new_game.play_game


# game = Game.new
# game.board[0] = 











