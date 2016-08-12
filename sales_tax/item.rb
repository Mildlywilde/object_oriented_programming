class Item

  attr_reader :tax_exempt, :imported
  
  def initialize(tax_exempt, imported)
    @tax_exempt = tax_exempt
    @imported = imported
  end

end
