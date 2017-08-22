require 'pry'

class Board
  WINNING_LINES = [[1,2,3], [4,5,6], [7,8,9]] +
                  [[1,4,7], [2,5,8], [3,6,9]] +
                  [[1,5,9], [3,5,7]]

  def initialize
    @squares = {}
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def get_square_at(key)
    @squares[key]
  end

  def set_square_at(key, marker)
    @squares[key] = marker
  end

  def empty_square_keys
    @squares.select { |_, v| v.empty? }.keys
  end

  def someone_won?
    !!detect_winner
  end

  def won?(line, marker)
    line.all? { |key| @squares[key] == marker }
  end

  def detect_winner
    WINNING_LINES.each do |line|
      if won?(line, TTTGame::HUMAN_MARKER)
        return TTTGame::HUMAN_MARKER
      elsif won?(line, TTTGame::COMPUTER_MARKER)
        return  TTTGame::COMPUTER_MARKER
      end
    end
    nil
  end

  def full?
    empty_square_keys.empty?
  end
end

class Square
  INITIAL_MARKER = ' '

  def initialize
    @mark = INITIAL_MARKER
  end

  def empty?
    @mark == INITIAL_MARKER
  end

  def to_s
    @mark
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def mark

  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe"
    puts ""
  end

  def display_goodbye_message
    puts "Good bye"
  end

  def display_board
    system 'clear'
    puts ''
    puts "     |     |"
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}"
    puts "     |     |"
  end

  def human_moves
    puts "Choose a empty key from #{board.empty_square_keys.join(', ')}"

    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.empty_square_keys.include? square
      puts "Invalid choice."
    end
    board.set_square_at(square, human.marker)
  end

  def computer_moves
    square = board.empty_square_keys.sample
    board.set_square_at(square, computer.marker)
  end

  def display_result
    result = board.detect_winner
    if result == HUMAN_MARKER
      puts 'You won!'
    elsif result == COMPUTER_MARKER
      puts 'Computer won!'
    else
      puts "It's a tie."
    end
  end

  def play_again?
    puts 'Want to play again?'
    play_again = gets.chomp.downcase
    play_again.start_with? 'y'
  end

  def play
    display_welcome_message
    loop do
      display_board
      loop do
        human_moves
        computer_moves
        display_board
        break if board.someone_won? || board.full?
      end
      display_result
      break unless play_again?
      @board = Board.new
    end
    display_goodbye_message
  end
end

game = TTTGame.new
game.play