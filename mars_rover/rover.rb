class Rover

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def read_instruction(instructions)
    instructions.split("").each do |command|

    end
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
    puts "facing #{@direction}"
  end

  def move
    case @direction
    when "N" then @y += 1
    when "E" then @x += 1
    when "S" then @y -= 1
    when "W" then @x -= 1
    end

    puts "at location #{@x}, #{@y}"
  end
end
