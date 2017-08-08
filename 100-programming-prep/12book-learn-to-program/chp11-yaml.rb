require 'yaml'

# file_name = 'temp.txt'

# test_array = [1, "2", '3']
# test_hash = {a: 'b', c: 'd'}

# p yaml_array = test_array.to_yaml
# p yaml_hash = test_hash.to_yaml

# File.open file_name, 'w' do |f|
#   f.write yaml_array
#   f.write yaml_hash
# end

# test = File.read file_name

# p test

# p YAML::load test

# # Exercise: Safer piture downloading

Dir.chdir '/Users/wangxuefei/Documents/pictures'

pic_names = Dir['/Users/wangxuefei/Pictures/**/*.{png,jpg}']

puts "What would you like to call this batch?"
batch_name = gets.chomp

puts
print "Downloading #{pic_names.length} files: "

pic_number = 1

pic_names.each do |name|
  print '.'

  new_name = if pic_number < 10
    "#{batch_name}0#{pic_number}.jpg"
  else
    "#{batch_name}#{pic_number}.jpg"
  end

  File.rename name, new_name

  pic_number += 1
end

puts
puts "Done."