class Optional

  attr_accessor :name, :price_model, :price

  def initialize(product = {})
    @name = product[:name]
    @price_model = product[:price_model]
    @price = @price_model == 'fixed' ? product[:price] : nil
  end
end
