#1

puts 'type in word you want to print later'
input = gets.chomp
inputs = []

while input != ''
  inputs.push(input)
  puts 'type in word you want to print later'
  input = gets.chomp
end

puts inputs.sort