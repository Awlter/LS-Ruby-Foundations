# 1

# arr = ['10', '11', '9', '7', '8']

# new_arr = arr.sort do |a, b|
#   b.to_i <=> a.to_i
# end

# p new_arr

# p arr.sort {|a,b| b.to_i <=> a.to_i }

# p arr.sort

# 2

# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]

# new_order = books.sort_by do |book|
#   book[:published].to_i
# end

# p new_order

# 3

# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

# arr3 = [['abc'], ['def'], {third: ['ghi']}]

# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

# p arr1[-1][-1][-1]

# p arr2[-1][:third].first

# p arr3[-1][:third][0][0]

# p hsh1['b'][-1]

# p hsh2[:third].keys[0]

# 4

# arr1 = [1, [2, 3], 4]

# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

# hsh1 = {first: [1, 2, [3]]}

# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

# arr1[1][1] = 4
# p arr1

# hsh2[['a']][:a][-1] = 4
# p hsh2

# 5

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# total = munsters.select do |k,v|
#   v['gender'] == 'male'
# end
# .reduce(0) do |sum, (k, v)|
#   sum + v['age']
# end

# p total

# 8

# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# hsh.each do |key, value|
#   value.each do |word|
#     word.chars.each {|char| puts char if ['a', 'e', 'i', 'o', 'u'].include? char.downcase}
#   end
# end

# 9

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# new_arr = arr.map do |sub_arr|
#   sub_arr.sort {|a, b| b <=> a}
# end

# p new_arr

# 10

# arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# arr.each do |hash|
#   hash.each {|k,_| hash[k] += 1}
# end

# p arr

# 11

# arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# new_arr = arr.map do |sub_arr|
#   sub_arr.select {|ele| ele % 3 == 0}
# end

# p new_arr

# 12

# arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# new_arr = arr.sort_by do |sub_arr|
#   sub_arr.select.with_index do |ele, indx|
#     indx % 2 == 0
#   end
# end

# p new_arr

# 14

# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }

# new_arr = hsh.map do |_, v|
#   if v[:type] == 'fruit'
#     v[:colors].map(&:capitalize)
#   else
#     v[:size].upcase
#   end
# end

# p new_arr

# 15

# Each UUID consists of 32 hexadecimal characters, and is typically broken into 5 sections like this 8-4-4-4-12 and represented as a string.

# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

UUID_NUM = ('0'..'9').to_a + %w(a b c d e f)

def uuid
  [8, 4, 4, 4, 12].map do |length|
    rand_char = ''
    length.times { rand_char << UUID_NUM.sample}
    rand_char
  end
  .join('-')
end

p uuid