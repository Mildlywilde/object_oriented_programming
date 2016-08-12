require_relative 'item.rb'

class Receipt

  def initialize(item)
    @item = item
  end

  def calculate_tax
    if @item.tax_exempt == true
      price = @item.value
    else
      price = @item.value + (@item.value / 10.0)
    end
    puts price
  end



end
