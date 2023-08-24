class ShoppingCart
  attr_accessor :name, :quantity, :unit_price, :total_price

  def initialize(attributes = {})
    @name = attributes[:name]
    @quantity = attributes[:quantity]
    @unit_price = attributes[:unit_price]
    @total_price = attributes[:total_price]
  end
end
