require 'pry'

WINNING_CONDITION = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9],
    [1, 4, 7], [2, 5, 8], [3, 6, 9],
    [1, 5, 9], [3, 5, 7]
  ]

def display_board(brd)
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each do |num|
    new_board[num] = ' '
  end
  new_board
end

def empty_places(brd)
  brd.select { |_, mark| mark == ' ' }.keys
end

def promp(msg)
  puts "=> #{msg}."
end

def joiner(brd, delimiter = ', ', ending = 'or')
  available_places = empty_places(brd)
  "#{available_places[0..-2].join(delimiter)}#{delimiter}#{ending} #{available_places[-1]}"
end

def player_make_choice(brd)
  promp("Choose a position to place a piece: #{joiner(brd)}")
  choice = ''
  loop do
    choice = gets.chomp.to_i
    break if empty_places(brd).include? choice
    promp('It\'not a empty place, please type in a valid one')
  end

  brd[choice] = 'X'
end

def computer_make_choice(brd)
  conditions = WINNING_CONDITION.select do |condition|
    condition.count('X') == 2 && condition.count(' ') == 1
  end

  if conditions[0].nil?
    choice = empty_places(brd).sample
  else
    choice = conditions[0].find { |num| brd[num] == ' '}
  end

  brd[choice] = 'O'
end

def won?(marker, brd)
  WINNING_CONDITION.any? do |condition|
    condition.all? { |place| brd[place] == marker }
  end
end

def winner(brd)
  if won?('X', brd)
    :player
  elsif won?('O', brd)
    :computer
  end
end

def display_result(player_score, computer_score)
  if player_score == 5
    puts "Congrat! The winner is you!"
  elsif computer_score == 5
    puts "Opps, computer defeated you!"
  else
    puts "Player score: #{player_score}; computer score: #{computer_score}"
  end
end

player_score = 0
computer_score = 0

loop do
  board = initialize_board
  display_board(board)

  loop do
    player_make_choice(board)
    computer_make_choice(board)

    display_board(board)
    winner = winner(board)

    if winner == :player
      player_score += 1
    elsif winner == :computer
      computer_score += 1
    end

    break if winner || empty_places(board).empty?
  end

  display_result(player_score, computer_score)
  promp("Do you want to play again? (Y/N)")
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

promp("Thanks for playing.")