# def dot_separated_ip_address?(input_string)
#   dot_separated_words = input_string.split(".")
#   return false if dot_separated_words.size != 4

#   while dot_separated_words.size > 0 do
#     word = dot_separated_words.pop
#     break unless is_an_ip_number?(word)
#   end

#   return true
# end

def test_return(arr)
  arr.each do |word|
    return true if word.size < 4
  end

  false
end

puts test_return(['1234', '1234'])