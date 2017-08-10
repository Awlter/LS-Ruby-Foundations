# # 14
# contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
#             ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

# contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

# contacts.each_key.with_index do |key, id|
#   data = contact_data[id]
#   contact = contacts[key]

#   [:email, :address, :phone].each_with_index do |info, id|
#     contact[info] = data[id]
#   end
# end

# p contacts

# # 16

a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

p a.map {|string| string.split(' ')}.flatten