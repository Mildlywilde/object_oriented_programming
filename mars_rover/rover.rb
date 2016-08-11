class Rover

  @@rover_locations = []

  def initialize(x, y, direction, plateau)
    @x = x
    @y = y
    @direction = direction
    @plateau = plateau
  end

  def read_instruction(instructions = gets.chomp)
    instructions.split("").each do |command|
      case command
      when "L" then self.turn("L")
      when "R" then self.turn("R")
      when "M" then self.move
      end
    end
    @@rover_locations << [@x, @y]
    puts @@rover_locations
    return "#{@x} #{@y} #{@direction}"
  end

  def turn(command)
    case command
    when "L"
      case @direction
      when "N" then @direction = "W"
      when "E" then @direction = "N"
      when "S" then @direction = "E"
      when "W" then @direction = "S"
      end
    when "R"
      case @direction
      when "N" then @direction = "E"
      when "E" then @direction = "S"
      when "S" then @direction = "W"
      when "W" then @direction = "N"
      end
    end
  end

  def move
    case @direction
    when "N" then @y += 1 unless @y + 1 > @plateau.y || @@rover_locations.include?([@x, @y + 1])
    when "E" then @x += 1 unless @x + 1 > @plateau.x || @@rover_locations.include?([@x + 1, @y])
    when "S" then @y -= 1 unless @y - 1 < 0 || @@rover_locations.include?([@x, @y -1])
    when "W" then @x -= 1 unless @x - 1 < 0 || @@rover_locations.include?([@x -1, @x])
    end
  end
end

class Plateau

  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

end

puts "enter plateau size"
input = gets.chomp.split(" ")
plateau = Plateau.new(input[0].to_i, input[1].to_i)

puts "enter starting location for rover 1"
input = gets.chomp.split(" ")
wall_e = Rover.new(input[0].to_i, input[1].to_i, input[2], plateau)
puts "input instructions"
wall_e_finish = wall_e.read_instruction

puts "enter starting location for rover 2"
input = gets.chomp.split(" ")
johnny5 = Rover.new(input[0].to_i, input[1].to_i, input[2], plateau)
puts "input instructions"
johnny5_finish = johnny5.read_instruction

puts wall_e_finish
puts johnny5_finish
