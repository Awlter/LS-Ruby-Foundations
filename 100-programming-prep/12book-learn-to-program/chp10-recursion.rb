require 'pry'

# # Self-made sort

# arr = ['vjbk','njklv','qrb','oihuvsd','zxio','ljkrw']
# sorted_arr = []

# def sort arr, sorted_arr
#   return if arr.empty?

#   smallest = arr.min
#   sorted_arr.push(arr.delete(smallest))
#   sort arr, sorted_arr
# end

# sort arr, sorted_arr
# puts sorted_arr

# # sort with wrapper version

# def sort arr
#   recursive_sort arr, []
# end

# def find_smallest arr
#   smallest = arr[0]

#   arr.each do |string|
#     smallest = string if string < smallest
#   end

#   smallest
# end

# def recursive_sort arr, sorted_arr
#   return sorted_arr if arr.empty?

#   smallest = find_smallest arr
#   sorted_arr.push(arr.delete(smallest))
#   recursive_sort arr, sorted_arr
# end

# puts sort arr



# # Self-made shuffle
# arr = ['abc', 'acd', 'bbc', 'bdq', 'lsd', 'lwq', 'twe', 'top']

# def shuffle arr

# end



# # Self-made dictionary_sort
# def dictionary_sort arr
#   return arr if arr.length <= 1

#   middle = arr.pop
  # less = arr.select {|item| item.downcase < middle.downcase}
#   more = arr.select {|item| item.downcase > middle.downcase}

#   dictionary_sort(less) + [middle] + dictionary_sort(more)
# end

# words = ['can','feel','singing.','like','D','can']
# puts(dictionary_sort(words).join(' '))



# # Convert digits to English number

# def english_number num
#   return 'Must be positive number' if num < 0
#   return 'zero' if num == 0

#   ones_place = ['one',       'two',      'three',
#                 'four',      'five',     'six',
#                 'seven',     'eight',    'nine']

#   tens_place = ['ten',       'twenty',   'thirty',
#                 'forty',     'fifty',    'sixty',
#                 'seventy',   'eighty',   'ninety']

#   teenagers  = ['eleven',    'twelve',   'thirteen',
#                 'fourteen',  'fifteen',  'sixteen',
#                 'seventeen', 'eighteen', 'nineteen']

#   num_string = ''

#   left  = num

#   write = left / 1000
#   left  = left % 1000

#   if write > 0
#     thousands = english_number write
#     num_string = num_string + thousands + ' thousand'

#     if left > 0
#       num_string = num_string + ' '
#     end
#   end

#   write = left / 100
#   left  = num % 100

#   if write > 0
#     hundreds = english_number write
#     num_string = num_string + hundreds + ' hundred'

#     if left > 0
#       num_string = num_string + ' '
#     end
#   end

#   write = left / 10
#   left = left % 10

#   if write > 0
#     if write == 1 && left > 0
#       num_string = num_string + teenagers[left - 1]
#       left = 0
#     else
#       num_string = num_string + tens_place[write - 1]
#     end

#     if left > 0
#       num_string = num_string + '-'
#     end
#   end

#   write = left
#   left = 0

#   if write > 0
#     num_string = num_string + ones_place[write - 1]
#   end

#   num_string
# end

# puts english_number( 0)
# puts english_number( 9)
# puts english_number( 10)
# puts english_number( 11)
# puts english_number( 17)
# puts english_number( 32)
# puts english_number( 88)
# puts english_number( 100)
# puts english_number( 100000)

# # 99 bottles of beer

# def the_9_beer_bottles_song
#   count = 9
#   while count > 2
#     p "#{count} bottles of beer on the wall, #{count} bottles of beer. Take one down and pass it around, #{count - 1} bottles of beer on the wall."
#     count -= 1
#   end

#   p "2 bottles of beer on the wall, 2 bottles of beer. Take one down and pass it around, 1 bottle of beer on the wall."
#   p "1 bottle of beer on the wall, 1 bottle of beer. Take one down and pass it around, no more bottles of beer on the wall."
#   p "No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, 99 bottles of beer on the wall."

# end

# the_9_beer_bottles_song

# # recursive

def the_9_beer_bottles_song_recursive count
  if count > 2
    p "#{count} bottles of beer on the wall, #{count} bottles of beer. Take one down and pass it around, #{count - 1} bottles of beer on the wall."
    the_9_beer_bottles_song_recursive count - 1
    return
  end

  p "2 bottles of beer on the wall, 2 bottles of beer. Take one down and pass it around, 1 bottle of beer on the wall."
  p "1 bottle of beer on the wall, 1 bottle of beer. Take one down and pass it around, no more bottles of beer on the wall."
  p "No more bottles of beer on the wall, no more bottles of beer. Go to the store and buy some more, 99 bottles of beer on the wall."

end

the_9_beer_bottles_song_recursive 9