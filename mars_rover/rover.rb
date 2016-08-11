class Rover

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def read_instruction(instructions = gets.chomp)
    instructions.split("").each do |command|
      case command
      when "L" then self.turn("L")
      when "R" then self.turn("R")
      when "M" then self.move
      end
    end
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
    when "N" then @y += 1
    when "E" then @x += 1
    when "S" then @y -= 1
    when "W" then @x -= 1
    end
  end
end

puts "enter starting location for rover 1"
input = gets.chomp.split(" ")
wall_e = Rover.new(input[0].to_i, input[1].to_i, input[2])
puts "input instructions"
wall_e_finish = wall_e.read_instruction

puts "enter starting location for rover 2"
input = gets.chomp.split(" ")
johnny5 = Rover.new(input[0].to_i, input[1].to_i, input[2])
puts "input instructions"
johnny5_finish = johnny5.read_instruction

puts wall_e_finish
puts johnny5_finish
