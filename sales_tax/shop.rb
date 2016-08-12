require_relative 'item'
require_relative 'receipt'

shopping_list = []


while true do
  puts "Add an item to your list or type finish to see receipt"
  input = gets.chomp.split(" ")
  break if input.include?('finish')
  puts "enter type of item( food, book, medical, or other)"
  type = gets.chomp
  shopping_list << Item.new(input[0], input[1...-2].join(" "), input[-1], type)
  puts input
end

puts shopping_list

rec = Receipt.new(shopping_list)
rec.print_receipt
