# # 1

# count = 1

# while count < 10
#   puts 'hehe'

#   count += 1
# end


# # 2

# while true
#   puts 'What do you want to say to your grandma?'
#   what_you_say = gets.chomp

#   break if what_you_say.upcase == 'BYE'

#   if what_you_say == what_you_say.upcase
#     random_year = 1930 + rand(20)

#     puts "NOT SINCE #{random_year}"
#   else
#     puts "HUH?! SPEAK UP, SONNY!"
#   end
# end

# # 3
# bye_times = 1

# while true
#   puts 'What do you want to say to your grandma?'
#   what_you_say = gets.chomp

#   if what_you_say.upcase == 'BYE'
#     if bye_times == 3
#       break
#     end

#     bye_times += 1
#     next
#   end

#   bye_times = 1

#   if what_you_say == what_you_say.upcase
#     random_year = 1930 + rand(20)

#     puts "NOT SINCE #{random_year}"
#   else
#     puts "HUH?! SPEAK UP, SONNY!"
#   end
# end

# # 4
# puts "This program can pull all leap years from the starting year and ending year"
# puts "Type in a starting year"
# start_year = gets.chomp.to_i
# puts "Type in a ending year"
# end_year = gets.chomp.to_i

# year = start_year % 4 == 0 ? start_year : (start_year + 4 - start_year % 4)

# while year < end_year
#   if year % 400 == 0
#     puts year
#   elsif year % 100 == 0
#     next
#   elsif year % 4 == 0
#     puts year
#   end

#   year += 4
# end



