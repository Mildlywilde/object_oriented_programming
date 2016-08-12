require_relative 'item.rb'

class Receipt

  def initialize(item_array)
    @item_array = item_array
  end

  def print_receipt

    @item_array.each do |item|
      puts item.value
    end

  end

  # def calculate_tax
  #   if @item.tax_exempt == true
  #     price = @item.value
  #   else
  #     price = @item.value + (@item.value / 10.0)
  #   end
  #   puts price
  # end



end
