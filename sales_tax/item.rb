class Item

  attr_reader :tax_exempt, :imported, :value

  def initialize(quantity, name, value)
    @quantity = quantity
    @name = name
    # @tax_exempt = tax_exempt
    # @imported = imported
    @value = value
  end


end
