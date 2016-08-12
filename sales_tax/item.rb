class Item

  attr_reader :tax_exempt, :imported, :value, :name

  def initialize(quantity, name, value, item_type)
    @quantity = quantity
    @name = name
    
    @value = value
    @item_type = item_type

    if name.include?("imported")
      @imported = true
    else
      @imported = false
    end
  end

  def tax_exempt?

    case @item_type
    when "food" then return true
    when "book" then return true
    when "medical" then return true
    else return false
    end

  end

end
