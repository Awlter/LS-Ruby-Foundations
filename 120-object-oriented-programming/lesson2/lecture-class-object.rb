#1

# my version

# class Person
#   attr_accessor :first_name, :last_name

#   def initialize(first_name, last_name = '')
#     @first_name = first_name
#     @last_name = last_name
#   end

#   def name
#     last_name.empty? ? first_name : first_name + ' ' + last_name
#   end
# end

# reference answer

class Person
  attr_accessor :first_name, :last_name

  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parse_full_name(full_name)
  end

  def ==(other_object)
    name == other_object.name
  end

  private

  def parse_full_name(full_name)
    parts = full_name.split(' ')
    self.first_name = parts[0]
    self.last_name = parts[1] ? parts[1] : ''
  end
end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

p bob == rob