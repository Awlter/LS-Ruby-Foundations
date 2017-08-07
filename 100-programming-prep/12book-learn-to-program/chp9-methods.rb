# # 1
# def ask question
#   while true
#     puts question
#     reply = gets.chomp.downcase

#     if (reply == 'yes' || reply == 'no')
#       return true if reply == 'yes'
#       return false if reply == 'false'
#     else
#       puts 'Please answer "yes" or "no".'
#     end
#   end
# end

# 2

# - input a number less than 3000

# I =1 V=5 X=10 L=50 C=100 D=500 M=1000

# puts "Type in an integer you want to convert to Roman Numbers"
# input_integer = gets.chomp.to_i

# def integer_to_roman int
#   converted_num_arr = []
#   while true
#     if int / 1000 > 0
#       converted_num_arr << 'M' * (int / 1000)
#       int = int % 1000
#     elsif int / 500 > 0
#       converted_num_arr << 'D' * (int / 500)
#       int = int % 500
#     elsif int / 100 > 0
#       converted_num_arr << 'C' * (int / 100)
#       int = int % 100
#     elsif int / 50 > 0
#       converted_num_arr << 'L' * (int / 50)
#       int = int % 50
#     elsif int / 10 > 0
#       converted_num_arr << 'X' * (int / 10)
#       int = int % 10
#     elsif int / 5 > 0
#       converted_num_arr << 'V' * (int / 5)
#       int = int % 5
#     else
#       converted_num_arr << 'I' * int
#       break
#     end
#   end

#   converted_num_arr.join
# end

# puts integer_to_roman input_integer


### posible sulution

# def old_roman_numeral num
#   raise 'Must use positive integer' if num <= 0

#   roman = ''

#   roman << 'M' * (num / 1000)
#   roman << 'D' * (num % 1000 / 500)
#   roman << 'C' * (num % 500 / 100)
#   roman << 'L' * (num % 100 / 50)
#   roman << 'X' * (num % 50 / 10)
#   roman << 'V' * (num % 10 / 5)
#   roman << 'I' * (num % 5)

#   roman
# end

# puts 'Type in a number that you want to convert to roman numerals'
# integer = gets.chomp.to_i
# puts old_roman_numeral integer

## New Roman Numerals

# M = 1000  D = 500  C = 100  L = 50  X = 10  V = 5  I = 1

# C X I will be only three numbers to be subtracted from every number except I

# 900 = CM, 400 = CD, 90 = XC, 40 = XL, 9 = IX, 4 = IV

# The "smaller" number can just be used once, say 800 is DCCC not CCM

def new_roman_numeral num
  roman = ''

  roman << 'M' * (num / 1000)

  digit_hundred = num % 1000 / 100
  if digit_hundred >= 5
    if digit_hundred == 9
      roman << 'CM'
    else
      roman << 'D'
      roman << 'C' * (digit_hundred % 5)
    end
  else
    if digit_hundred == 4
      roman << 'CD'
    else
      roman << 'C' * digit_hundred
    end
  end

  digit_ten = num % 100 / 10
  if digit_ten >= 5
    if digit_ten == 9
      roman << 'XC'
    else
      roman << 'L'
      roman << 'X' * (digit_ten % 5)
    end
  else
    if digit_ten == 4
      roman << 'XL'
    else
      roman << 'X' * digit_ten
    end
  end

  digit_one = num % 10
  if digit_one >= 5
    if digit_one == 9
      roman << 'IX'
    else
      roman << 'V'
      roman << 'I' * (digit_one % 5)
    end
  else
    if digit_one == 4
      roman << 'IV'
    else
      roman << 'I' * digit_one
    end
  end

  roman
end

num = gets.chomp.to_i
puts new_roman_numeral num