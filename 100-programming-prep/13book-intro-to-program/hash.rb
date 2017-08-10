# # 1 immediate family members

# family = {  uncles: ["bob", "joe", "steve"],
#             sisters: ["jane", "jill", "beth"],
#             brothers: ["frank","rob","david"],
#             aunts: ["mary","sally","susan"]
#           }

# immediate_family = family.select do |relative, _|
#   relative == :sisters || relative == :brothers
# end

# p immediate_family.values.flatten

# # 2

# hash_1 = {he: 'neurotic', me: 'stress-free'}
# hash_2 = {her: 'meritocracy'}

# p hash_1.merge(hash_2)

# p hash_1, hash_2

# p hash_1.merge!(hash_2)

# p hash_1

# # 6 Anagram

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
anagram = {}

words.each do |word|
  sorted = word.split('').sort

  if anagram.has_key?(sorted)
    anagram[sorted].push(word)
  else
    anagram[sorted] = [word]
  end
end

p anagram.values.select {|words| words.length > 1}