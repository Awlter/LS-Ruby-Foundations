# my original version of data structure

# boards = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]

# puts ""
# puts "   |   |   "
# puts " #{boards[0][0]} | #{boards[0][1]} | #{boards[0][2]} "
# puts "   |   |   "
# puts "-----------"
# puts "   |   |   "
# puts " #{boards[1][0]} | #{boards[1][1]} | #{boards[1][2]} "
# puts "   |   |   "
# puts "-----------"
# puts "   |   |   "
# puts " #{boards[2][0]} | #{boards[2][1]} | #{boards[2][2]} "
# puts "   |   |   "
# puts ""

# 1. Display the initial empty 3x3 board.
# 2. Ask the user to mark a square.
# 3. Computer marks a square.
# 4. Display the updated board state.
# 5. If winner, display winner.
# 6. If board is full, display tie.
# 7. If neither winner nor board is full, go to #2
# 8. Play again?
# 9. If yes, go to #1
# 10. Good bye!

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

def promp(msg)

end

board = initialize_board
display_board(board)

