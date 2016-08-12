require_relative 'item'
require_relative 'receipt'

shopping_list = []


while true do
  puts "Add an item to your list or type finish to see receipt"
  input = gets.chomp.split(" ")
  break if input.include?('finish')
  shopping_list << Item.new(input[0], input[1..-2].join, input[-1])

end

puts shopping_list
