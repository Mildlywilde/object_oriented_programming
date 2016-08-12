class Item

  attr_reader :tax_exempt, :imported, :value

  def initialize(tax_exempt, imported, value)
    @tax_exempt = tax_exempt
    @imported = imported
    @value = value
  end

end
