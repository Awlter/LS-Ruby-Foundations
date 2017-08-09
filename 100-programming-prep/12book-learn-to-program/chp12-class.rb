# # Dice cheat method

# class Die
#   def initialize
#     roll
#   end

#   def roll
#     @number_showing = 1 + rand(6)
#   end

#   def showing
#     @number_showing
#   end

#   def cheat
#     puts "Which side do you want?"
#     num = 0

#     loop do
#       num = gets.chomp.to_i
#       break if num < 7 && num > 0
#       puts "The side must not outnumber 6"
#     end

#     @number_showing = num
#   end
# end

# die = Die.new
# puts die.showing
# die.cheat
# puts die.showing

# # Orange tree

class OrangeTree
  def height
    puts @height
  end

  def one_year_passes
    @ages += 1
    @height += 10

    if @ages > 10
      puts "This orange tree died"
      exit
    end
  end
end