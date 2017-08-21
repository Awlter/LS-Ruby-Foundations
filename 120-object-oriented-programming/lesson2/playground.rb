class FarmAnimal
  def speak
    "#{self.class} says "
  end
end

class Cow < FarmAnimal
  def speak
    super + "mooooooo!"
  end
end

puts Cow.new.speak # => "Cow says mooooooo!"