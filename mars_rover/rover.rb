class Rover

  #define class variable to store hash of current rover locations
  @@rover_locations = {}

  def initialize(x, y, direction = 'N', plateau)
    @x = x
    @y = y
    @direction = direction
    @plateau = plateau


#ensure rover will not spawn on top of another
    while @@rover_locations.values.include? [@x, @y]
        puts "There's already a rover there, enter new coordinates"
        input = gets.chomp.split(" ")
        @x = input[0].to_i
        @y = input[1].to_i
    end

#generate id and ensure id is unique
    id = rand(9999).to_s
    while @@rover_locations.keys.include?(id.to_sym)
      id = rand(9999).to_s
    end

    @id = id
    @@rover_locations[@id.to_sym] = [@x, @y]

  end

#translate instructions to Left, Right, and Move commands
  def read_instruction(instructions = gets.chomp)
    instructions.upcase.split("").each do |command|
      case command
      when "L" then self.turn("L")
      when "R" then self.turn("R")
      when "M" then self.move
      end
    end
    return "#{@x} #{@y} #{@direction}"
  end

#define turning behaviour
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

#define moving behaviour
  def move
    case @direction
    when "N" then @y += 1 unless @y + 1 > @plateau.y || @@rover_locations.values.include?([@x, @y + 1])
    when "E" then @x += 1 unless @x + 1 > @plateau.x || @@rover_locations.values.include?([@x + 1, @y])
    when "S" then @y -= 1 unless @y - 1 < 0 || @@rover_locations.values.include?([@x, @y -1])
    when "W" then @x -= 1 unless @x - 1 < 0 || @@rover_locations.values.include?([@x -1, @x])
    end
    @@rover_locations[@id.to_sym] = [@x, @y]
  end
end

#create plateau class to pass to rovers, ensuring they are on the same grid
class Plateau

  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

end

#uncomment the following code to make program run as specified on alexa
#leave commented to play with rovers on the command line

# puts "enter plateau size"
# input = gets.chomp.split(" ")
# plateau = Plateau.new(input[0].to_i, input[1].to_i)
#
# puts "enter starting location for rover wall_e"
# input = gets.chomp.upcase.split(" ")
# wall_e = Rover.new(input[0].to_i, input[1].to_i, input[2], plateau)
# puts "input instructions"
# wall_e_finish = wall_e.read_instruction
#
# puts "enter starting location for rover johnny5"
# input = gets.chomp.upcase.split(" ")
# johnny5 = Rover.new(input[0].to_i, input[1].to_i, input[2], plateau)
# puts "input instructions"
# johnny5_finish = johnny5.read_instruction
#
# puts wall_e_finish
# puts johnny5_finish
