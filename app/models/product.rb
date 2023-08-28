class Product
  # attr_reader :price, :from, :to
  attr_accessor :name, :price_model, :price, :tiers

  def initialize(product = {})
    @name = product[:name]
    @price_model = product[:price_model]
    @price = @price_model == 'fixed' ? product[:price] : nil
    @tiers = product[:tiers] || nil
  end
end
