require_relative 'item.rb'

class Receipt

  def initialize(item_array)
    @item_array = item_array
    @total = 0
  end

  def print_receipt
    total_tax = 0
    @item_array.each do |item|
      sales_tax = 0
      import_tax = 0
      if item.tax_exempt? == false
        item_tax = ((item.value.to_i * 10) / 100.0).round(2)
        total_tax += item_tax
      end
      if item.imported == true
        import_tax = ((item.value.to_i * 5) / 100.0).round(2)
        total_tax += import_tax
      end

      puts "#{item.name} : #{item.value}"
      puts "Sales Taxes: #{total_tax}"
      @total += item.value.to_f
    end

    puts "Sales Taxes: #{total_tax}"
    puts "Total : #{@total + total_tax}"

  end





end
