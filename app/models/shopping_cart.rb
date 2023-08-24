class ShoppingCart
  attr_accessor :name, :quantity, :unit_price, :total_price, :final_total_price

  def initialize(attributes = {})
    @name = attributes[:name]
    @quantity = attributes[:quantity]
    @unit_price = attributes[:unit_price]
    @total_price = attributes[:total_price]
    @final_total_price = attributes[:final_total_price]
  end
end
