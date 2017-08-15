require 'pry'

def acquire_operation
  puts 'Type in the operation you want.(add, subtract, multiply or divide)'

  operation = ''
  loop do
    operation = gets.chomp

    break if ['add', 'subtract', 'multiply', 'divide'].include? operation
    puts 'Must type in add, subtract, multiply, divide'
  end
end

def acquire_input
  binding.pry

  puts 'Type in two numbers you want to calculate. Separated by comma'
  gets.chomp.split(',').map(&:to_f)
end

def calculator
  user_input = acquire_input

  operation = acquire_operation

  result =  case operation
            when 'add'
              user_input[0] + user_input[1]
            when 'subtract'
              user_input[0] - user_input[1]
            when 'multiply'
              user_input[0] * user_input[1]
            when 'divide'
              user_input[0] / user_input[1]
            end

  puts result
end

Kernel.calculator
