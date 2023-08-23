class Product
  # attr_reader :price, :from, :to
  attr_accessor :name, :price_model, :price, :from, :to

  def initialize(product = {})
    @name = product[:name]
    @price_model = product[:price_model]
    @price = product[:price] || nil if @price_model == "tiered"
    @tiers = product[:tiers] || nil
  end

  def cost
    if @price_model == "fixed"
      @price
    elsif @price_model == "tiered"
      @tiers.each do |tier|
        if @from >= tier[:from] && @to <= tier[:to]
          return tier[:price]
        end
      end
    end
  end
end

# products:
#   orange:
#     price_model: fixed
#     price: 12

#   apple:
#     price_model: tiered
#     tiers:
#     - from: 1
#       to: 10
#       price: 10
#     - from: 11
#       to: 20
#       price: 9
#     - from: 21
#       to: 30
#       price: 8
