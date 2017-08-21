require 'pry'

class Move
  MOVES = ['paper', 'scissors', 'rock']
  attr_reader :value
  def initialize(value)
    @value = value
  end

  def paper?
    value == 'paper'
  end

  def rock?
    value == 'rock'
  end

  def scissors?
    value == 'scissors'
  end

  def >(other_object)
    (paper? && other_object.rock?) ||
      (scissors? && other_object.paper?) ||
      other_object.scissors?
  end

  def to_s
    value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "It should not be an empty string."
    end

    self.name = n
  end

  def choose
    puts "Which move do you choose?"
    n = ''
    loop do
      n = gets.chomp
      break if Move::MOVES.include? n
      puts "Must be in #{Move::MOVES.join(', ')}"
    end
    self.move = Move.new(n)
  end
end

class Computer < Player
  def set_name
    self.name = ['Riddle19', 'LittleBear2'].sample
  end

  def choose
    self.move = Move.new(Move::MOVES.sample)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end

  private

  def display_welcome_message
    puts "Hello, welcome to RPS game."
  end

  def display_moves
    puts "#{human.name}'s move is #{human.move}" \
    " #{computer.name}'s move is #{computer.move}"
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
    elsif computer.move > human.move
      puts "#{computer.name} won!"
    else
      puts "It's a tie."
    end
  end

  def display_goodbye_message
    puts "Thanks for playing."
  end

  def play_again?
    puts "Do you want to play again?(y/n)"
    play_again = gets.chomp
    if play_again.start_with? 'y'
      true
    else
      false
    end
  end
end

RPSGame.new.play
