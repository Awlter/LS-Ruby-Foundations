class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                  [[1, 5, 9], [3, 5, 7]]

  def initialize
    @squares = {}
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def empty_square_keys
    @squares.select { |_, v| v.empty? }.keys
  end

  def someone_won?
    !!winner_marker
  end

  def winner_marker
    WINNING_LINES.each do |line|
      marker = @squares[line[0]].to_s
      return marker if won?(line, marker)
    end
    nil
  end

  def full?
    empty_square_keys.empty?
  end

  private

  def won?(line, marker)
    line.all? do |key|
      square = @squares[key]
      square.marked? && square.marked_by(marker)
    end
  end
end

class Square
  INITIAL_MARKER = ' '
  attr_writer :marker

  def initialize
    @marker = INITIAL_MARKER
  end

  def empty?
    @marker == INITIAL_MARKER
  end

  def marked?
    !empty?
  end

  def marked_by(marker)
    @marker == marker
  end

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
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

  def play
    display_welcome_message
    loop do
      clear_screen_and_display_board
      loop do
        human_moves
        computer_moves
        clear_screen_and_display_board
        break if board.someone_won? || board.full?
      end
      display_result
      break unless play_again?
      @board = Board.new
    end
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Welcome to Tic Tac Toe"
    puts ""
  end

  def display_goodbye_message
    puts "Good bye"
  end

  def clear
    system 'clear'
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_board
    puts "You are a #{human.marker}. Computer is a #{computer.marker}."
    puts ''
    board.draw
    puts ''
  end

  def human_moves
    puts "Choose a empty key from #{board.empty_square_keys.join(', ')}"

    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.empty_square_keys.include? square
      puts "Invalid choice."
    end
    board[square] = human.marker
  end

  def computer_moves
    square = board.empty_square_keys.sample
    board[square] = computer.marker
  end

  def display_result
    result = board.winner_marker
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
end

game = TTTGame.new
game.play
