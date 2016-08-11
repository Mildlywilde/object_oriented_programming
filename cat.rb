class Cat

  def initialize(name, preferred_food, meal_time)
    @name = name
    @preferred_food = preferred_food
    @meal_time = meal_time
  end

  def eats_at
    if (@meal_time - 12) >= 0
      return "#{@meal_time - 12}PM"
    else
      return "#{@meal_time}AM"
    end
  end

  def meow
    return "My name is #{@name} and I eat #{@preferred_food} at #{self.eats_at}"
  end

end

cat1 = Cat.new("Marge", "tuna", 20)
cat2 = Cat.new("Boris", "the hearts of my enemies", 18)

puts cat1.meow
puts cat2.meow
